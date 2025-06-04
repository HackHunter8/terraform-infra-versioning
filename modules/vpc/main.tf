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

resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    name = "${var.name_prefix}-public-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    name = "${var.name_prefix}-private-${count.index + 1}"
  }
}

