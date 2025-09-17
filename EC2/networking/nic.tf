# Create a network interface with EIP and Security group attached
resource "aws_network_interface" "main" {
  description     = "Elastic Network Interface to attach with Public EC2 Instance"
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.public.id]
  tags            = merge({ "Name" : "${var.prefix}-nic" }, var.default_tags)
}

resource "aws_eip" "one" {
  network_interface = aws_network_interface.main.id
  tags              = merge({ "Name" : "${var.prefix}-eip" }, var.default_tags)
}
