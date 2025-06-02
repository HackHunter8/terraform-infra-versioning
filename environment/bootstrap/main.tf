# environment/bootstrap/main.tf

module bootstrap {
  source              = "../../modules/bootstrap"
  aws_region          = "us-east-1"
  bucket_name         = "terraform-infra-versioning-state"
  dynamodb_table_name = "terraform-lock-table"
  tags = {
    project = "terraform-infra-versioning"
    env     = "bootstrap"
  }
}

