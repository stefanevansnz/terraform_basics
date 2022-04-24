# VPC
resource "aws_vpc" "stef_vpc_a" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "stef_vpc_a_terraform"
    }
}

# Subnets
resource "aws_subnet" "stef_vpc_a_subnet_private" {
  vpc_id = "${aws_vpc.stef_vpc_a.id}"
  cidr_block = "10.0.0.0/24"
}