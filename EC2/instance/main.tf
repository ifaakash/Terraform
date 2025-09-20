resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  primary_network_interface {
    network_interface_id = var.network_interface_id
  }
  vpc_security_group_ids = var.security_group_ids
  force_destroy          = true
  tags                   = merge({ "Name" : "${var.prefix}-instance" }, var.default_tags)
}
