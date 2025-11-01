# Attach a elastic IP to public Instace ( will not be attached to anything )
# This EIP will be utilised by the NAT Gateway
resource "aws_eip" "one" {
  domain = "vpc"
  tags   = merge({ "Name" : "${var.prefix}-eip" }, var.default_tags)
}
# network_interface = aws_network_interface.public.id
