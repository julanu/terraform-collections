variable "tfc_organization" {
  type        = string
  description = "Terraform Cloud organization name"
}

variable "cloud_provider" {
  type        = string
  description = "Cloud provider used for naming convention of workspaces"
}

variable "managed_workspaces" {
  type        = list(string)
  description = "List of names for the workspaces, used together with the cloud_provider for naming"
}

variable "variable_sets" {
  type        = list(string)
  description = "Name of variable set to be added in the naming convention, e.g.: tf-<your-name>-vars"
}

variable "varset_description" {
  type        = string
  description = "Description to be added to the variable set"
}

variable "variables" {
  type        = map(any)
  description = "Nested map for variable declaration inside the variable set"
}

variable "common_tags" {
  type        = list(string)
  description = "Tags to be applied to the managed workspaces"
}
