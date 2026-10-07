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
#provider "aws" {
#  region = "ap-south-1"

#  default_tags {
#    tags = {
#      Environment = "dev"
#      ManagedBy   = "terraform"
#      Owner       = "aakash"
#    }
#  }
#}
