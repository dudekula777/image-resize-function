output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "storage_account_name" {
  value = azurerm_storage_account.main.name
}

output "function_app_name" {
  value = azurerm_linux_function_app.main.name
}

output "application_insights_name" {
  value = azurerm_application_insights.main.name
}

output "storage_connection_string" {
  value     = azurerm_storage_account.main.primary_connection_string
  sensitive = true
}