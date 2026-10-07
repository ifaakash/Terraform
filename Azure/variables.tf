variable "vnet_address_space" {
  description = "Address space for Virtual network"
  type        = string
  default     = "10.0.0.0/16"
}


variable "public_subnet_address_space" {
  description = "CIDR range for public subnet"
  type        = string
  default     = "10.0.0.0/17"
}

variable "private_subnet_address_space" {
  description = "CIDR range for private subnet"
  type        = string
  default     = "10.0.128.0/17"
}
