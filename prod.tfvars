account_name = "f45"
env_name = "prod"
azs = [ "us-east-1a","us-east-1b","us-east-1c" ]
cidr = "172.21.0.0/18"
public_subnets = [ "172.21.0.0/24","172.21.1.0/24","172.21.2.0/24" ]
private_subnets = [ "172.21.4.0/24","172.21.8.0/24","172.21.12.0/24" ]
database_subnets = [ "172.21.20.0/24","172.21.21.0/24","172.21.22.0/24" ]
intra_subnets = [ "172.21.24.0/24","172.21.25.0/24","172.21.26.0/24" ]

tags = {
     environment = "Production"
     owner       = "F45"
     project     = "F45"
}


