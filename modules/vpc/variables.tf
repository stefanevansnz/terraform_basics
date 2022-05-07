variable "VPC_CIDR" {
  type        = string
}

variable "VPC_NAME" {
  type        = string
}

variable "VPC_PRIVATE_SUBNET_CIDR" {
  type        = string
}

variable "VPC_PRIVATE_SUBNET_NAME" {
  type        = string
}


variable "VPC_PUBLIC_SUBNET_REQUIRED" {
  type        = bool
  default     = false
}

variable "VPC_PUBLIC_SUBNET_CIDR" {
  type        = string
  default     = ""
}

variable "VPC_PUBLIC_SUBNET_NAME" {
  type        = string
  default     = ""
}

variable "VPC_SG_NAME" {
  type        = string
  default     = ""  
}

variable "VPC_SG_CIDR_ACCESS" {
  type        = string
  default     = ""  
}