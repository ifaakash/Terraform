output "vpc_id" {
  value = aws_vpc.main.id
}

# output "public_network_interface_id" {
#   value       = aws_network_interface.public.id
#   description = "Network Interface for public networking"
# }

# output "private_network_interface_id" {
#   value       = aws_network_interface.private.id
#   description = "Network interface ID for private networking"
# }

output "security_group_id" {
  value = aws_security_group.main.id
}

output "private_subnet_id" {
  value       = aws_subnet.private.id
  description = "ID of the private subnet"
}

output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "ID of the public subnet"
}
