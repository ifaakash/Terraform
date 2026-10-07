resource "azurerm_virtual_network" "vnet" {
  name                = "${local.project}-vnet"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg
  address_space       = [var.vnet_address_space]
  tags                = local.default_tags
}
