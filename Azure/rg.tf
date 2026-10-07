resource "azurerm_resource_group" "rg" {
  name     = "example-resources"
  location = "West Europe"
  tags     = local.default_tags
}
