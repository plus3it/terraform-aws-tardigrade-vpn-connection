resource "aws_vpn_connection" "this" {
  customer_gateway_id = aws_customer_gateway.this.id
  static_routes_only  = var.vpn_connection.static_routes_only
  type                = var.vpn_connection.type

  transit_gateway_id = var.vpn_connection.transit_gateway_id
  vpn_gateway_id     = var.vpn_connection.vpn_gateway_id

  enable_acceleration                     = var.vpn_connection.enable_acceleration
  outside_ip_address_type                 = var.vpn_connection.outside_ip_address_type
  transport_transit_gateway_attachment_id = var.vpn_connection.transport_transit_gateway_attachment_id
  tunnel_inside_ip_version                = var.vpn_connection.tunnel_inside_ip_version

  local_ipv4_network_cidr = var.vpn_connection.local_ipv4_network_cidr
  local_ipv6_network_cidr = var.vpn_connection.local_ipv6_network_cidr

  remote_ipv4_network_cidr = var.vpn_connection.remote_ipv4_network_cidr
  remote_ipv6_network_cidr = var.vpn_connection.remote_ipv6_network_cidr

  tunnel1_inside_cidr                     = var.vpn_connection.tunnel1_inside_cidr
  tunnel1_inside_ipv6_cidr                = var.vpn_connection.tunnel1_inside_ipv6_cidr
  tunnel1_preshared_key                   = var.vpn_connection.tunnel1_preshared_key
  tunnel1_dpd_timeout_action              = var.vpn_connection.tunnel1_dpd_timeout_action
  tunnel1_dpd_timeout_seconds             = var.vpn_connection.tunnel1_dpd_timeout_seconds
  tunnel1_enable_tunnel_lifecycle_control = var.vpn_connection.tunnel1_enable_tunnel_lifecycle_control
  tunnel1_ike_versions                    = var.vpn_connection.tunnel1_ike_versions
  tunnel1_rekey_fuzz_percentage           = var.vpn_connection.tunnel1_rekey_fuzz_percentage
  tunnel1_rekey_margin_time_seconds       = var.vpn_connection.tunnel1_rekey_margin_time_seconds
  tunnel1_replay_window_size              = var.vpn_connection.tunnel1_replay_window_size
  tunnel1_startup_action                  = var.vpn_connection.tunnel1_startup_action

  tunnel1_phase1_dh_group_numbers      = var.vpn_connection.tunnel1_phase1_dh_group_numbers
  tunnel1_phase1_encryption_algorithms = var.vpn_connection.tunnel1_phase1_encryption_algorithms
  tunnel1_phase1_integrity_algorithms  = var.vpn_connection.tunnel1_phase1_integrity_algorithms
  tunnel1_phase1_lifetime_seconds      = var.vpn_connection.tunnel1_phase1_lifetime_seconds

  tunnel1_phase2_dh_group_numbers      = var.vpn_connection.tunnel1_phase2_dh_group_numbers
  tunnel1_phase2_encryption_algorithms = var.vpn_connection.tunnel1_phase2_encryption_algorithms
  tunnel1_phase2_integrity_algorithms  = var.vpn_connection.tunnel1_phase2_integrity_algorithms
  tunnel1_phase2_lifetime_seconds      = var.vpn_connection.tunnel1_phase2_lifetime_seconds

  tunnel2_inside_cidr                     = var.vpn_connection.tunnel2_inside_cidr
  tunnel2_inside_ipv6_cidr                = var.vpn_connection.tunnel2_inside_ipv6_cidr
  tunnel2_preshared_key                   = var.vpn_connection.tunnel2_preshared_key
  tunnel2_dpd_timeout_action              = var.vpn_connection.tunnel2_dpd_timeout_action
  tunnel2_dpd_timeout_seconds             = var.vpn_connection.tunnel2_dpd_timeout_seconds
  tunnel2_enable_tunnel_lifecycle_control = var.vpn_connection.tunnel2_enable_tunnel_lifecycle_control
  tunnel2_ike_versions                    = var.vpn_connection.tunnel2_ike_versions
  tunnel2_rekey_fuzz_percentage           = var.vpn_connection.tunnel2_rekey_fuzz_percentage
  tunnel2_rekey_margin_time_seconds       = var.vpn_connection.tunnel2_rekey_margin_time_seconds
  tunnel2_replay_window_size              = var.vpn_connection.tunnel2_replay_window_size
  tunnel2_startup_action                  = var.vpn_connection.tunnel2_startup_action

  tunnel2_phase1_dh_group_numbers      = var.vpn_connection.tunnel2_phase1_dh_group_numbers
  tunnel2_phase1_encryption_algorithms = var.vpn_connection.tunnel2_phase1_encryption_algorithms
  tunnel2_phase1_integrity_algorithms  = var.vpn_connection.tunnel2_phase1_integrity_algorithms
  tunnel2_phase1_lifetime_seconds      = var.vpn_connection.tunnel2_phase1_lifetime_seconds

  tunnel2_phase2_dh_group_numbers      = var.vpn_connection.tunnel2_phase2_dh_group_numbers
  tunnel2_phase2_encryption_algorithms = var.vpn_connection.tunnel2_phase2_encryption_algorithms
  tunnel2_phase2_integrity_algorithms  = var.vpn_connection.tunnel2_phase2_integrity_algorithms
  tunnel2_phase2_lifetime_seconds      = var.vpn_connection.tunnel2_phase2_lifetime_seconds

  dynamic "tunnel1_log_options" {
    for_each = var.vpn_connection.tunnel1_log_options == null ? [] : [var.vpn_connection.tunnel1_log_options]
    content {
      cloudwatch_log_options {
        log_group_arn     = tunnel1_log_options.cloudwatch_log_options.log_group_arn
        log_enabled       = tunnel1_log_options.cloudwatch_log_options.log_enabled
        log_output_format = tunnel1_log_options.cloudwatch_log_options.log_output_format
      }
    }
  }

  dynamic "tunnel2_log_options" {
    for_each = var.vpn_connection.tunnel2_log_options == null ? [] : [var.vpn_connection.tunnel2_log_options]
    content {
      cloudwatch_log_options {
        log_group_arn     = tunnel2_log_options.cloudwatch_log_options.log_group_arn
        log_enabled       = tunnel2_log_options.cloudwatch_log_options.log_enabled
        log_output_format = tunnel2_log_options.cloudwatch_log_options.log_output_format
      }
    }
  }

  tags = merge(
    var.vpn_connection.tags,
    {
      "Name" = var.vpn_connection.name
    },
  )
}

resource "aws_customer_gateway" "this" {
  bgp_asn         = var.vpn_connection.customer_gateway.bgp_asn
  certificate_arn = var.vpn_connection.customer_gateway.certificate_arn
  device_name     = var.vpn_connection.customer_gateway.device_name
  ip_address      = var.vpn_connection.customer_gateway.ip_address
  type            = var.vpn_connection.customer_gateway.type

  tags = merge(
    var.vpn_connection.customer_gateway.tags,
    {
      "Name" = var.vpn_connection.customer_gateway.name
    },
  )
}

resource "aws_vpn_connection_route" "this" {
  for_each = { for route in var.vpn_connection.routes : route.name => route }

  destination_cidr_block = each.value.destination_cidr_block
  vpn_connection_id      = aws_vpn_connection.this.id
}
