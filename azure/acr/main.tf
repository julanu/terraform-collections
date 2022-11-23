terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.11.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id            = var.subscription_id
  skip_provider_registration = true
}

resource "azurerm_container_registry" "acr" {
  name                   = var.registry_name
  resource_group_name    = var.resource_group
  location               = var.rsg_location
  sku                    = var.registry_sku
  admin_enabled          = false
  anonymous_pull_enabled = false
}
