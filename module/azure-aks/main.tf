

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "chandanaks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_a2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"

  }
  kubernetes_version                = "1.32.2"
  role_based_access_control_enabled = true


}
