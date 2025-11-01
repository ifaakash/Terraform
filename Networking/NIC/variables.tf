variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "description" {
  description = "Network Interface card to attach with Instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to attach with Network Interface"
  type        = string
}

variable "sg_id" {
  description = "Security Group ID to attach with Network Interface"
  type        = string
}

variable "default_tags" {
  description = "Default tags for resources deployment"
  type        = map(string)
}
