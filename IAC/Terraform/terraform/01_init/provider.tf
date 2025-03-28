/*
initialize the Azure environment. No remote storage, only performed once.
*/

#Set the terraform required version, and Configure the Azure Provider
terraform {
  required_version = ">= 1.11.0, < 2.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

provider "azurerm" {
  features {}
}
