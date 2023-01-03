# TODO: resolve checkov and tfsec skipped rules

locals {
  vpc_name    = var.env_name == "" ? "primary" : var.env_name
  alb_name    = var.env_name == "" ? "primary-${var.account_name}" : "${var.env_name}-${var.account_name}"
  logs_suffix = var.env_name == "" ? var.account_name : "${var.env_name}-${var.account_name}"
}

# VPC
#tfsec:ignore:aws-vpc-no-excessive-port-access tfsec:ignore:aws-vpc-no-public-ingress-acl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name = "${local.vpc_name}-vpc-${var.account_name}"
  azs  = var.azs
  cidr = var.cidr

  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = false
  enable_dns_hostnames                   = true
  enable_dns_support                     = true
  enable_nat_gateway                     = true
  single_nat_gateway                     = true

  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  database_subnets    = var.database_subnets
  # elasticache_subnets = var.elasticache_subnets
  # redshift_subnets    = var.redshift_subnets
  intra_subnets       = var.intra_subnets

  tags = var.tags
}
# TODO: should deny access not coming from the VPC https://github.com/terraform-aws-modules/terraform-aws-vpc/blob/41da6881e295ff5e94bbf97b41018e7c550c7285/examples/complete-vpc/main.tf#L211
data "aws_iam_policy_document" "generic_endpoint_policy" {
  #checkov:skip=CKV_AWS_1:for now allowing full "*-*" administrative privileges
  #checkov:skip=CKV_AWS_49:for now allowing wildcard in actions
  #checkov:skip=CKV_AWS_107:for now allowing credentials exposure
  #checkov:skip=CKV_AWS_108:for now allowing data exfiltration
  #checkov:skip=CKV_AWS_109:for now allowing permissions management / resource exposure without constraints
  #checkov:skip=CKV_AWS_110:for now allowing privilege escalation
  #checkov:skip=CKV_AWS_111:for now allowing write access without constraints
  statement {
    actions   = ["*"]
    resources = ["*"]
    effect    = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

module "endpoints" {
  source  = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  version = "3.14.0"

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