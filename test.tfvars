account_name = "f45"
env_name = "test"
azs = [ "us-east-2a" ]
cidr = "172.20.0.0/19"
public_subnets = [ "172.20.0.0/24" ]
private_subnets = [ "172.20.4.0/24" ]
database_subnets = [ "172.20.8.0/24" ]
intra_subnets = [ "172.20.12.0/24"]
# alb_https_certificate_arn = "arn:aws:acm:us-east-1:131578276461:certificate/88e91cba-58db-4483-a268-c5062850ae30"
tags = {
     environment = "test"
     owner       = "sai"
     project     = "f45"
}


