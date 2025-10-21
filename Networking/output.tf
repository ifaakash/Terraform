output "vpc_id" {
  value = module.networking.vpc_id
}

output "security_group_id" {
  value = module.networking.security_group_id
}

output "public_network_interface_id" {
  value       = module.networking.public_network_interface_id
  description = "Network Interface for public networking"
}

output "private_network_interface_id" {
  value       = module.networking.private_network_interface_id
  description = "Network interface ID for private networking"
}
