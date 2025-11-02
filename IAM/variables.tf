##################### IAM #####################

variable "role_name" {
  description = "Name of IAM role to be attachecd with the EC2 instance"
  type        = string
}

variable "instance_profile_name" {
  description = "Name of IAM Instance profile to be attachecd with the EC2 instance"
  type        = string
}

##################### KEY PAIRS #####################

variable "kp_name" {
  description = "Name of the key pair for logging to Instance ( being used by Ansible )"
  type        = string
}
