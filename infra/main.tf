module "md-rg" {
  source              = "../module/azure-rg"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "md-k8s-cluster" {
  depends_on          = [module.md-rg]
  source              = "../module/azure-aks"
  resource_group_name = var.resource_group_name
  location            = var.location
  aks_name            = var.aks_name
}