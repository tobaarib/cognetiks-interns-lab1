resource "azurerm_container_registry" "starter_app_registry" {
  name                = "starterappregistry"
  resource_group_name = azurerm_resource_group.starter_app_rg.name
  location            = azurerm_resource_group.starter_app_rg.location
  sku                 = "Basic"
  admin_enabled       = false
}