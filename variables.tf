variable "datacc_infrastructures" {
  description = <<EOT
Map of datacc_infrastructures, attributes below
Required:
    - cloud_control_plane_server1
    - cloud_control_plane_server2
    - compartment_id
    - display_name
    - dns_servers
    - gateway
    - netmask
    - ntp_servers
    - shape
    - system_model
Optional:
    - acfs_file_system_storage_in_gbs
    - admin_networkcidr
    - backup_network_bonding_interface
    - backup_network_bonding_mode
    - client_network_bonding_interface
    - client_network_bonding_mode
    - corporate_proxy
    - cps_network_bonding_interface
    - cps_network_bonding_mode
    - data_disk_percentage
    - defined_tags
    - description
    - freeform_tags
    - scale_storage_trigger
    - vlan_id
    - contacts (block):
        - email (required)
        - is_contact_mos_validated (optional)
        - is_primary (required)
        - name (required)
        - phone_number (optional)
    - maintenance_window (block):
        - custom_action_timeout_in_mins (optional)
        - days_of_week (optional)
        - hours_of_day (optional)
        - is_custom_action_timeout_enabled (optional)
        - is_monthly_patching_enabled (optional)
        - lead_time_in_weeks (optional)
        - months (optional)
        - patching_mode (optional)
        - preference (optional)
        - weeks_of_month (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    cloud_control_plane_server1      = string
    cloud_control_plane_server2      = string
    compartment_id                   = string
    display_name                     = string
    dns_servers                      = list(string)
    gateway                          = string
    netmask                          = string
    ntp_servers                      = list(string)
    shape                            = string
    system_model                     = string
    acfs_file_system_storage_in_gbs  = optional(number)
    admin_networkcidr                = optional(string)
    backup_network_bonding_interface = optional(string)
    backup_network_bonding_mode      = optional(string)
    client_network_bonding_interface = optional(string)
    client_network_bonding_mode      = optional(string)
    corporate_proxy                  = optional(string)
    cps_network_bonding_interface    = optional(string)
    cps_network_bonding_mode         = optional(string)
    data_disk_percentage             = optional(number)
    defined_tags                     = optional(map(string))
    description                      = optional(string)
    freeform_tags                    = optional(map(string))
    scale_storage_trigger            = optional(number)
    vlan_id                          = optional(string)
    contacts = optional(list(object({
      email                    = string
      is_contact_mos_validated = optional(bool)
      is_primary               = bool
      name                     = string
      phone_number             = optional(string)
    })))
    maintenance_window = optional(object({
      custom_action_timeout_in_mins    = optional(number)
      days_of_week                     = optional(list(string))
      hours_of_day                     = optional(list(number))
      is_custom_action_timeout_enabled = optional(bool)
      is_monthly_patching_enabled      = optional(bool)
      lead_time_in_weeks               = optional(number)
      months                           = optional(list(string))
      patching_mode                    = optional(string)
      preference                       = optional(string)
      weeks_of_month                   = optional(list(number))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

