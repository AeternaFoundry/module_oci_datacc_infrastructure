resource "oci_datacc_infrastructure" "datacc_infrastructures" {
  for_each = var.datacc_infrastructures

  cloud_control_plane_server1      = each.value.cloud_control_plane_server1
  cloud_control_plane_server2      = each.value.cloud_control_plane_server2
  compartment_id                   = each.value.compartment_id
  display_name                     = each.value.display_name
  dns_servers                      = each.value.dns_servers
  gateway                          = each.value.gateway
  netmask                          = each.value.netmask
  ntp_servers                      = each.value.ntp_servers
  shape                            = each.value.shape
  system_model                     = each.value.system_model
  acfs_file_system_storage_in_gbs  = each.value.acfs_file_system_storage_in_gbs
  admin_networkcidr                = each.value.admin_networkcidr
  backup_network_bonding_interface = each.value.backup_network_bonding_interface
  backup_network_bonding_mode      = each.value.backup_network_bonding_mode
  client_network_bonding_interface = each.value.client_network_bonding_interface
  client_network_bonding_mode      = each.value.client_network_bonding_mode
  corporate_proxy                  = each.value.corporate_proxy
  cps_network_bonding_interface    = each.value.cps_network_bonding_interface
  cps_network_bonding_mode         = each.value.cps_network_bonding_mode
  data_disk_percentage             = each.value.data_disk_percentage
  defined_tags                     = each.value.defined_tags
  description                      = each.value.description
  freeform_tags                    = each.value.freeform_tags
  scale_storage_trigger            = each.value.scale_storage_trigger
  vlan_id                          = each.value.vlan_id

  dynamic "contacts" {
    for_each = each.value.contacts != null ? each.value.contacts : []
    content {
      email                    = contacts.value.email
      is_contact_mos_validated = contacts.value.is_contact_mos_validated
      is_primary               = contacts.value.is_primary
      name                     = contacts.value.name
      phone_number             = contacts.value.phone_number
    }
  }

  dynamic "maintenance_window" {
    for_each = each.value.maintenance_window != null ? [each.value.maintenance_window] : []
    content {
      custom_action_timeout_in_mins    = maintenance_window.value.custom_action_timeout_in_mins
      days_of_week                     = maintenance_window.value.days_of_week
      hours_of_day                     = maintenance_window.value.hours_of_day
      is_custom_action_timeout_enabled = maintenance_window.value.is_custom_action_timeout_enabled
      is_monthly_patching_enabled      = maintenance_window.value.is_monthly_patching_enabled
      lead_time_in_weeks               = maintenance_window.value.lead_time_in_weeks
      months                           = maintenance_window.value.months
      patching_mode                    = maintenance_window.value.patching_mode
      preference                       = maintenance_window.value.preference
      weeks_of_month                   = maintenance_window.value.weeks_of_month
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

