variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "network_interface_id" {
  description = "Network interface ID for EC2 instance"
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs for EC2 instance"
  type        = list(string)
}

# variable "key_pair_name" {
#   description = "Key pair name for EC2 instance"
#   type        = string
# }

variable "default_tags" {
  description = "Default tags for resources deployment"
  type        = map(string)
}
