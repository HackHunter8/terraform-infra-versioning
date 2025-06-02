# modules/bootstrap/main.tf

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "tf_state" {
  bucket = var.bucket_name
  force_destroy = true

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
    }
  } 
}

  lifecycle {
    prevent_destroy = false
  }

  tags = var.tags
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "lockID"

  attribute {
    name = "lockID"
    type = "S"
  }

  tags = var.tags
}
