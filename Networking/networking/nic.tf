# Create a network interface with EIP and Security group attached
resource "aws_network_interface" "public" {
  description     = "Elastic Network Interface to attach with Public EC2 Instance"
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.main.id]
  tags            = merge({ "Name" : "${var.prefix}-public-nic" }, var.default_tags)
}

resource "aws_network_interface" "private" {
  description     = "Elastic Network Interface to attach with Private EC2 Instance"
  subnet_id       = aws_subnet.private.id
  security_groups = [aws_security_group.main.id]
  tags            = merge({ "Name" : "${var.prefix}-private-nic" }, var.default_tags)
}

# Attach a elastic IP to public Instace ( will not be attached to anything )
# This EIP will be utilised by the NAT Gateway
resource "aws_eip" "one" {
  domain = "vpc"
  tags   = merge({ "Name" : "${var.prefix}-eip" }, var.default_tags)
}
# network_interface = aws_network_interface.public.id
