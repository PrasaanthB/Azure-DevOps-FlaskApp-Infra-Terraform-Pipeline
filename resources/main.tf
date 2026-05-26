resource "azurerm_resource_group" "InfraRG" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_registry" "ACR" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.InfraRG.name
  location            = azurerm_resource_group.InfraRG.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "AKSCluster" {
  name                = var.aks_name
  location            = azurerm_resource_group.InfraRG.location
  resource_group_name = azurerm_resource_group.InfraRG.name
  dns_prefix         = "flaskappaks"

  default_node_pool {
    name       = "appnodes"
    node_count = var.node_count
    vm_size    = var.node_size
    node_labels = { 
      role = "app"
    }
  }

  identity {
    type = "SystemAssigned"
  }
} 

resource "azurerm_kubernetes_cluster_node_pool" "monitoringnodes" {
  name                  = "monitoring"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.AKSCluster.id
  vm_size    = var.node_size
  node_count = 1
  node_labels = {
    role = "monitoring"
  }
}

resource "azurerm_role_assignment" "RoleAssignment" {
  scope                = azurerm_container_registry.ACR.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.AKSCluster.kubelet_identity[0].object_id 
  skip_service_principal_aad_check = true  

}