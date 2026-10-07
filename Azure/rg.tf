resource "azurerm_resource_group" "rg" {
  name     = "${local.project}-rg"
  location = "West Europe"
  tags     = local.default_tags
}
