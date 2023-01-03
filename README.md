# terraform-module-template
## How to use this template
1. Generate the new repository based on this template.
2. Edit the files from the root as you need
   1. main.tf
   2. *.tfvars files
   


## Modules used in this template
1. terraform-aws-modules/vpc/aws
2. terraform-aws-modules/security-group/aws
3. terraform-aws-modules/vpc/aws//modules/vpc-endpoints

# you need to download the modules before you can use them
# to download the modules, please run terraform init

## to deploy this on dev account
1. run terraforom plan -var-file dev.tfvars 
2. run terraforom apply -var-file dev.tfvars


## to deploy this on production account
1. run terraforom plan -var-file prod.tfvars 
2. run terraforom apply -var-file prod.tfvars