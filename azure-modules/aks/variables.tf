variable "resource_group" {
  description = "Name of the Azure Resource Group where the AKS cluster and associated resources will be deployed"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "Azure Subscription ID under which the resources will be provisioned"
  type        = string
  sensitive   = true
}

variable "rsg_location" {
  description = "Azure region where the Resource Group and resources will be deployed (e.g., westeurope)"
  type        = string
  sensitive   = false
}

variable "aks_cluster_name" {
  description = "Name of the Azure Kubernetes Service (AKS) cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Desired Kubernetes version for the AKS cluster"
  type        = string
}

variable "aks_nodepool_count" {
  description = "Initial number of nodes to provision in the default node pool"
  type        = number
}

variable "aks_nodepool_size" {
  description = "VM size to use for nodes in the default node pool (e.g., Standard_DS2_v2)"
  type        = string
}

variable "enable_autoscaling" {
  description = "Enable or disable cluster autoscaler for the default node pool"
  type        = bool
  default     = false
}

variable "min_node_count" {
  description = "Minimum number of nodes when autoscaling is enabled"
  default     = 1
}

variable "max_node_count" {
  description = "Maximum number of nodes when autoscaling is enabled"
  default     = 3
}

variable "enable_private_cluster" {
  description = "Enable private cluster mode, which restricts access to the API server to within the VNet"
  type        = bool
  default     = false
}

variable "authorized_ip_ranges" {
  description = "List of authorized IP address ranges to access the AKS API server"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Key-value map of tags to assign to the AKS cluster and related resources"
  type        = map(string)
  default     = {}
}

variable "aks_rbac_roles" {
  description = "Mapping of role names to lists of Azure AD object IDs for RBAC assignments (e.g., Reader, Contributor)"
  type        = map(list(string))
  default = {
    "Reader"      = ["", ""],
    "Contributor" = [""],
    "Owner"       = [""]
  }
}

variable "tenant_id" {
  description = "Azure Active Directory Tenant ID"
  type        = string
}

variable "admin_group_object_ids" {
  description = "List of AAD group object IDs that will be cluster admins"
  type        = list(string)
  default     = null
}
