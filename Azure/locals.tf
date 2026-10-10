locals {
  default_tags = {
    Environment        = "dev"
    Owner              = "ifaakash"
    IsTerraformManaged = "true"
  }
  project  = "quickspin"
  location = "Australia Southeast"
  size     = "Standard_D2s_v4"
}
