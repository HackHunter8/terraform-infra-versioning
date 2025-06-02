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

