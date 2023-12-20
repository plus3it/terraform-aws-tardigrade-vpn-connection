# terraform-aws-tardigrade-vpn-connection

Terraform module to manage a VPN Connection

## Testing

Manual testing:

```
# Replace "xxx" with an actual AWS profile, then execute the integration tests.
export AWS_PROFILE=xxx 
make terraform/pytest PYTEST_ARGS="-v --nomock"
```

For automated testing, PYTEST_ARGS is optional and no profile is needed:

```
make mockstack/up
make terraform/pytest PYTEST_ARGS="-v"
make mockstack/clean
```

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.31.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.31.0 |

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpn_connection"></a> [vpn\_connection](#input\_vpn\_connection) | n/a | <pre>object({<br>    name               = string<br>    static_routes_only = optional(bool, false)<br>    tags               = optional(map(string), {})<br>    type               = optional(string, "ipsec.1")<br><br>    transit_gateway_id = optional(string)<br>    vpn_gateway_id     = optional(string)<br><br>    enable_acceleration                     = optional(bool)<br>    outside_ip_address_type                 = optional(string)<br>    transport_transit_gateway_attachment_id = optional(string)<br>    tunnel_inside_ip_version                = optional(string)<br><br>    local_ipv4_network_cidr = optional(string)<br>    local_ipv6_network_cidr = optional(string)<br><br>    remote_ipv4_network_cidr = optional(string)<br>    remote_ipv6_network_cidr = optional(string)<br><br>    tunnel1_inside_cidr                     = optional(string)<br>    tunnel1_inside_ipv6_cidr                = optional(string)<br>    tunnel1_preshared_key                   = optional(string)<br>    tunnel1_dpd_timeout_action              = optional(string)<br>    tunnel1_dpd_timeout_seconds             = optional(number)<br>    tunnel1_enable_tunnel_lifecycle_control = optional(bool)<br>    tunnel1_ike_versions                    = optional(list(string))<br>    tunnel1_rekey_fuzz_percentage           = optional(number)<br>    tunnel1_rekey_margin_time_seconds       = optional(number)<br>    tunnel1_replay_window_size              = optional(number)<br>    tunnel1_startup_action                  = optional(string)<br><br>    tunnel1_phase1_dh_group_numbers      = optional(list(number))<br>    tunnel1_phase1_encryption_algorithms = optional(list(string))<br>    tunnel1_phase1_integrity_algorithms  = optional(list(string))<br>    tunnel1_phase1_lifetime_seconds      = optional(number)<br><br>    tunnel1_phase2_dh_group_numbers      = optional(list(number))<br>    tunnel1_phase2_encryption_algorithms = optional(list(string))<br>    tunnel1_phase2_integrity_algorithms  = optional(list(string))<br>    tunnel1_phase2_lifetime_seconds      = optional(number)<br><br>    tunnel1_log_options = optional(object({<br>      cloudwatch_log_options = optional(object({<br>        log_group_arn     = optional(string)<br>        log_enabled       = optional(bool, true)<br>        log_output_format = optional(string, "json")<br>      }), {})<br><br>      cloudwatch_log_group = optional(object({<br>        kms_key_id        = optional(string)<br>        log_group_class   = optional(string, "INFREQUENT_ACCESS")<br>        retention_in_days = optional(number, 30)<br>        skip_destroy      = optional(bool, false)<br>        tags              = optional(map(string), {})<br>      }), {})<br>    }), {})<br><br>    tunnel2_inside_cidr                     = optional(string)<br>    tunnel2_inside_ipv6_cidr                = optional(string)<br>    tunnel2_preshared_key                   = optional(string)<br>    tunnel2_dpd_timeout_action              = optional(string)<br>    tunnel2_dpd_timeout_seconds             = optional(number)<br>    tunnel2_enable_tunnel_lifecycle_control = optional(bool)<br>    tunnel2_ike_versions                    = optional(list(string))<br>    tunnel2_rekey_fuzz_percentage           = optional(number)<br>    tunnel2_rekey_margin_time_seconds       = optional(number)<br>    tunnel2_replay_window_size              = optional(number)<br>    tunnel2_startup_action                  = optional(string)<br><br>    tunnel2_phase1_dh_group_numbers      = optional(list(number))<br>    tunnel2_phase1_encryption_algorithms = optional(list(string))<br>    tunnel2_phase1_integrity_algorithms  = optional(list(string))<br>    tunnel2_phase1_lifetime_seconds      = optional(number)<br><br>    tunnel2_phase2_dh_group_numbers      = optional(list(number))<br>    tunnel2_phase2_encryption_algorithms = optional(list(string))<br>    tunnel2_phase2_integrity_algorithms  = optional(list(string))<br>    tunnel2_phase2_lifetime_seconds      = optional(number)<br><br>    tunnel2_log_options = optional(object({<br>      cloudwatch_log_options = optional(object({<br>        log_group_arn     = optional(string)<br>        log_enabled       = optional(bool, true)<br>        log_output_format = optional(string, "json")<br>      }), {})<br><br>      cloudwatch_log_group = optional(object({<br>        kms_key_id        = optional(string)<br>        log_group_class   = optional(string, "INFREQUENT_ACCESS")<br>        retention_in_days = optional(number, 30)<br>        skip_destroy      = optional(bool, false)<br>        tags              = optional(map(string), {})<br>      }), {})<br>    }), {})<br><br>    customer_gateway = object({<br>      name            = string<br>      bgp_asn         = string<br>      certificate_arn = optional(string)<br>      device_name     = optional(string)<br>      ip_address      = optional(string)<br>      tags            = optional(map(string))<br>      type            = optional(string, "ipsec.1")<br>    })<br><br>    routes = optional(list(object({<br>      name                   = string<br>      destination_cidr_block = string<br>    })), [])<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_customer_gateway"></a> [customer\_gateway](#output\_customer\_gateway) | Object of Customer Gateway attributes |
| <a name="output_vpn_connection"></a> [vpn\_connection](#output\_vpn\_connection) | Object of VPN Connection attributes |

<!-- END TFDOCS -->
