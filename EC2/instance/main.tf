resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  primary_network_interface {
    network_interface_id = var.network_interface_id
  }
  availability_zone    = var.availability_zone
  iam_instance_profile = var.instance_profile_name
  force_destroy        = true
  tags                 = var.default_tags
}
