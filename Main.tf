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
client_id = "8e5a67dc-7ce0-4a29-a839-32c46f8f5b32"
client_secret = "ZTS8Q~N3svKrtZUcxAVYnD.dgn6T2fjdpAbUYa.8" 
tenant_id = "9b684aa7-e16d-4fb5-80b3-016a14a31d69"
subscription_id = "d66a5269-317c-4c5d-823b-9afa0d01120f"
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

