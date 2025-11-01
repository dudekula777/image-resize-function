# ────────────────────────────────────────────────
# 🌍 Basic Configuration
# ────────────────────────────────────────────────
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
}

# ────────────────────────────────────────────────
# ☁️ Storage Account and Function App
# ────────────────────────────────────────────────
variable "storage_account_name" {
  description = "Name of the Storage Account"
  type        = string
}

variable "function_app_name" {
  description = "Name of the Azure Function App"
  type        = string
}

variable "python_version" {
  description = "Python runtime version for Azure Function"
  type        = string
  default     = "3.11"
}

# ────────────────────────────────────────────────
# ⚙️ App Service and Monitoring
# ────────────────────────────────────────────────
variable "service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "service_plan_sku" {
  description = "SKU for the App Service Plan (e.g. Y1 for Consumption, B1 for Basic)"
  type        = string
  default     = "Y1"
}

variable "app_insights_name" {
  description = "Name of the Application Insights instance"
  type        = string
}

# ────────────────────────────────────────────────
# 🔐 Azure Credentials
# ────────────────────────────────────────────────
variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
  sensitive   = true
}
