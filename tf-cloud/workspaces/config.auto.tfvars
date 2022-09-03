cloud_provider     = "aws"
tfc_organization   = "carrello-org"
common_tags        = ["project:aws", "env:sandbox"]
managed_workspaces = ["gitops-infrastructure", "base-tools", "test"]

variable_sets = ["gitops"]
varset_description = "This variable set does this"

variables = {
    key = ""
    value = ""
    category = ""
}