variable "account_name" {
  type        = string
  description = "The name or alias of the account where the resources will be deployed."
}

variable "env_name" {
  type        = string
  description = "The name of the environment to which the resources belong."
  default     = ""
}

variable "azs" {
  type        = list(string)
  description = "A list of availability zones names or ids in the region."
}

variable "cidr" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "public_subnets" {
  type        = list(string)
  description = "A list of public subnets inside the VPC."
}

variable "private_subnets" {
  type        = list(string)
  description = "A list of private subnets inside the VPC."
  default = []
}

variable "database_subnets" {
  type        = list(string)
  description = "A list of database subnets."
  default     = []
}

variable "elasticache_subnets" {
  type        = list(string)
  description = "A list of elasticache subnets."
  default     = []
}

variable "redshift_subnets" {
  type        = list(string)
  description = "A list of redshift subnets."
  default     = []
}

variable "intra_subnets" {
  type        = list(string)
  description = "A list of intra subnets."
  default     = []
}

variable "tags" {
  type        = map(any)
  description = "The tags map to associate to the resources."
  default     = {}
}
