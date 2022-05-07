# VPC
resource "aws_vpc" "vpc" {
    cidr_block = var.VPC_CIDR
    tags = {
        Name = var.VPC_NAME
    }
}

# Private Subnet
resource "aws_subnet" "stef_vpc_subnet_private" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.VPC_PRIVATE_SUBNET_CIDR
    tags = {
        Name = var.VPC_PRIVATE_SUBNET_NAME
    }  
}

# Public Subnet
resource "aws_subnet" "stef_vpc_subnet_public" {
  count = var.VPC_PUBLIC_SUBNET_REQUIRED ? 1 : 0
  vpc_id = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  cidr_block = var.VPC_PUBLIC_SUBNET_CIDR
    tags = {
        Name = var.VPC_PUBLIC_SUBNET_NAME
    }  
}
# IGW
resource "aws_internet_gateway" "stef_vpc_igw" {
  count = var.VPC_PUBLIC_SUBNET_REQUIRED ? 1 : 0    
  vpc_id = aws_vpc.vpc.id
}


# Routing table for public subnet
resource "aws_route_table" "stef_vpc_public_route_table" {
  count = var.VPC_PUBLIC_SUBNET_REQUIRED ? 1 : 0    
  vpc_id = aws_vpc.vpc.id
}

# Routing table for public subnet
resource "aws_route" "stef_vpc_public_internet_gateway_route" {
  count = var.VPC_PUBLIC_SUBNET_REQUIRED ? 1 : 0    
  route_table_id         = aws_route_table.stef_vpc_public_route_table[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.stef_vpc_igw[0].id
}

# Route table associations 
resource "aws_route_table_association" "stef_vpc_public_route_table_association" {
  count = var.VPC_PUBLIC_SUBNET_REQUIRED ? 1 : 0    
  subnet_id      = aws_subnet.stef_vpc_subnet_public[0].id
  route_table_id = aws_route_table.stef_vpc_public_route_table[0].id
}

# Security Group
resource "aws_security_group" "stef_vpc_public_security_group" {
  count = var.VPC_PUBLIC_SUBNET_REQUIRED ? 1 : 0      
  vpc_id      = aws_vpc.vpc.id
  depends_on  = [aws_vpc.vpc]
  ingress {
    description = "SSH to VPC"    
    from_port = "22"
    to_port   = "22"
    protocol  = "tcp"
    cidr_blocks = [var.VPC_SG_CIDR_ACCESS]
  }
    tags = {
        Name = var.VPC_SG_NAME
    }    

}