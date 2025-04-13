### AKS Cluster Terraform Module

This Terraform module deploys an Azure Kubernetes Service (AKS) cluster with RBAC integration, secure networking, and a production-ready configuration. It is mean to be integrated with a Resource Group that is already provided, automatic creation of a RSG is not included.

#### Features Enabled:
  - AAD Integration with Azure RBAC: Users or groups can be granted specific Azure roles on the cluster
  - OIDC and Workload Identity: Enables secure identity federation for workloads
  - Private Cluster: Option to restrict API server access to internal network ranges
  - RBAC Role Assignments: Assign Azure roles dynamically to AD object IDs
  - API Server IP Restriction: Define allowed IP ranges to access the Kubernetes API
  - System-assigned Identity: AKS cluster uses managed identity for resource access
  - Autoscaling Support: Node pools can auto-scale between specified min/max counts

#### Secure defaults:
    - Local accounts are disabled
    - Network policy and plugin set to Azure
    - Explicit control over RBAC scopes

#### Features disabled or not included:
    - No public IP access unless explicitly whitelisted via authorized_ip_ranges
    - No default role bindings outside of those explicitly defined in aks_rbac_roles
    - No node pool taints/labels/availability zones configured in this version

#### Example TFVARS:
```bash
subscription_id        = "<subscriptionid>"
resource_group         = "<resourcegroup>"
tenant_id              = "<tenantid>"
rsg_location           = "East US"
aks_cluster_name       = "aks-test-lab"

# AAD group object IDs that should have admin access to the cluster
admin_group_object_ids = [
  "00000000-0000-0000-0000-000000000001"
]

# AAD user object IDs that should have admin access to the cluster
admin_user_object_id = "00000000-0000-0000-0000-000000000001"

# Node pool config
aks_nodepool_size      = "Standard_DS2_v2"
kubernetes_version     = "1.31.7"

# Optional: restrict access to the API server
authorized_ip_ranges = [
  "203.0.113.1/32",    # Office IP
  "198.51.100.0/24"    # VPN CIDR
]

# Optional: assign Azure roles to users/groups
aks_rbac_roles = {
  "Reader" = [
    "reader1@example.com",
    "reader2@example.com"
  ]
  "Contributor" = [
    "dev1@example.com",
    "dev2@example.com"
  ]
  "Owner" = [
    "admin@example.com"
  ]
}

# Optional: any tags you want on the AKS cluster
tags = {
  environment = "sandbox"
  owner       = "team-x"
  managedby   = "terraform"
}

# Optional: enable private cluster mode and autoscaling
enable_private_cluster = true

enable_autoscaling   = true
min_node_count       = 1
max_node_count       = 3
aks_nodepool_count   = 2 # Ignored if autoscaling is true


```