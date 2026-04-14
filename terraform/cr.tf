resource "azurerm_container_registry" "starter_app_registry" {
  name                = "starter_app_registry"
  resource_group_name = azurerm_resource_group.starter_app_rg.name
  location            = azurerm_resource_group.starter_app_rg.location
  sku                 = "Basic"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "North Europe"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}