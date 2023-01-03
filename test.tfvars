account_name = "f45"
env_name = "test"
azs = [ "us-east-2a" ]
cidr = "172.20.0.0/19"
public_subnets = [ "172.20.0.0/24" ]
private_subnets = [ "172.20.4.0/24" ]
database_subnets = [ "172.20.8.0/24" ]
create_database_subnet_group = false
intra_subnets = [ "172.20.12.0/24"]

private_inbound_acl_rules = [ { "cidr_block": "172.20.0.0/19", "from_port": 0, "protocol": "-1", "rule_action": "allow", "rule_number": 100, "to_port": 0 } ]
public_inbound_acl_rules = [ { "cidr_block": "172.20.0.0/19", "from_port": 0, "protocol": "-1", "rule_action": "allow", "rule_number": 100, "to_port": 0 } ]
database_inbound_acl_rules = [ { "cidr_block": "172.20.0.0/19", "from_port": 0, "protocol": "-1", "rule_action": "allow", "rule_number": 100, "to_port": 0 } ]
intra_inbound_acl_rules = [ { "cidr_block": "172.20.0.0/19", "from_port": 0, "protocol": "-1", "rule_action": "allow", "rule_number": 100, "to_port": 0 } ]

tags = {
     environment = "test"
     owner       = "sai"
     project     = "f45"
     Terraform = "true"
}


