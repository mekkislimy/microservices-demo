variable "location" {
  type    = string
  default = "switzerlandnorth"
}

variable "rg_name_prefix" {
  type    = string
  default = "sockshop-rg"
}

variable "aks_name_prefix" {
  type    = string
  default = "sockshop-aks"
}

variable "node_count" {
  type    = number
  default = 2
}

variable "node_vm_size" {
  type    = string
  default = "Standard_DS2_v2"
}
