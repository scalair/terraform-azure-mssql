output "sqlserver_name" {
  description = "SQL Server server name"
  value       = azurerm_sql_server.this.fully_qualified_domain_name
}

output "sqlserver_id" {
  description = "SQL Server ID"
  value       = azurerm_sql_server.this.id
}

output "sqldatabase_id" {
  description = "SQL Database ID"
  value       = azurerm_sql_database.this.*.id
}
