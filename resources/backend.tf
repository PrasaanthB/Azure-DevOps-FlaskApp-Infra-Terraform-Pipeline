terraform {
  backend "azurerm" {
    resource_group_name   = "tfstaterg"
    storage_account_name  = "tfstatesa214"
    container_name        = "tfstateblobcontainer214"
    key                   = "terraform.tfstate"
  }
}