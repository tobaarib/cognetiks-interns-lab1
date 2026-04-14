resource "azurerm_network_security_group" "starter_app_nsg" {
  name                = "starter_app_nsg"
  location            = azurerm_resource_group.starter_app_rg.location
  resource_group_name = azurerm_resource_group.starter_app_rg.name
}