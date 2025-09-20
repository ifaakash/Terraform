output "vpc_id" {
  value = module.networking.vpc_id
}

output "network_interface_id" {
  value = module.networking.network_interface_id
}

output "security_group_id" {
  value = module.networking.security_group_id
}
