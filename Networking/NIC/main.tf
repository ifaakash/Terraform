# Create a network interface with EIP and Security group attached
resource "aws_network_interface" "nic" {
  description     = var.description
  subnet_id       = var.subnet_id
  security_groups = [var.sg_id]
  tags            = var.default_tags
}
