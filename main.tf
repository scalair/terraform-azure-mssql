resource "azurerm_sql_server" "this" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.version
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
  tags                         = var.tags
}

resource "azurerm_sql_firewall_rule" "this" {
  name                = var.firewall_rule_name
  resource_group_name = azurerm_resource_group.main.name
  server_name         = azurerm_sql_server.main.name
  start_ip_address    = var.default_start_ip_address
  end_ip_address      = var.default_end_ip_address
}

resource "azurerm_sql_database" "this" {
  count                            = length(keys(var.databases))
  name                             = var.dbname
  resource_group_name              = azurerm_resource_group.main.name
  location                         = azurerm_resource_group.main.location
  server_name                      = azurerm_sql_server.main.name
  edition                          = var.database_edition
  requested_service_objective_name = var.requested_service_objective_name
  max_size_bytes                   = var.db_max_size
  tags                             = var.tags
}
