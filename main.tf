data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "virtual_machine_scale_set" {
  source   = "Azure/avm-res-compute-virtualmachinescaleset/azurerm"
  version  = "0.11.1"
  for_each = var.virtual_machine_scale_sets

  name                                = each.value.name
  location                            = var.location
  parent_id                           = data.azurerm_resource_group.this.id
  tags                                = coalesce(each.value.tags, var.tags)
  enable_telemetry                    = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  role_assignments                    = each.value.role_assignments
  admin_password_version              = each.value.admin_password_version
  data_disk                           = each.value.data_disk
  disk_controller_type                = each.value.disk_controller_type
  lock                                = each.value.lock
  platform_fault_domain_count         = each.value.platform_fault_domain_count
  source_image_reference              = each.value.source_image_reference
  upgrade_policy                      = each.value.upgrade_policy
  additional_capabilities             = each.value.additional_capabilities
  capacity_reservation_group_id       = each.value.capacity_reservation_group_id
  extension                           = each.value.extension
  ignore_body_changes                 = each.value.ignore_body_changes
  zones                               = each.value.zones
  extension_protected_setting         = each.value.extension_protected_setting
  admin_ssh_keys                      = each.value.admin_ssh_keys
  plan                                = each.value.plan
  priority                            = each.value.priority
  proximity_placement_group_id        = each.value.proximity_placement_group_id
  sku_name                            = each.value.sku_name
  network_interface                   = each.value.network_interface
  os_disk                             = each.value.os_disk
  os_profile                          = each.value.os_profile
  priority_mix                        = each.value.priority_mix
  proxy_agent_settings                = each.value.proxy_agent_settings
  single_placement_group              = each.value.single_placement_group
  source_image_id                     = each.value.source_image_id
  termination_notification            = each.value.termination_notification
  automatic_instance_repair           = each.value.automatic_instance_repair
  extension_operations_enabled        = each.value.extension_operations_enabled
  license_type                        = each.value.license_type
  timeouts                            = each.value.timeouts
  zone_balance                        = each.value.zone_balance
  boot_diagnostics                    = each.value.boot_diagnostics
  instances                           = each.value.instances
  managed_identities                  = each.value.managed_identities
  network_api_version                 = each.value.network_api_version
  user_data_base64_version            = each.value.user_data_base64_version
  custom_data                         = each.value.custom_data
  custom_data_version                 = each.value.custom_data_version
  admin_password                      = each.value.admin_password
  eviction_policy                     = each.value.eviction_policy
  extension_protected_setting_version = each.value.extension_protected_setting_version
  user_data_base64                    = each.value.user_data_base64
  encryption_at_host_enabled          = each.value.encryption_at_host_enabled
  extensions_time_budget              = each.value.extensions_time_budget
  max_bid_price                       = each.value.max_bid_price
}
