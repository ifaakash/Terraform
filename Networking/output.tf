output "vpc_id" {
  value = module.networking.vpc_id
}

output "security_group_id" {
  value = module.networking.security_group_id
}

# output "network_interface_id" {
#   value       = aws_network_interface.nic.id
#   description = "Network Interface for networking"
# }

# output "private_network_interface_id" {
#   value       = module.networking.private_network_interface_id
#   description = "Network interface ID for private networking"
# }
