locals {
  vpc_name    = var.env_name == "" ? "primary" : var.env_name
  alb_name    = var.env_name == "" ? "primary-${var.account_name}" : "${var.env_name}-${var.account_name}"
  logs_suffix = var.env_name == "" ? var.account_name : "${var.env_name}-${var.account_name}"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "${local.vpc_name}-vpc-${var.account_name}"
  azs  = var.azs
  cidr = var.cidr

  create_database_subnet_group           = var.create_database_subnet_group
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = false
  enable_dns_hostnames                   = true
  enable_dns_support                     = true
  enable_nat_gateway                     = false
  single_nat_gateway                     = false

  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  database_subnets    = var.database_subnets
  intra_subnets       = var.intra_subnets

# add network acl to retrict access 
  private_dedicated_network_acl = true
  private_inbound_acl_rules = var.private_inbound_acl_rules
  public_dedicated_network_acl = true
  public_inbound_acl_rules = var.public_inbound_acl_rules
  database_dedicated_network_acl = true
  database_inbound_acl_rules = var.database_inbound_acl_rules 
  intra_dedicated_network_acl = true
  intra_inbound_acl_rules = var.intra_inbound_acl_rules


  tags = var.tags
}
# Endpoints

module "sg_vpc_endpoints" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "4.16.2"
  name        = "ecr_vpc_endpoint"
  description = "Allow ECR traffic"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = module.vpc.private_subnets_cidr_blocks
  ingress_rules       = ["all-all"]
  egress_rules        = ["all-all"]

  tags = merge(
    var.tags,
    {
      Name = "ecr_vpc_endpoint"
    }
  )
}

# Deny access to all except from vpc
data "aws_iam_policy_document" "generic_endpoint_policy" {
  statement {
    effect    = "Deny"
    actions   = ["*"]
    resources = ["*"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    condition {
      test     = "StringNotEquals"
      variable = "aws:SourceVpc"

      values = [module.vpc.vpc_id]
    }
  }
}

module "endpoints" {
  source  = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  version = "3.18.1"

  vpc_id             = module.vpc.vpc_id
  security_group_ids = [module.sg_vpc_endpoints.security_group_id]

  endpoints = {
    s3 = {
      service         = "s3"
      service_type    = "Gateway"
      route_table_ids = flatten([module.vpc.private_route_table_ids, module.vpc.public_route_table_ids])
      policy          = data.aws_iam_policy_document.generic_endpoint_policy.json
      tags = merge(
        var.tags,
        {
          Name = "s3-vpc-endpoint"
        }
      )
    },
    ecr_api = {
      service             = "ecr.api"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      policy              = data.aws_iam_policy_document.generic_endpoint_policy.json
      tags = merge(
        var.tags,
        {
          Name = "ecr-api-vpc-endpoint"
        }
      )
    },
    ecr_dkr = {
      service             = "ecr.dkr"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      policy              = data.aws_iam_policy_document.generic_endpoint_policy.json
      tags = merge(
        var.tags,
        {
          Name = "ecr-dkr-vpc-endpoint"
        }
      )
    },
  }

  tags = var.tags
}

# # Flowlog
# resource "aws_flow_log" "flowlog" {
#   iam_role_arn    = aws_iam_role.flowlog.arn
#   log_destination = aws_cloudwatch_log_group.flowlog.arn
#   traffic_type    = "ALL"
#   vpc_id          = module.vpc.vpc_id
# }

# #tfsec:ignore:aws-cloudwatch-log-group-customer-key
# resource "aws_cloudwatch_log_group" "flowlog" {
#   #checkov:skip=CKV_AWS_158: TODO: validate if kms is required
#   name              = "${local.vpc_name}-vpc-flowlog-${var.env_name}"
#   retention_in_days = 180
#   tags              = var.tags
# }

# resource "aws_iam_role" "flowlog" {
#   name = "${local.vpc_name}-vpc-flowlog-${var.account_name}"
#   assume_role_policy = jsonencode({
#     Version : "2012-10-17"
#     Statement : [
#       {
#         Sid : ""
#         Effect : "Allow"
#         Principal : {
#           Service : "vpc-flow-logs.amazonaws.com"
#         }
#         Action : "sts:AssumeRole"
#       }
#     ]
#   })
# }

# #tfsec:ignore:aws-iam-no-policy-wildcards
# resource "aws_iam_role_policy" "flowlog" {
#   name = "${local.vpc_name}-vpc-flowlog-${var.account_name}"
#   role = aws_iam_role.flowlog.id
#   policy = jsonencode({
#     Version : "2012-10-17"
#     Statement : [
#       {
#         Action : [
#           "logs:CreateLogGroup",
#           "logs:CreateLogStream",
#           "logs:PutLogEvents",
#           "logs:DescribeLogGroups",
#           "logs:DescribeLogStreams",
#         ]
#         Effect : "Allow"
#         Resource : "${aws_cloudwatch_log_group.flowlog.arn}:*"
#       }
#     ]
#   })
# }