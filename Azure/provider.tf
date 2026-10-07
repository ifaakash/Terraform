terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
}


provider "azurerm" {
  features {}
}


# azurerm has no default tags, unlike AWS; default tags are in locals.tf
