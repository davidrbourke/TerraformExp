variable "resource_group_name" {
  default = "rg-terraform-exp-1"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "resource_group_location" {
  default = "uksouth"
  description = "Location of the resource group"
}

variable "storage_account_name" {
  default = "saterraformexp"
  description = "Name of the storage account"
}