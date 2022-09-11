variable "tfc_organization" {
  type        = string
  description = "Terraform Cloud organization name"
}

variable "cloud_provider" {
  type        = string
  description = "Cloud provider used to be added in the workspace naming"
}

variable "managed_workspaces" {
  type        = list(string)
  description = "List of names for the workspaces to be added in the naming"
}

variable "variable_sets" {
  type        = list(string)
  description = "List of the names to be added in the TF managed variable sets"
}

variable "varset_description" {
  type        = string
  description = "Description to add to the variable set"
}

variable "variables" {
  type = map(any)
}

variable "common_tags" {
  type        = list(string)
  description = "Tags to be applied to the managed workspaces"
}
