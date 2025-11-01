# ────────────────────────────────────────────────
# Basic Configuration
# ────────────────────────────────────────────────
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-image-resize"
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "West Europe"
}

# ────────────────────────────────────────────────
# Storage Account and Function App
# ────────────────────────────────────────────────
variable "storage_account_name" {
  description = "Name of the Storage Account"
  type        = string
  default     = "imageresize"
}

variable "function_app_name" {
  description = "Name of the Azure Function App"
  type        = string
  default     = "image-resize-func"
}

variable "python_version" {
  description = "Python runtime version for Azure Function"
  type        = string
  default     = "3.10"
}

# ────────────────────────────────────────────────
# App Service and Monitoring
# ────────────────────────────────────────────────
variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "plan-imgresize"
}

variable "application_insights_name" {
  description = "Name of the Application Insights resource"
  type        = string
  default     = "app-insights-image-resize"
}

variable "service_plan_sku" {
  description = "SKU for the App Service Plan (e.g. F1, B1, Y1)"
  type        = string
  default     = "F1"
}

# ────────────────────────────────────────────────
# Azure Credentials
# ────────────────────────────────────────────────
variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  default     = ""
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
  default     = ""
}

variable "client_id" {
  description = "Azure client ID"
  type        = string
  default     = ""
}

variable "client_secret" {
  description = "Azure client secret"
  type        = string
  default     = ""
}
variable "app_insights_name" {
  description = "Name of the Application Insights instance"
  type        = string
  default     = "app-insights-image-resize"
}

variable "service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "plan-imgresize"
}