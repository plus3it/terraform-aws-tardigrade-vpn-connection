variable "vpn_connection" {
  type = object({
    name               = string
    static_routes_only = optional(bool, false)
    tags               = optional(map(string), {})
    type               = optional(string, "ipsec.1")

    transit_gateway_id = optional(string)
    vpn_gateway_id     = optional(string)

    enable_acceleration                     = optional(bool)
    outside_ip_address_type                 = optional(string)
    transport_transit_gateway_attachment_id = optional(string)
    tunnel_inside_ip_version                = optional(string)

    local_ipv4_network_cidr = optional(string)
    local_ipv6_network_cidr = optional(string)

    remote_ipv4_network_cidr = optional(string)
    remote_ipv6_network_cidr = optional(string)

    tunnel1_inside_cidr                     = optional(string)
    tunnel1_inside_ipv6_cidr                = optional(string)
    tunnel1_preshared_key                   = optional(string)
    tunnel1_dpd_timeout_action              = optional(string)
    tunnel1_dpd_timeout_seconds             = optional(number)
    tunnel1_enable_tunnel_lifecycle_control = optional(bool)
    tunnel1_ike_versions                    = optional(list(string))
    tunnel1_rekey_fuzz_percentage           = optional(number)
    tunnel1_rekey_margin_time_seconds       = optional(number)
    tunnel1_replay_window_size              = optional(number)
    tunnel1_startup_action                  = optional(string)

    tunnel1_phase1_dh_group_numbers      = optional(list(number))
    tunnel1_phase1_encryption_algorithms = optional(list(string))
    tunnel1_phase1_integrity_algorithms  = optional(list(string))
    tunnel1_phase1_lifetime_seconds      = optional(number)

    tunnel1_phase2_dh_group_numbers      = optional(list(number))
    tunnel1_phase2_encryption_algorithms = optional(list(string))
    tunnel1_phase2_integrity_algorithms  = optional(list(string))
    tunnel1_phase2_lifetime_seconds      = optional(number)

    tunnel1_log_options = optional(object({
      cloudwatch_log_options = optional(object({
        log_group_arn     = optional(string)
        log_enabled       = optional(bool, true)
        log_output_format = optional(string, "json")
      }), {})

      cloudwatch_log_group = optional(object({
        kms_key_id        = optional(string)
        log_group_class   = optional(string, "INFREQUENT_ACCESS")
        retention_in_days = optional(number, 30)
        skip_destroy      = optional(bool, false)
        tags              = optional(map(string), {})
      }), {})
    }), {})

    tunnel2_inside_cidr                     = optional(string)
    tunnel2_inside_ipv6_cidr                = optional(string)
    tunnel2_preshared_key                   = optional(string)
    tunnel2_dpd_timeout_action              = optional(string)
    tunnel2_dpd_timeout_seconds             = optional(number)
    tunnel2_enable_tunnel_lifecycle_control = optional(bool)
    tunnel2_ike_versions                    = optional(list(string))
    tunnel2_rekey_fuzz_percentage           = optional(number)
    tunnel2_rekey_margin_time_seconds       = optional(number)
    tunnel2_replay_window_size              = optional(number)
    tunnel2_startup_action                  = optional(string)

    tunnel2_phase1_dh_group_numbers      = optional(list(number))
    tunnel2_phase1_encryption_algorithms = optional(list(string))
    tunnel2_phase1_integrity_algorithms  = optional(list(string))
    tunnel2_phase1_lifetime_seconds      = optional(number)

    tunnel2_phase2_dh_group_numbers      = optional(list(number))
    tunnel2_phase2_encryption_algorithms = optional(list(string))
    tunnel2_phase2_integrity_algorithms  = optional(list(string))
    tunnel2_phase2_lifetime_seconds      = optional(number)

    tunnel2_log_options = optional(object({
      cloudwatch_log_options = optional(object({
        log_group_arn     = optional(string)
        log_enabled       = optional(bool, true)
        log_output_format = optional(string, "json")
      }), {})

      cloudwatch_log_group = optional(object({
        kms_key_id        = optional(string)
        log_group_class   = optional(string, "INFREQUENT_ACCESS")
        retention_in_days = optional(number, 30)
        skip_destroy      = optional(bool, false)
        tags              = optional(map(string), {})
      }), {})
    }), {})

    customer_gateway = object({
      name            = string
      bgp_asn         = string
      certificate_arn = optional(string)
      device_name     = optional(string)
      ip_address      = optional(string)
      tags            = optional(map(string))
      type            = optional(string, "ipsec.1")
    })

    routes = optional(list(object({
      name                   = string
      destination_cidr_block = string
    })), [])

    transit_gateway_route_table_association = optional(object({
      transit_gateway_route_table_id = string
    }))

    transit_gateway_route_table_propagations = optional(list(object({
      name                           = string
      transit_gateway_route_table_id = string
    })), [])
  })
}
