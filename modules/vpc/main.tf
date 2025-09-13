# modules/vpc/main.tf
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_a_cidr
  availability_zone = var.az_a
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-a"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_b_cidr
  availability_zone = var.az_b
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-b"
  }
}
