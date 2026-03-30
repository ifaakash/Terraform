resource "aws_instance" "bastion" {
  # TODO: This method of using SSM parameter for AMI is updated frequently

  # This forces a new deployment, when any new AMI ID is available over AWS
  ami = data.aws_ssm_parameter.al2023_latest.value
  # TODO: Bastion instance_type is hardcoded to "t3.micro"
  instance_type = "t3.micro"
  primary_network_interface {
    network_interface_id = var.network_interface_id
  }
  iam_instance_profile = var.instance_profile_name
  force_destroy        = true
  tags                 = var.default_tags
}
