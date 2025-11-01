output "vpc_id" {
  value = module.networking.vpc_id
}

output "security_group_id" {
  value = module.networking.security_group_id
}

output "public_subnet_id" {
  value       = module.networking.public_subnet_id
  description = "ID of the public subnet"
}

output "private_subnet_id" {
  value       = module.networking.private_subnet_id
  description = "ID of the private subnet"
}

# output "network_interface_id" {
#   value       = aws_network_interface.nic.id
#   description = "Network Interface for networking"
# }

# output "private_network_interface_id" {
#   value       = module.networking.private_network_interface_id
#   description = "Network interface ID for private networking"
# }
