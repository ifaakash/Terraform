locals {
  default_tags = {
    Environment        = "dev"
    Owner              = "ifaakash"
    IsTerraformManaged = "true"
  }
  project  = "quickspin"
  location = "Australia Central"
  size     = "Standard_B2pls_v2"
}
