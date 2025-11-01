variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-image-resize"
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Prefix for storage account name"
  type        = string
  default     = "imageresize"
}

variable "function_app_name" {
  description = "Prefix for function app name"
  type        = string
  default     = "image-resize-func"
}

variable "python_version" {
  description = "Python runtime version for Azure Function"
  type        = string
  default     = "3.10"
}

# 👇 Add these missing ones
variable "app_insights_name" {
  description = "Name of the Application Insights resource"
  type        = string
  default     = "app-insights-image-resize"
}

variable "service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "asp-image-resize"
}

# 🆕 Added to fix pipeline error
variable "service_plan_sku" {
  description = "SKU for the App Service Plan (e.g. F1, B1)"
  type        = string
  default     = "B1"
}
