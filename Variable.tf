variable "resource_group_name" {
 type     = string
 description = "name of the resource group."
}

variable "resource_group_location" {
type     = string
 description = "location of the resource group."
}

variable "acr_name" {
  description = "container registry name"
  type = string
}

variable "acr_sku" {
    description = "container registry sku"
    type = string
  }

  variable "acr_admin_enabled" {
    description = "container registry admin permissions"
  }

  variable "cluster_name" {
  description = "kubernetes cluster name"
  type = string
}

variable "kubernetes_version" {
  
  description = "kubernetes version"
  type = string
}

variable "node_pool_name" {
  description = "node pool name"
  type = string
}

variable "node_count" {
  description = "number of nodes"
  type = number
}

variable "node_pool_vm_size" {
  description = "vm size"
  type = string
}

variable "node_pool_type" {
  description = "node pool type"
  type = string
}

variable "node_pool_scaling" {
  description = "node pool scaling"
  type = bool
}

variable "node_pool_zones" {
  description = "node pool zones"
  type = list(number)
}

variable "identity_type" {
  description = "identity type"
  type = string
}

variable "lb_sku" {
  description = "load balancer sku"
  type = string
}

variable "network_plugin" {
description = "network plug in"
type = string
}

variable "dns_prefix" {
    description = "dns prefix"
    type = string
  }