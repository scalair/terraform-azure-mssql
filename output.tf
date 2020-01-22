output "sqlserver_name" {
  description = "SQL Server server name"
  value       = azurerm_sql_server.this.name
}

output "sqlserver_administrator_login" {
  description = "Username for SQL Server admin user."
  value       = "${azurerm_sql_server.this.administrator_login}"
}
