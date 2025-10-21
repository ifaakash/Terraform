variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

##################### NETWORKING #####################

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for Public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for Private subnet"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames for the VPC"
  type        = bool
}

variable "enable_dns_support" {
  description = "Enable DNS Support for the VPC"
  type        = bool
}

variable "user_ip" {
  description = "User's IP address"
  type        = string
}

##################### DEFAULT TAGS #####################

variable "default_tags" {
  description = "Default tags for resources deployment"
  type        = map(string)
}
