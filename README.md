# AWS VPC Terraform module
## How to use this template
1. Generate the new repository based on this template.
2. Edit the files from the root as you need
   1. main.tf
   2. versions.tf
   3. variables.tf
   4. outputs.tf
   5. .tfvars

## Modules used in this template.
1. terraform-aws-modules/vpc/aws (version: 3.18.1)
2. terraform-aws-modules/security-group/aws (version : 4.16.2)
3. terraform-aws-modules/vpc/aws//modules/vpc-endpoints (version: 3.18.1)

## you need to download the modules before you can use them
please run terraform init to download the modules

## to deploy this on dev account
1. run terraforom plan -var-file dev.tfvars 
2. run terraforom apply -var-file dev.tfvars


## to deploy this on production account
1. run terraforom plan -var-file prod.tfvars 
2. run terraforom apply -var-file prod.tfvars


