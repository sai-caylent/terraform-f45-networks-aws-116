account_name = "f45"
env_name = "dev"
azs = [ "us-east-1a","us-east-1b","us-east-1c" ]
cidr = "172.20.0.0/19"
public_subnets = [ "172.20.0.0/24","172.20.1.0/24","172.20.2.0/24" ]
private_subnets = [ "172.20.4.0/24","172.20.5.0/24","172.20.6.0/24" ]
database_subnets = [ "172.20.8.0/24","172.20.9.0/24","172.20.10.0/24" ]
intra_subnets = [ "172.20.12.0/24","172.20.13.0/24","172.20.14.0/24" ]
# alb_https_certificate_arn = "arn:aws:acm:us-east-1:131578276461:certificate/88e91cba-58db-4483-a268-c5062850ae30"
tags = {
     environment = "Development"
     owner       = "F45"
     project     = "F45"
}


