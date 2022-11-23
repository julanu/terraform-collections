module "acr" {
  source          = "./acr"
  rsg_location    = var.rsg_location
  subscription_id = var.subscription_id
  resource_group  = var.resource_group
  registry_sku    = var.registry_sku
}