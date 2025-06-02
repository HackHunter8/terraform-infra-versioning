# modules/vpc/main.tf

resource "aws_vpc" "main" {
  cidr_block          = var.cidr_block
  enable_dns_support  = true
  enable_dns_hostnames = true

  tags = {
    name = "${var.name_prefix}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    name = "${var.name_prefix}-igw"
  }
}

