variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "virtual_machine_scale_sets" {
  description = "Map of virtual machine scale sets to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-compute-virtualmachinescaleset/azurerm v0.11.1 (https://registry.terraform.io/modules/Azure/avm-res-compute-virtualmachinescaleset/azurerm/0.11.1) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                                = string
    tags                                = optional(map(string))
    enable_telemetry                    = optional(bool)
    role_assignments                    = optional(any, null)
    admin_password_version              = optional(string, null)
    data_disk                           = optional(any, null)
    disk_controller_type                = optional(string, null)
    lock                                = optional(any, null)
    platform_fault_domain_count         = optional(number, null)
    source_image_reference              = optional(any, null)
    upgrade_policy                      = optional(any, null)
    additional_capabilities             = optional(any, null)
    capacity_reservation_group_id       = optional(string, null)
    extension                           = optional(any, null)
    ignore_body_changes                 = optional(any, null)
    zones                               = optional(set(string), null)
    extension_protected_setting         = map(string)
    admin_ssh_keys                      = optional(any, null)
    plan                                = optional(any, null)
    priority                            = optional(string, null)
    proximity_placement_group_id        = optional(string, null)
    sku_name                            = optional(string, null)
    network_interface                   = optional(any, null)
    os_disk                             = optional(any, null)
    os_profile                          = optional(any, null)
    priority_mix                        = optional(any, null)
    proxy_agent_settings                = optional(any, null)
    single_placement_group              = optional(bool, null)
    source_image_id                     = optional(string, null)
    termination_notification            = optional(any, null)
    automatic_instance_repair           = optional(any, null)
    extension_operations_enabled        = optional(bool, null)
    license_type                        = optional(string, null)
    timeouts                            = optional(any, null)
    zone_balance                        = optional(bool, null)
    boot_diagnostics                    = optional(any, null)
    instances                           = optional(number, null)
    managed_identities                  = optional(any, null)
    network_api_version                 = optional(string, null)
    user_data_base64_version            = optional(string, null)
    custom_data                         = optional(string, null)
    custom_data_version                 = optional(string, null)
    admin_password                      = optional(string, null)
    eviction_policy                     = optional(string, null)
    extension_protected_setting_version = optional(map(string), null)
    user_data_base64                    = string
    encryption_at_host_enabled          = optional(bool, null)
    extensions_time_budget              = optional(string, null)
    max_bid_price                       = optional(number, null)
  }))
  default = {}
}
