locals {
  default_tags = {
    Environment        = "dev"
    Owner              = "ifaakash"
    IsTerraformManaged = "true"
  }
  project  = "quickspin"
  location = "Japan East"
  size     = "Standard_B4pls_v2"
}
