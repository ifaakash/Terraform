resource "azurerm_virtual_network" "vnet" {
  name                = "${local.project}-vnet"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg.id
  address_space       = [var.vnet_address_space]
  tags                = local.default_tags
}


resource "azurerm_subnet" "public" {
  name                 = "${local.project}-public-subnet"
  resource_group_name  = azurerm_resource_group.rg.id
  virtual_network_name = azurerm_virtual_network.vnet.id
  address_prefixes     = ["10.0.1.0/24"]
}


resource "azurerm_subnet" "private" {
  name                 = "${local.project}-private-subnet"
  resource_group_name  = azurerm_resource_group.rg.id
  virtual_network_name = azurerm_virtual_network.vnet.id
  address_prefixes     = ["10.0.1.0/24"]
}


resource "azurerm_network_security_group" "example" {
  name                = "${local.project}-nsg"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "blockInternetAccess"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = local.default_tags
}
