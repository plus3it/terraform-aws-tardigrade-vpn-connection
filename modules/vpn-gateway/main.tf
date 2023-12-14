resource "aws_vpn_gateway" "this" {
  vpc_id            = var.vpn_gateway.vpc_id
  amazon_side_asn   = var.vpn_gateway.amazon_side_asn
  availability_zone = var.vpn_gateway.availability_zone

  tags = merge(
    var.vpn_gateway.tags,
    {
      "Name" = var.vpn_gateway.name
    },
  )
}

resource "aws_vpn_gateway_route_propagation" "this" {
  for_each = { for propagation in var.vpn_gateway.route_propagations : propagation.name => propagation }

  vpn_gateway_id = aws_vpn_gateway.this.id
  route_table_id = each.value.route_table_id
}

module "vpn_connections" {
  source   = "../../"
  for_each = { for vpn_connection in var.vpn_connections : vpn_connection.name => vpn_connection }

  vpn_connection = merge(
    each.value,
    {
      vpn_gateway_id = aws_vpn_gateway.this.id
    },
  )
}
