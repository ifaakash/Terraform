resource "aws_instance" "bastion" {
  ami           = data.aws_ssm_parameter.al2023_latest.value
  instance_type = "t3.micro"
  primary_network_interface {
    network_interface_id = var.network_interface_id
  }
  iam_instance_profile = var.instance_profile_name
  force_destroy        = true
  tags                 = var.default_tags
}
