resource "azurerm_kubernetes_cluster" "cluster" {
  name                = var.aks_cluster_name
  location            = var.rsg_location
  resource_group_name = var.resource_group
  dns_prefix          = var.aks_cluster_name
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "default"
    node_count = var.aks_nodepool_count
    vm_size    = var.aks_nodepool_size
  }

  identity {
    type = "SystemAssigned"
  }
}