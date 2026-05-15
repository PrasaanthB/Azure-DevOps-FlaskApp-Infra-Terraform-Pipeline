resource "azurerm_resource_group" "InfraRG" {
  name     = "var.resource_grp_name"
  location = "var.location"
}

resource "azurerm_container_registry" "ACR" {
  name                = "var.acr_name"
  resource_group_name = azurerm_resource_group.InfraRG.name
  location            = azurerm_resource_group.InfraRG.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "AKSCluster" {
  name                = "var.aks_name"
  location            = azurerm_resource_group.InfraRG.location
  resource_group_name = azurerm_resource_group.InfraRG.name
  dns_prefix         = "flaskappaks"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_size
  }

  identity {
    type = "SystemAssigned"
  }
} 

resource "azurerm_role_assignment" "RoleAssignment" {
  scope                = azurerm_kubernetes_cluster.AKSCluster.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.AKSCluster.identity[0].principal_id 
  skip_service_principal_aad_check = true  

}