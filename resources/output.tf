output "resource_group_name" {
  value = azurerm_resource_group.InfraRG.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.AKSCluster.name
}       

output "acr_name" {
  value = azurerm_container_registry.ACR.name
}

output "acr_login_server" {
  value = azurerm_container_registry.ACR.login_server
}

output "aks_node_resource_group" {
    value = azurerm_kubernetes_cluster.AKSCluster.node_resource_group
}

output "aks_identity_principal_id" {
    value = azurerm_kubernetes_cluster.AKSCluster.kubelet_identity[0].object_id
  
}