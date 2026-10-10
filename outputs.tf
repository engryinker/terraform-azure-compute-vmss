output "virtual_machine_scale_sets" {
  description = "Map (same keys as var.virtual_machine_scale_sets) of every output from each virtual machine scale sets created -- see upstream module docs for the full shape."
  value       = module.virtual_machine_scale_set
}
