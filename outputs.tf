# output "vpc_id" {
#   value       = module.vpc.vpc_id
#   description = "The ID of the VPC"
# }

# output "vpc_arn" {
#   value       = module.vpc.vpc_arn
#   description = "The ARN of the VPC"
# }

# output "vpc_cidr_block" {
#   value       = module.vpc.vpc_cidr_block
#   description = "The CIDR block of the VPC"
# }

# output "default_security_group_id" {
#   value       = module.vpc.default_security_group_id
#   description = "The ID of the security group created by default on VPC creation"
# }

# output "azs" {
#   value       = module.vpc.azs
#   description = "A list of availability zones specified as argument to this module"
# }


# output "private_subnets" {
#   value       = module.vpc.private_subnets
#   description = "List of IDs of private subnets"
# }

# output "private_subnet_arns" {
#   value       = module.vpc.private_subnet_arns
#   description = "List of ARNs of private subnets"
# }

# output "private_subnets_cidr_blocks" {
#   value       = module.vpc.private_subnets_cidr_blocks
#   description = "List of cidr_blocks of private subnets"
# }

# output "public_subnets" {
#   value       = module.vpc.public_subnets
#   description = "List of IDs of public subnets"
# }

# output "public_subnet_arns" {
#   value       = module.vpc.public_subnet_arns
#   description = "List of ARNs of public subnets"
# }

# output "public_subnets_cidr_blocks" {
#   value       = module.vpc.public_subnets_cidr_blocks
#   description = "List of cidr_blocks of public subnets"
# }

# output "database_subnets" {
#   value       = module.vpc.database_subnets
#   description = "List of IDs of database subnets"
# }

# output "database_subnet_arns" {
#   value       = module.vpc.database_subnet_arns
#   description = "List of ARNs of database subnets"
# }

# output "database_subnets_cidr_blocks" {
#   value       = module.vpc.database_subnets_cidr_blocks
#   description = "List of cidr_blocks of database subnets"
# }

# output "redshift_subnets" {
#   value       = module.vpc.redshift_subnets
#   description = "List of IDs of redshift subnets"
# }

# output "redshift_subnet_arns" {
#   value       = module.vpc.redshift_subnet_arns
#   description = "List of ARNs of redshift subnets"
# }

# output "redshift_subnets_cidr_blocks" {
#   value       = module.vpc.redshift_subnets_cidr_blocks
#   description = "List of cidr_blocks of redshift subnets"
# }

# output "elasticache_subnets" {
#   value       = module.vpc.elasticache_subnets
#   description = "List of IDs of elasticache subnets"
# }

# output "elasticache_subnet_arns" {
#   value       = module.vpc.elasticache_subnet_arns
#   description = "List of ARNs of elasticache subnets"
# }

# output "elasticache_subnets_cidr_blocks" {
#   value       = module.vpc.elasticache_subnets_cidr_blocks
#   description = "List of cidr_blocks of elasticache subnets"
# }

# output "intra_subnets" {
#   value       = module.vpc.intra_subnets
#   description = "List of IDs of intra subnets"
# }

# output "intra_subnet_arns" {
#   value       = module.vpc.intra_subnet_arns
#   description = "List of ARNs of intra subnets"
# }

# output "intra_subnets_cidr_blocks" {
#   value       = module.vpc.intra_subnets_cidr_blocks
#   description = "List of cidr_blocks of intra subnets"
# }

# output "endpoints_security_group_id" {
#   value       = module.sg_vpc_endpoints.security_group_id
#   description = "The ID of the security group used by the VPC endpoints"
# }

# output "endpoints" {
#   value       = module.endpoints.endpoints
#   description = "Array containing the full resource object and attributes for all endpoints created"
# }

# output "alb_security_group_id" {
#   value       = module.sg_alb.security_group_id
#   description = "The ID of the security group used by the load balancer"
# }

# output "alb_id" {
#   value       = aws_alb.alb.id
#   description = "The ARN of the load balancer"
# }

# output "alb_arn" {
#   value       = aws_alb.alb.arn
#   description = "The ARN of the load balancer"
# }

# output "alb_dns_name" {
#   value       = aws_alb.alb.dns_name
#   description = "The DNS name of the load balancer"
# }

# output "alb_zone_id" {
#   value       = aws_alb.alb.zone_id
#   description = "The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)"
# }

# output "alb_http_listener_id" {
#   value       = aws_alb_listener.http.id
#   description = "The ARN of the HTTP listener"
# }

# output "alb_http_listener_arn" {
#   value       = aws_alb_listener.http.arn
#   description = "The ARN of the HTTP listener"
# }

# output "alb_https_listener_id" {
#   value       = aws_alb_listener.https.id
#   description = "The ARN of the HTTPS listener"
# }

# output "alb_https_listener_arn" {
#   value       = aws_alb_listener.https.arn
#   description = "The ARN of the HTTPS listener"
# }

# output "alb_https_listener_certificate_arn" {
#   value       = aws_alb_listener.https.certificate_arn
#   description = "The ARN of the default SSL server certificate"
# }

# output "alb_https_listener_ssl_policy" {
#   value       = aws_alb_listener.https.ssl_policy
#   description = "The name of the SSL policy used by the HTTPS listener"
# }
