variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "ImageResizeRG"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "function_app_name" {
  description = "Name of the function app"
  type        = string
}

variable "python_version" {
  description = "Python version for function app"
  type        = string
  default     = "3.11"
}