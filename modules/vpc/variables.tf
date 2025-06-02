# modules/vpc/variables.tf

variable "cidr_block" {
  description = "cidr block for the vpc"
  type        = string
}

variable "name_prefix" {
  description = "prefix for naming resources" 
  type        = string
}
