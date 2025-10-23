##################### IAM #####################

variable "role_name" {
  description = "Name of IAM role to be attachecd with the EC2 instance"
  type        = string
}

variable "instance_profile_name" {
  description = "Name of IAM Instance profile to be attachecd with the EC2 instance"
  type        = string
}
