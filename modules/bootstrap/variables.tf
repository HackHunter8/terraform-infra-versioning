# modules/bootstrap/variables.tf

variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources"
}

variable "bucket_name" {
  type        = string
  description = "Name of s3 bucket to store remote state"
}

variable "dynamodb_table_name" {
  type        = string
  description = "Name of dynamodb table for state locking"
}

variable "tags" {
  type         = map(string)
  description  = "Tags to apply to all resources"
  default      = {}
}

