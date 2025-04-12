module "acr" {
  source          = "./acr"
  rsg_location    = var.rsg_location
  subscription_id = var.subscription_id
  resource_group  = var.resource_group
  registry_sku    = var.registry_sku
}

module "aks" {
  source             = "./aks"
  aks_cluster_name   = var.aks_cluster_name
  kubernetes_version = var.kubernetes_version
  aks_nodepool_count = var.aks_nodepool_count
  aks_nodepool_size  = var.aks_nodepool_size
  rsg_location       = var.rsg_location
  subscription_id    = var.subscription_id
  resource_group     = var.resource_group
}
