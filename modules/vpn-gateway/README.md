# terraform-aws-tardigrade-vpn-connection/modules/vpn-gateway

Terraform module to manage a VPN Gateway with its VPN Connections

<!-- BEGIN TFDOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpn_gateway"></a> [vpn\_gateway](#input\_vpn\_gateway) | n/a | <pre>object({<br>    name              = string<br>    amazon_side_asn   = optional(string)<br>    availability_zone = optional(string)<br>    tags              = optional(map(string))<br>    vpc_id            = optional(string)<br><br>    route_propagations = optional(list(object({<br>      name           = string<br>      route_table_id = string<br>    })), [])<br>  })</pre> | n/a | yes |
| <a name="input_vpn_connections"></a> [vpn\_connections](#input\_vpn\_connections) | List of VPN Connections to create and associate to this VPN Gateway. See top-level module for options | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpn_connections"></a> [vpn\_connections](#output\_vpn\_connections) | Map of objects containing VPN Connection attributes |
| <a name="output_vpn_gateway"></a> [vpn\_gateway](#output\_vpn\_gateway) | Object of VPN Gateway attributes |

<!-- END TFDOCS -->
