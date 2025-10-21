# Deploy a VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags                 = merge({ "Name" : "${var.prefix}-vpc" }, var.default_tags)
}

# Deploy a public subnet
resource "aws_subnet" "public" {
  cidr_block = var.public_subnet_cidr
  vpc_id     = aws_vpc.main.owner_id
  tags       = merge({ "Name" : "${var.prefix}-public-subnet" }, var.default_tags)
}

# Deploy a public subnet
resource "aws_subnet" "private" {
  cidr_block = var.private_subnet_cidr
  vpc_id     = aws_vpc.main.owner_id
  tags       = merge({ "Name" : "${var.prefix}-private-subnet" }, var.default_tags)
}

# Deploy a Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags   = merge({ "Name" : "${var.prefix}-igw" }, var.default_tags)
}

# Create routes for traffic from VPC, redirected to Internet
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  # Traffic routes to internet is going to IGW
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  # Internal traffic withing the VPC
  route {
    cidr_block = aws_vpc.main.cidr_block
    gateway_id = "local"
  }
  tags = merge({ "Name" : "${var.prefix}-route-tables" }, var.default_tags)
}
