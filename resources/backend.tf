terraform {
  backend "azurerm" {
    resource_group_name   = "tfstate_rg"
    storage_account_name  = "tfstate_sa"
    container_name        = "tfstate_blob_container"
    key                   = "terraform.tfstate"
  }
}