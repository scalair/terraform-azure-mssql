variable "server_name" {
  description = "(Required) The name of the database."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the SQL Server."
  type        = string
}

variable "location" {
  description = "(Required) The name of the resource group in which to create the database. This must be the same as Database Server resource group currently."
  type        = string
}

variable "server_version" {
  description = "(Required) The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
  type        = string
}

variable "admin_login" {
  description = "(Required) The administrator login name for the new server. Changing this forces a new resource to be created."
  type        = string
}

variable "admin_password" {
  description = "(Required) The password associated with the administrator_login user. Needs to comply with Azure's Password Policy"
  type        = string
}

variable "firewall_rules" {
  description = "Range of IP addresses to allow connections."
  type = list(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
  default = []
}

variable "subnet_to_allow" {
  description = "Subnet to allow connection from."
  type = list(object({
    name      = string
    subnet_id = string
  }))
  default = []
}

variable "ignore_missing_vnet_service_endpoint" {
  description = "(Optional) Create the virtual network rule before the subnet has the virtual network service endpoint enabled. We set the default to true."
  default     = true
}

variable "db_name" {
  description = "(Required) The name of the database."
  type        = list(string)
  default     = []
}

variable "db_edition" {
  description = "(Optional) The edition of the database to be created. Applies only if create_mode is Default. Valid values are: Basic, Standard, Premium, DataWarehouse, Business, BusinessCritical, Free, GeneralPurpose, Hyperscale, Premium, PremiumRS, Standard, Stretch, System, System2, or Web."
  type        = string
}

variable "db_max_size" {
  description = "(Optional) The maximum size that the database can grow to. Applies only if create_mode is Default. "
  type        = string
  default     = ""
}

variable "create_mode" {
  description = "(Optional) Specifies how to create the database. Valid values are: Default, Copy, OnlineSecondary, NonReadableSecondary, PointInTimeRestore, Recovery, Restore or RestoreLongTermRetentionBackup. Must be Default to create a new database. Defaults to Default."
  type        = string
  default     = "Default"
}

variable "requested_service_objective_name" {
  description = "(Optional) Use requested_service_objective_name or requested_service_objective_id to set the performance level for the database. Valid values are: S0, S1, S2, S3, P1, P2, P4, P6, P11 and ElasticPool."
  default     = "S0"
}

variable "tags" {
  description = "Default tags to apply on the resource."
  type        = map(string)

  default = {
    terraform = "true"
  }
}
