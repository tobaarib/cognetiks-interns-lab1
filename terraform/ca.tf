resource "azurerm_user_assigned_identity" "containerapp_identity" {
  name                = "containerapp-pull-id"
  resource_group_name = azurerm_resource_group.starter_app_rg.name
  location            = azurerm_resource_group.starter_app_rg.location
}

resource "azurerm_role_assignment" "containerapp_acr_pull" {
  scope                = azurerm_container_registry.starter_app_registry.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.containerapp_identity.principal_id
}

resource "azurerm_container_app" "starter-app" {
  name                         = "starter-app"
  container_app_environment_id = azurerm_container_app_environment.starter_app_environment.id
  resource_group_name          = azurerm_resource_group.starter_app_rg.name
  revision_mode                = "Single"

  identity {
    type = "UserAssigned" 
    identity_ids = [azurerm_user_assigned_identity.containerapp_identity.id]
  }

  registry {
    server = "starterappregistry.azurecr.io"
    identity = azurerm_user_assigned_identity.containerapp_identity.id
  }

  ingress {
    external_enabled = true 
    target_port = 8000
    traffic_weight {
      percentage = 100 
      latest_revision = true 
    }
  }

  template {
    container {
      name   = "startercontainerapp"
      image  = "starterappregistry.azurecr.io/lab1-starter-app:latest"
      cpu    = 0.5
      memory = "1Gi"

      env { 
        name = "APP_NAME"       
        value = "Cloud Lab Starter App" 
      }
      env { 
        name = "INTERN_NAME"    
        value = "Adetomiwa Aribisala" 
      }
      env { 
        name = "CLOUD_PLATFORM" 
        value = "Azure" 
      }
      env { 
        name = "ENVIRONMENT"    
        value = "dev" 
      }
      env { 
        name = "APP_VERSION"        
        value = "v1.0.0" 
      }
      env { 
        name = "APP_STATUS"         
        value = "healthy" 
      }
    }
    min_replicas = 1
    max_replicas = 3 
  } 
}