module "networking" {
  source               = "./networking"
  prefix               = var.prefix
  vpc_cidr             = var.vpc_cidr
  subnet_cidr          = var.subnet_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  user_ip              = var.user_ip
  default_tags         = var.default_tags
}
