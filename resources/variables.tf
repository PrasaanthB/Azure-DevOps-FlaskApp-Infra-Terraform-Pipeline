variable "resource_group_name" {
    description = "Name of the Resource Group to be created"
    type        = string
    default     = "flaskapp_rg"
  
}

variable "location" {
    description = "Azure Region where the Resource Group will be created"
    type        = string
    default     = "Central India"
  
}

variable "aks_name" {
    description = "Name of the AKS Cluster to be created"
    type        = string
    default     = "flaskapp_aks_cluster"
  
}

variable "node_count" {
    description = "Number of nodes in the AKS Cluster"
    type        = number
    default     = 2 
  
}

variable "node_size" {
    description = "Size of the nodes in the AKS Cluster"
    type        = string
    default     = "Standard_D2ads_v6"
  
}

variable "acr_name" {
    description = "Name of the Azure Container Registry to be created"
    type        = string
    default     = "flaskappacr"
  
}