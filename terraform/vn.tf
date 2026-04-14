resource "azurerm_virtual_network" "starter_app_network" {
  name                = "starter_app_network"
  location            = azurerm_resource_group.starter_app_rg.location
  resource_group_name = azurerm_resource_group.starter_app_rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
    security_group = azurerm_network_security_group.starter_app_nsg.id
  }

  subnet {
    name             = "subnet2"
    address_prefixes = ["10.0.2.0/24"]
    security_group = azurerm_network_security_group.starter_app_nsg.id
  }

  subnet {
    name             = "subnet3"
    address_prefixes = ["10.0.3.0/24"]
    security_group = azurerm_network_security_group.starter_app_nsg.id
  }
}