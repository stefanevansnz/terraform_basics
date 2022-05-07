module "vpc_a" {
    source = "./modules/vpc"
    VPC_CIDR = "10.0.0.0/16"
    VPC_NAME = "stef_vpc_a_terraform"

    VPC_PRIVATE_SUBNET_CIDR = "10.0.0.0/24"
    VPC_PRIVATE_SUBNET_NAME = "stef_vpc_a_subnet_private_terraform"    

    VPC_PUBLIC_SUBNET_REQUIRED = true
    VPC_PUBLIC_SUBNET_CIDR = "10.0.1.0/24"
    VPC_PUBLIC_SUBNET_NAME = "stef_vpc_a_subnet_public_terraform"
    VPC_SG_NAME = "stef_vpc_sg"
    VPC_SG_CIDR_ACCESS = "122.58.225.248/32"
}

module "vpc_b" {
    source = "./modules/vpc"
    VPC_CIDR = "10.1.0.0/16"
    VPC_NAME = "stef_vpc_b_terraform"

    VPC_PRIVATE_SUBNET_CIDR = "10.1.0.0/24"
    VPC_PRIVATE_SUBNET_NAME = "stef_vpc_b_subnet_private_terraform"    
}

# module "vpc_c" {
#     source = "./modules/vpc"
#     VPC_CIDR = "10.2.0.0/16"
#     VPC_NAME = "stef_vpc_c_terraform"

#     VPC_PRIVATE_SUBNET_CIDR = "10.2.0.0/24"
#     VPC_PRIVATE_SUBNET_NAME = "stef_vpc_c_subnet_private_terraform"    
# }