module "instance" {
  source               = "./instance"
  prefix               = var.prefix
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  network_interface_id = var.network_interface_id
  security_group_ids   = var.security_group_ids
  default_tags         = var.default_tags
}
