##################### NETWORKING #####################

variable "network_interface_id" {
  description = "Network interface ID for EC2 instance"
  type        = string
}

variable "instance_profile_name" {
  description = "Name of IAM Instance profile to be attachecd with the EC2 instance"
  type        = string
}

##################### DEFAULT TAGS #####################

variable "default_tags" {
  description = "Default tags for resources deployment"
  type        = map(string)
}
