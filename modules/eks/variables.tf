# modules/eks/variables.tf

variable "cluster_name" {
  description = "name of the eks cluster"
  type        = string
}

variable "cluster_version" {
  description = "kubernetes version"
  type        = string
}

variable "subnet_ids" {
  description = "subnets for eks nodes"
  type        = list(string)
}

variable "vpc_id" {
  description = "vpc id where eks will be deployed" 
  type        = string
}

variable "tags" {
  description = "tags to apply to all resources"
  type = map(string)
  default = {}
}

