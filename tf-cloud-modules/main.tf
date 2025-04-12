terraform {
  cloud {
    organization = "carrello-org"
    hostname     = "app.terraform.io"

    workspaces {
      name = "workspace-manager"
    }
  }
}



module "tfe_cloud" {
  source = "./tfe_workspaces"

  tfc_organization   = var.tfc_organization
  cloud_provider     = var.cloud_provider
  managed_workspaces = var.managed_workspaces
  variable_sets      = var.variable_sets
  varset_description = var.varset_description
  variables          = var.variables
  common_tags        = var.common_tags

}
