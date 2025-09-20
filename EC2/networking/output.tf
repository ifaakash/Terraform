output "vpc_id" {
  value = aws_vpc.main.id
}

output "network_interface_id" {
  value = var.is_public ? aws_network_interface.public.id : ""
}

output "security_group_id" {
  value = aws_security_group.main.id
}
