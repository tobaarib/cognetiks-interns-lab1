resource "azurerm_log_analytics_workspace" "starter_app_workspace" {
  name                = "starter-app-workspace"
  location            = azurerm_resource_group.starter_app_rg.location
  resource_group_name = azurerm_resource_group.starter_app_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}