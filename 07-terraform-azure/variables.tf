variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group."
  default     = "rg-tf-azure-lab"
}

variable "location" {
  type        = string
  description = "Azure region for the lab resources."
  default     = "eastus"
}

variable "storage_account_prefix" {
  type        = string
  description = "Prefix used to generate a unique storage account name."
  default     = "sttfazure"
}