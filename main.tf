terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-devops-lab-test"
  location = "northeurope"
}

resource "azurerm_container_group" "aci" {
  name                = "ci-devops-sonelo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
  dns_name_label      = "app-devops-sonelo-77"
  os_type             = "Linux"

  container {
    name   = "flask-api"
    image  = "sonelo77/devops-flask-api:${var.image_tag}"
    cpu    = "0.5"
    memory = "1.0"

    ports {
      port     = var.port
      protocol = "TCP"
    }
  }
}

