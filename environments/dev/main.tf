# environments/dev/main.tf

terraform {
  backend "s3" {
    bucket         = "terraform-infra-versioning-state"
    key            = "dev/terraform.tfstate"   # change per env
    region         = "us-east-1"
    dynamodb_table = "terraform-infra-versioning-lock"
    encrypt        = true
  }
}

module "vpc" {
  source      = "../../modules/vpc"
  cidr_block  = "10.0.0.0/16"
  name_prefix = "dev"
}
