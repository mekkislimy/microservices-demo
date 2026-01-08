resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.rg_name_prefix}-${random_integer.suffix.result}"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.aks_name_prefix}-${random_integer.suffix.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dns_prefix = "sockshop${random_integer.suffix.result}"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "standard_b2s"
  }

  identity {
    type = "SystemAssigned"
  }

  
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}
