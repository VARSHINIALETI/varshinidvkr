terraform {
required_providers {
 azurerm = {
source  = "hashicorp/azurerm"
version = "=3.69.0"
 }
}
}
 
provider "azurerm" {
 features {}
}

module "RG" {
    source = "./Modules/RG"

    resource_group_name       = var.resource_group_name
    resource_group_location   = var.resource_group_location
}

module "AKS" {
    source = "./Modules/AKS"

     resource_group_name            = var.resource_group_name
     resource_group_location        = var.resource_group_location
     acr_name                      = var.acr_name
     acr_sku                       = var.acr_sku
     acr_admin_enabled             = var.acr_admin_enabled
     cluster_name                   = var.cluster_name
     kubernetes_version             = var.kubernetes_version
     dns_prefix                     = var.dns_prefix

    node_pool_name             = var.node_pool_name
    node_count                      = var.node_count
    node_pool_vm_size          = var.node_pool_vm_size
    node_pool_type             = var.node_pool_type
    node_pool_zones            = var.node_pool_zones
    node_pool_scaling         = var.node_pool_scaling

    identity_type                   = var.identity_type

    lb_sku                          = var.lb_sku
    network_plugin                  = var.network_plugin 
}

