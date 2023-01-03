account_name = "f45"
env_name = "prod"
azs = [ "us-east-1a","us-east-1b","us-east-1c" ]
cidr = "172.21.0.0/18"
public_subnets = [ "172.21.0.0/24","172.21.1.0/24","172.21.2.0/24" ]
private_subnets = [ "172.21.4.0/24","172.21.8.0/24","172.21.12.0/24" ]
database_subnets = [ "172.21.20.0/24","172.21.21.0/24","172.21.22.0/24" ]
intra_subnets = [ "172.21.24.0/24","172.21.25.0/24","172.21.26.0/24" ]
# alb_https_certificate_arn = "arn:aws:acm:us-east-1:131578276461:certificate/88e91cba-58db-4483-a268-c5062850ae30"
tags = {
     environment = "test"
     owner       = "sai"
     project     = "f45"
}


