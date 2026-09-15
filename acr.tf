resource "azurerm_container_registry" "acr" {
  name                = "acrkindellab77" 
  resource_group_name = "rg-terraform-state"
  location            = "northeurope"
  sku                 = "Basic"
  admin_enabled       = true 
}

