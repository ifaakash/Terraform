output "eni" {
  value       = aws_network_interface.nic.id
  description = "ID for the network interface"
}
