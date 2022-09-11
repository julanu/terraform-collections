data "tfe_organization" "carrello_org" {
  name = var.tfc_organization
}

resource "tfe_workspace" "managed_ws" {
  count = length(var.managed_workspaces)

  name         = "${var.cloud_provider}-${var.managed_workspaces[count.index]}"
  organization = data.tfe_organization.carrello_org.name

  tag_names = var.common_tags
}

resource "tfe_variable_set" "managed_varset" {
  name         = "tf-${var.variable_sets[0]}-vars"
  description  = var.varset_description
  organization = data.tfe_organization.carrello_org.name
}

resource "tfe_workspace_variable_set" "ws_variableset" {
  count           = length(var.managed_workspaces)
  workspace_id    = tfe_workspace.managed_ws[count.index].id
  variable_set_id = tfe_variable_set.managed_varset.id
}

resource "tfe_variable" "variable" {
  for_each = var.variables

  key       = each.value["key"]
  value     = each.value["value"]
  category  = each.value["category"]
  sensitive = each.value["sensitive"]

  variable_set_id = tfe_variable_set.managed_varset.id
}