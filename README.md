# terraform-azure-compute-vmss

Org-standard Terraform wrapper for: **virtual machine scale sets**.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/<org>/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/<org>/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "compute-vmss" {
  source = "git::https://github.com/<org>/terraform-azure-compute-vmss.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  virtual_machine_scale_sets = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `virtual_machine_scale_sets` (virtual machine scale sets)

Wraps [Azure/avm-res-compute-virtualmachinescaleset/azurerm](https://registry.terraform.io/modules/Azure/avm-res-compute-virtualmachinescaleset/azurerm/0.11.1) v0.11.1.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `role_assignments` | `any` | no |  |
| `admin_password_version` | `string` | no |  |
| `data_disk` | `any` | no |  |
| `disk_controller_type` | `string` | no |  |
| `lock` | `any` | no |  |
| `platform_fault_domain_count` | `number` | no |  |
| `source_image_reference` | `any` | no |  |
| `upgrade_policy` | `any` | no |  |
| `additional_capabilities` | `any` | no |  |
| `capacity_reservation_group_id` | `string` | no |  |
| `extension` | `any` | no |  |
| `ignore_body_changes` | `any` | no |  |
| `zones` | `set(string)` | no |  |
| `extension_protected_setting` | `map(string)` | yes |  |
| `admin_ssh_keys` | `any` | no |  |
| `plan` | `any` | no |  |
| `priority` | `string` | no |  |
| `proximity_placement_group_id` | `string` | no |  |
| `sku_name` | `string` | no |  |
| `network_interface` | `any` | no |  |
| `os_disk` | `any` | no |  |
| `os_profile` | `any` | no |  |
| `priority_mix` | `any` | no |  |
| `proxy_agent_settings` | `any` | no |  |
| `single_placement_group` | `bool` | no |  |
| `source_image_id` | `string` | no |  |
| `termination_notification` | `any` | no |  |
| `automatic_instance_repair` | `any` | no |  |
| `extension_operations_enabled` | `bool` | no |  |
| `license_type` | `string` | no |  |
| `timeouts` | `any` | no |  |
| `zone_balance` | `bool` | no |  |
| `boot_diagnostics` | `any` | no |  |
| `instances` | `number` | no |  |
| `managed_identities` | `any` | no |  |
| `network_api_version` | `string` | no |  |
| `user_data_base64_version` | `string` | no |  |
| `custom_data` | `string` | no |  |
| `custom_data_version` | `string` | no |  |
| `admin_password` | `string` | no |  |
| `eviction_policy` | `string` | no |  |
| `extension_protected_setting_version` | `map(string)` | no |  |
| `user_data_base64` | `string` | yes |  |
| `encryption_at_host_enabled` | `bool` | no |  |
| `extensions_time_budget` | `string` | no |  |
| `max_bid_price` | `number` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `virtual_machine_scale_sets` -- map (same keys as the input) of every output from each created virtual machine scale sets.
