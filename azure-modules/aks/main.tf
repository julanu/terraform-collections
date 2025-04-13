resource "azurerm_kubernetes_cluster" "cluster" {
  name                = var.aks_cluster_name
  location            = var.rsg_location
  resource_group_name = var.resource_group
  dns_prefix          = var.aks_cluster_name
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "default"
    node_count = var.enable_autoscaling ? null : var.aks_nodepool_count
    vm_size    = var.aks_nodepool_size

    min_count            = var.enable_autoscaling ? var.min_node_count : null
    max_count            = var.enable_autoscaling ? var.max_node_count : null
    auto_scaling_enabled = var.enable_autoscaling
  }

  local_account_disabled            = true
  role_based_access_control_enabled = true

  azure_active_directory_role_based_access_control {
    azure_rbac_enabled     = true
    tenant_id              = var.tenant_id
    admin_group_object_ids = var.admin_group_object_ids
  }

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  private_cluster_enabled = var.enable_private_cluster

  api_server_access_profile {
    authorized_ip_ranges = var.authorized_ip_ranges
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  tags = var.tags
}

# Dynamic mapping to add users to different pre-established IAM roles
resource "azurerm_role_assignment" "aks_rbac" {
  for_each = {
    for pair in flatten([
      for role, ids in var.aks_rbac_roles : [
        for id in ids : {
          key          = "${role}-${id}"
          role_name    = role
          principal_id = id
        } if id != "" # filter out empty IDs
      ]
      ]) : pair.key => {
      role_name    = pair.role_name
      principal_id = pair.principal_id
    }
  }

  role_definition_name = each.value.role_name
  principal_id         = each.value.principal_id
  scope                = azurerm_kubernetes_cluster.cluster.id
}