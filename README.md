## terraform-collections
This repository holds Terraform modules created to ease the creation of certain resources of major cloud providers. Modules are local, using Terraform Cloud workspaces for ease. < br/>

### Table of contents

1. [Terraform Cloud](#tf-cloud) <br />
1. [Microsoft Azure](#azure-tf)
1. [Amazon Web Services](#aws-tf)



## ---> tf-cloud / tfe_workspaces <a name="tf-cloud"></a>
Using the following configuration, iterating over the `managed-workspaces` list TF will create a managed workspace for each of the items in the list, following the next naming convention `<cloud-provider>-<list-item[index]>`.
<br />

For secrets management, this configuration will provide you with a managed variable set, available in your Terraform Cloud organization, with the naming convetion `tf-<variable-sets>-vars`, the variable set will be attached to all the workspaces that will be created.
```bash
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

## ---> azure / modules  <a name="azure-tf"></a>
Using the following configuration, this Terraform module will create a Azure Kubernetes Service cluster, as well as a Azure Container Registry, simply by providing the bellow variables:

```bash
subscription_id = ""       # Your subscription ID
resource_group  = ""       # Your RSG where the resources will be created

rsg_location = "West US"
registry_sku = "Standard"

aks_nodepool_count = 2
kubernetes_version = "1.23.12"
aks_cluster_name   = "aks-test-lab"
aks_nodepool_size  = "Standard_DS2_v2"
```



## ---> aws_ / modules  <a name="aws-tf"></a>



