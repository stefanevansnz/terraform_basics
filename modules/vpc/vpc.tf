# VPC
resource "aws_vpc" "vpc" {
    cidr_block = var.VPC_CIDR
    tags = {
        Name = var.VPC_NAME
    }
}

# Subnets
resource "aws_subnet" "stef_vpc_subnet_private" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.VPC_PRIVATE_SUBNET_CIDR
    tags = {
        Name = var.VPC_PRIVATE_SUBNET_NAME
    }  
}

resource "aws_subnet" "stef_vpc_subnet_public" {
  count = var.VPC_PUBLIC_SUBNET_REQUIRED ? 1 : 0
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.VPC_PUBLIC_SUBNET_CIDR
    tags = {
        Name = var.VPC_PUBLIC_SUBNET_NAME
    }  
}