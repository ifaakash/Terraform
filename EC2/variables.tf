variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

##################### NETWORKING #####################

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for Public subnet"
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

variable "is_public" {
  description = "Boolean indicating whether the instance is public or private"
  type        = bool
}

##################### INSTANCE #####################

variable "instance_type" {
  description = "Instance type for EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

# variable "network_interface_id" {
#   description = "Network interface ID for EC2 instance"
#   type        = string
# }

# variable "security_group_ids" {
#   description = "Security group IDs for EC2 instance"
#   type        = list(string)
# }

##################### DEFAULT TAGS #####################

variable "default_tags" {
  description = "Default tags for resources deployment"
  type        = map(string)
}
