module "instance" {
  source                = "./instance"
  prefix                = var.prefix
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  network_interface_id  = var.network_interface_id
  security_group_ids    = var.security_group_ids
  role_name             = var.role_name
  instance_profile_name = var.instance_profile_name
  default_tags          = var.default_tags
}
