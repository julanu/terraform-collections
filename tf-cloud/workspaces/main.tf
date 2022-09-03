data "tfe_organization" "carrello_org" {
  name = var.tfc_organization
}

resource "tfe_workspace" "managed_ws" {
  count = length(var.managed_workspaces)

  name         = "tf-${var.cloud_provider}-${var.managed_workspaces[count.index]}"
  organization = data.tfe_organization.carrello_org.name

  tag_names = var.common_tags
}

resource "tfe_variable_set" "managed_varset" {
  name          = "tf-${var.variable_sets[0]}-vars"
  description   = var.varset_description
  organization  = data.tfe_organization.carrello_org.name
}

resource "tfe_workspace_variable_set" "test" {
  count = length(var.managed_workspaces )
  workspace_id    = tfe_workspace.managed_ws[count.index].id
  variable_set_id = tfe_variable_set.managed_varset.id
}

resource "tfe_variable" "test-a" {
  key             = "seperate_variable"
  value           = "my_value_name"
  category        = "terraform"
  description     = "a useful description"
  variable_set_id = tfe_variable_set.test.id
}