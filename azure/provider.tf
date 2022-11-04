terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.11.0"
    }
  }
}

provider "azurerm" {
  subscription_id            = var.subscription_id
  skip_provider_registration = true

  features {}
}
