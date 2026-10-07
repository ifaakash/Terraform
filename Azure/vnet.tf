resource "azurerm_virtual_network" "vnet" {
  name                = "${local.project}-vnet"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.vnet_address_space]
  tags                = local.default_tags
}


resource "azurerm_subnet" "public" {
  name                 = "${local.project}-public-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.public_subnet_address_space]
}


resource "azurerm_subnet" "private" {
  name                 = "${local.project}-private-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.private_subnet_address_space]
}

resource "azurerm_network_security_group" "private_nsg" {
  name                = "${local.project}-private-nsg"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.default_tags
}


resource "azurerm_network_security_group" "public_nsg" {
  name                = "${local.project}-public-nsg"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.default_tags
}

resource "azurerm_network_security_rule" "allow_ssh" {
  name                        = "allowSSHfromOwnIp"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "49.121.9.60/32"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.public_nsg.name
}


resource "azurerm_network_security_rule" "block_internet" {
  name                        = "blockInternetAccess"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet" # Blocks only public internet, allows internal VNet traffic
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.private_nsg.name
}

resource "azurerm_subnet_network_security_group_association" "private_nsg_assoc" {
  subnet_id                 = azurerm_subnet.private.id
  network_security_group_id = azurerm_network_security_group.private_nsg.id
}

resource "azurerm_route_table" "private_rt" {
  name                = "${local.project}-private-routetable"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.default_tags
}

resource "azurerm_route" "drop_internet" {
  name                = "dropInternetAccess"
  resource_group_name = azurerm_resource_group.rg.name
  route_table_name    = azurerm_route_table.private_rt.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "None"
}

resource "azurerm_subnet_route_table_association" "private_rt_assoc" {
  subnet_id      = azurerm_subnet.private.id
  route_table_id = azurerm_route_table.private_rt.id
}
