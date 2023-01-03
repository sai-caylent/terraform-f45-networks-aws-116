# terraform-module-template
## How to use this template
1. Generate the new repository based on this template.
2. Edit the files from the root as you need
   1. *.tfvars files


## Usage
```terraform
module "this" {
  source      = "app.terraform.io/negotiatus/template/module"
  version     = "0.0.1"
  secret_name = var.secret_name
}
```


