resource "azurerm_container_app_environment" "starter_app_environment" {
  name                       = "starter_app_environment"
  location                   = azurerm_resource_group.starter_app_rg.location
  resource_group_name        = azurerm_resource_group.starter_app_rg.name
  logs_destination           = "log-analytics"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.starter_app_workspace.id
}