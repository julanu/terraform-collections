cloud_provider     = "aws"
tfc_organization   = "carrello-org"
common_tags        = ["project:aws", "env:sandbox"]
managed_workspaces = ["gitops-infrastructure", "base-tools", "test-infrastructure"]

variable_sets      = ["aws-account"]
varset_description = "Environment variables for AWS access"

variables = {
  variable1 = {
    key       = "AWS_ACCESS_KEY"
    value     = "add-your-value-here"
    category  = "env"
    sensitive = true
  },
  variable2 = {
    key       = "AWS_SECRET_ACCESS_KEY"
    value     = "add-your-value-here"
    category  = "env"
    sensitive = true
  }
}