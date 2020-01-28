# terraform-aws-tardigrade-vpn-connection

Terraform module to create a VPN Connection


<!-- BEGIN TFDOCS -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| cgw\_bgp\_asn | BGP ASN of the customer gateway | `string` | n/a | yes |
| name | Name tag to associate to all resources that support tags | `string` | n/a | yes |
| vpc\_id | VPC ID to which the VPN Connection will be attached | `string` | n/a | yes |
| amazon\_side\_asn | ASN for the Amazon side of the VPN gateway | `string` | `"64512"` | no |
| cgw\_ip\_addresses | List of IP addresses of the customer gateways | `list(string)` | `[]` | no |
| create\_vpn\_connection | Controls whether to create the VPN resources | `bool` | `true` | no |
| destination\_cidr\_blocks | List of CIDR blocks to route through the VPN Connection | `list` | `[]` | no |
| propagating\_route\_table\_count | Number of route tables in the list of progagating\_route\_table\_ids | `string` | `"0"` | no |
| propagating\_route\_table\_ids | List of Route Table IDs to propagate routes into, from the VPN Gateway | `list` | `[]` | no |
| static\_routes\_only | Boolean used to determine whether the VPN connection uses static routes exclusively. Static routes must be used for devices that don't support BGP | `bool` | `"false"` | no |
| tags | A map of tags to add to any VPN resource that supports tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| customer\_gateway\_ids | IDs of the Customer Gateways |
| vpn\_connection\_ids | IDs of the VPN Connections |
| vpn\_gateway\_id | ID of the VPN Gateway |

<!-- END TFDOCS -->
