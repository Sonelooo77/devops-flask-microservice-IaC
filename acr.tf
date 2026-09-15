data "azurerm_client_config" "current" {}

import {
  to = azurerm_container_registry.acr
  id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/rg-terraform-state/providers/Microsoft.ContainerRegistry/registries/acrkindellab77"
}

resource "azurerm_container_registry" "acr" {
  name                = "acrkindellab77" 
  resource_group_name = "rg-terraform-state"
  location            = "northeurope"
  sku                 = "Basic"
  admin_enabled       = true 
}

