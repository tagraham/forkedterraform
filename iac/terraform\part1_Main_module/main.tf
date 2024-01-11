data "azurerm_resource_group" "data_rg" {
  name = var.resourceGroupName
}

terraform {
  required_version = ">=1.6.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"      
    }    
    arm2tf = {
      source  = "cloud-maker-ai/arm2tf"
      version = "0.2.2"      
    }    
  }
}

provider "azurerm" {
  features {    
  }
}


resource "azurerm_storage_account" "tagra1" {
  name                     = var.storageAccountName
  resource_group_name      = data.azurerm_resource_group.data_rg.name
  location                 = data.azurerm_resource_group.data_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "arm2tf_unique_string" "tg202401101554abc" {
  input = [data.azurerm_resource_group.data_rg.name]
}

resource "azurerm_storage_account" "cm_tagra123_acct_full" {
  name                     = local.storageAccountNameFull
  resource_group_name      = data.azurerm_resource_group.data_rg.name
  location                 = data.azurerm_resource_group.data_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}