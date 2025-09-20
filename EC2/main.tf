module "networking" {
  source               = "./networking"
  prefix               = var.prefix
  vpc_cidr             = var.vpc_cidr
  subnet_cidr          = var.subnet_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  user_ip              = var.user_ip
  is_public            = var.is_public
  default_tags         = var.default_tags
}

module "instance" {
  source               = "./instance"
  prefix               = var.prefix
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  network_interface_id = module.networking.network_interface_id
  security_group_ids   = [module.networking.security_group_id]
  default_tags         = var.default_tags
}
