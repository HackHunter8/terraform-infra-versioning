# modules/vpc/variables.tf

variable "cidr_block" {
  description = "cidr block for the vpc"
  type        = string
}

variable "name_prefix" {
  description = "prefix for naming resources" 
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones to deploy subnets into"
  type        = list(string)
}
