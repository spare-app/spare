variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = "spare-stage"
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = "list"
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = "list"
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = "list"
  default     = []
}
