resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.namespace}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  count  = var.has_igw ? 1 : 0
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.namespace}-vpc"
  }
}

resource "aws_subnet" "public_subnet_" {
  count                   = length(var.public_subnets)
  availability_zone       = var.availability_zones[count.index]
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.vpc.id

  tags = {
    Name = "${var.namespace}-public-subnet-${count.index+1}"
  }
}

resource "aws_subnet" "private_subnet_" {
  count                   = length(var.private_subnets)
  availability_zone       = var.availability_zones[count.index]
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.vpc.id

  tags = {
    Name = "${var.namespace}-private-subnet-${count.index+1}"
  }
}

resource "aws_subnet" "database_subnet_" {
  count                   = length(var.database_subnets)
  availability_zone       = var.availability_zones[count.index]
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.vpc.id

  tags = {
    Name = "${var.namespace}-database-subnet-${count.index+1}"
  }
}