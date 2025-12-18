terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.56.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg_practice"
    storage_account_name = "storageassig1912"
    container_name       = "blobcon"
    key                  = "ajay.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "c060d854-01c4-4739-baf7-57540765c3d2"
}