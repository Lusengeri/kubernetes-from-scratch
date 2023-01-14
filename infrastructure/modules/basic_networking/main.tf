resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.namespace}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  count = var.has_igw ? 1 : 0
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.namespace}-vpc"
  }
}