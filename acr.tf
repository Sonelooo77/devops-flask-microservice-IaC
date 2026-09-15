import {
  to = azurerm_container_registry.acr
  id = "/subscriptions/3f1b9162-df76-414a-ae4f-bb40ff6d3216/resourceGroups/rg-terraform-state/providers/Microsoft.ContainerRegistry/registries/acrkindellab77"
}

resource "azurerm_container_registry" "acr" {
  name                = "acrkindellab77" 
  resource_group_name = "rg-terraform-state"
  location            = "northeurope"
  sku                 = "Basic"
  admin_enabled       = true 
}

