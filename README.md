# terraform-aws-tardigrade-vpn-connection

Terraform module to create a VPN Connection

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
| <a name="input_amazon_side_asn"></a> [amazon\_side\_asn](#input\_amazon\_side\_asn) | ASN for the Amazon side of the VPN gateway | `string` | `"64512"` | no |
| <a name="input_cgw_bgp_asn"></a> [cgw\_bgp\_asn](#input\_cgw\_bgp\_asn) | BGP ASN of the customer gateway | `string` | `null` | no |
| <a name="input_cgw_ip_addresses"></a> [cgw\_ip\_addresses](#input\_cgw\_ip\_addresses) | List of IP addresses of the customer gateways | `list(string)` | `[]` | no |
| <a name="input_destination_cidr_blocks"></a> [destination\_cidr\_blocks](#input\_destination\_cidr\_blocks) | List of CIDR blocks to route through the VPN Connection | `list` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name tag to associate to all resources that support tags | `string` | `null` | no |
| <a name="input_propagating_route_table_count"></a> [propagating\_route\_table\_count](#input\_propagating\_route\_table\_count) | Number of route tables in the list of progagating\_route\_table\_ids | `string` | `"0"` | no |
| <a name="input_propagating_route_table_ids"></a> [propagating\_route\_table\_ids](#input\_propagating\_route\_table\_ids) | List of Route Table IDs to propagate routes into, from the VPN Gateway | `list` | `[]` | no |
| <a name="input_static_routes_only"></a> [static\_routes\_only](#input\_static\_routes\_only) | Boolean used to determine whether the VPN connection uses static routes exclusively. Static routes must be used for devices that don't support BGP | `bool` | `"false"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to any VPN resource that supports tags | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to which the VPN Connection will be attached | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_customer_gateway_ids"></a> [customer\_gateway\_ids](#output\_customer\_gateway\_ids) | IDs of the Customer Gateways |
| <a name="output_vpn_connection_ids"></a> [vpn\_connection\_ids](#output\_vpn\_connection\_ids) | IDs of the VPN Connections |
| <a name="output_vpn_gateway_id"></a> [vpn\_gateway\_id](#output\_vpn\_gateway\_id) | ID of the VPN Gateway |

<!-- END TFDOCS -->
