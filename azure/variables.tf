variable "resource_group" {
  description = "Azure Resource Group for resources"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "Azure Subcription ID"
  type        = string
  sensitive   = true
}

variable "registry_name" {
  description = "Name for Azure Container Registry"
  type        = string
  default     = "bestContainerRegistryEver"
}

variable "rsg_location" {
  description = "Resource Group Location"
  type        = string
  sensitive   = false
}

variable "registry_sku" {
  type        = string
  description = "SKU to be used for the Container Registry"
}

variable "aks_cluster_name" {
  description = "Name for the AKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for the cluster"
  type        = string
}

variable "aks_nodepool_count" {
  description = "Node pools count"
  type        = number
}

variable "aks_nodepool_size" {
  description = "Node pools VM size"
  type        = string
}