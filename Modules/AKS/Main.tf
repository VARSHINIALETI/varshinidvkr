resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
  }

  resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
}


resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name                = var.node_pool_name
    node_count          = var.node_count
    vm_size             = var.node_pool_vm_size
    type                = var.node_pool_type
    zones               = var.node_pool_zones
    enable_auto_scaling = var.node_pool_scaling
  }

  identity {
    type = var.identity_type
  }

  network_profile {
    load_balancer_sku = var.lb_sku
    network_plugin    = var.network_plugin 
  }
}
  

  
