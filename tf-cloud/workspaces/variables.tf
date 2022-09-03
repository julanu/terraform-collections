variable "common_tags" {
  type        = list(string)
  description = "Tags to be applied to the managed workspaces"
}

variable "cloud_provider" {
  type        = string
  description = "Cloud provider used to be added in the workspace naming"
}

variable "managed_workspaces" {
  type        = list(string)
  description = "List of names for the workspaces to be added in the naming"
}

variable "tfc_organization" {
  type        = string
  description = "Terraform Cloud organization name"
}

variable "varset_description" {
  type = string
  description = "SOmething"
}
variable "variable_sets" {
  type = list(string)
  description = "SOmething"
}