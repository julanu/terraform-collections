module "aks" {
  source                 = "./aks"
  aks_cluster_name       = var.aks_cluster_name
  kubernetes_version     = var.kubernetes_version
  aks_nodepool_count     = var.aks_nodepool_count
  aks_nodepool_size      = var.aks_nodepool_size
  rsg_location           = var.rsg_location
  subscription_id        = var.subscription_id
  resource_group         = var.resource_group
  tenant_id              = var.tenant_id
  admin_group_object_ids = var.admin_group_object_ids
  enable_autoscaling     = var.enable_autoscaling
  admin_user_object_id   = var.admin_user_object_id
}
