# environments/dev/main.tf

terraform {
  backend "s3" {
    bucket         = "terraform-infra-versioning-state-david-2025"
    key            = "dev/terraform.tfstate"   
    region         = "us-east-1"
    dynamodb_table = "terraform-infra-versioning-lock"
    encrypt        = true
  }
}

provider "aws" {
   region = "us-east-1"
}

module "vpc" {
  source               = "../../modules/vpc"
  cidr_block           = "10.0.0.0/16"
  name_prefix          = "dev"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]
  availability_zones   = ["us-east-1a","us-east-1b"] 
}

module "eks" {
  source          = "../../modules/eks"
  cluster_name    = "dev_cluster"
  cluster_version = "1.29"
  subnet_ids      = module.vpc.private_subnet_ids
  vpc_id          = module.vpc.vpc_id

  tags = {
    environment = "dev"
  }
}