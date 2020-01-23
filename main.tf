resource "azurerm_sql_server" "this" {
  name                         = lower(var.server_name)
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
  tags                         = var.tags
}

resource "azurerm_sql_firewall_rule" "this" {
  count               = length(var.firewall_rules)
  name                = element(var.firewall_rules, count.index).name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.this.name
  start_ip_address    = element(var.firewall_rules, count.index).start_ip_address
  end_ip_address      = element(var.firewall_rules, count.index).end_ip_address
}

resource "azurerm_sql_database" "this" {
  count                            = length(var.db_name)
  name                             = element(var.db_name, count.index)
  resource_group_name              = var.resource_group_name
  location                         = var.location
  server_name                      = lower(azurerm_sql_server.this.name)
  edition                          = var.db_edition
  requested_service_objective_name = var.requested_service_objective_name
  #max_size_bytes                   = var.db_max_size
  tags = var.tags
}

resource "azurerm_sql_virtual_network_rule" "this" {
  count                                = length(var.subnet_to_allow)
  name                                 = element(var.subnet_to_allow, count.index).name
  resource_group_name                  = var.resource_group_name
  server_name                          = azurerm_sql_server.this.name
  subnet_id                            = element(var.subnet_to_allow, count.index).subnet_id
  ignore_missing_vnet_service_endpoint = var.ignore_missing_vnet_service_endpoint
}
