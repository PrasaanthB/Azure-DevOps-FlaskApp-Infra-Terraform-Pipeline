resource "azurerm_resource_group" "tfstateRG" {
  name     = "tfstaterg"
  location = "Central India"
}

resource "azurerm_storage_account" "tfstateSA" {
  name                     = "tfstatesa214"
  resource_group_name      = azurerm_resource_group.tfstateRG.name
  location                 = azurerm_resource_group.tfstateRG.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstateBLOB" {
    name                  = "tfstateblobcontainer214"
    storage_account_id  = azurerm_storage_account.tfstateSA.id
    container_access_type = "private"
  
}