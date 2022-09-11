## terraform-collections
This repository holds Terraform modules created to ease the creation of certain resources of major cloud providers. Modules are local, using Terraform Cloud workspaces for ease. < br/>

### Table of contents

1. [Terraform Cloud](#tf-cloud) <br />
1.1 [Terraform Cloud - Module Contents](#tfc-module-contents)
1. [Microsoft Azure](#azure-tf)
1. [Amazon Web Services](#aws-tf)



## ---> tf-cloud / tfe_workspaces <a name="tf-cloud"></a>
Using the following configuration, iterating over the `managed-workspaces` list TF will create a managed workspace for each of the items in the list, following the next naming convention `<cloud-provider>-<list-item[index]>`.
<br />

For secrets management, this configuration will provide you with a managed variable set, available in your Terraform Cloud organization, with the naming convetion `tf-<variable-sets>-vars`, the variable set will be attached to all the workspaces that will be created.
```terraform
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
    ...
  }
}
```


### Modules <a name="tfc-module-contents"></a>

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tfe_cloud"></a> [tfe\_cloud](#module\_tfe\_cloud) | ./tfe_workspaces | n/a |
### Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.36.1 |

### Resources

| Name | Type |
|------|------|
| [tfe_variable.variable](https://registry.terraform.io/providers/hashicorp/tfe/0.36.1/docs/resources/variable) | resource |
| [tfe_variable_set.managed_varset](https://registry.terraform.io/providers/hashicorp/tfe/0.36.1/docs/resources/variable_set) | resource |
| [tfe_workspace.managed_ws](https://registry.terraform.io/providers/hashicorp/tfe/0.36.1/docs/resources/workspace) | resource |
| [tfe_workspace_variable_set.ws_variableset](https://registry.terraform.io/providers/hashicorp/tfe/0.36.1/docs/resources/workspace_variable_set) | resource |
| [tfe_organization.carrello_org](https://registry.terraform.io/providers/hashicorp/tfe/0.36.1/docs/data-sources/organization) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_provider"></a> [cloud\_provider](#input\_cloud\_provider) | Cloud provider used to be added in the workspace naming | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Tags to be applied to the managed workspaces | `list(string)` | n/a | yes |
| <a name="input_managed_workspaces"></a> [managed\_workspaces](#input\_managed\_workspaces) | List of names for the workspaces to be added in the naming | `list(string)` | n/a | yes |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | Terraform Cloud organization name | `string` | n/a | yes |
| <a name="input_variable_sets"></a> [variable\_sets](#input\_variable\_sets) | List of the names to be added in the TF managed variable sets | `list(string)` | n/a | yes |
| <a name="input_variables"></a> [variables](#input\_variables) | n/a | `map(any)` | n/a | yes |
| <a name="input_varset_description"></a> [varset\_description](#input\_varset\_description) | Description to add to the variable set | `string` | n/a | yes |


## ---> azure / modules  <a name="azure-tf"></a>
## ---> aws_ / modules  <a name="aws-tf"></a>



