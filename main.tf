locals {
  vgw_name = var.name == null ? "VGW" : "VGW_${var.name}"
  cgw_name = var.name == null ? "CGW" : "CGW_${var.name}"
  vpn_name = var.name == null ? "VPN" : "VPN_${var.name}"
}

resource "aws_vpn_gateway" "this" {
  count = var.create_vpn_connection ? 1 : 0

  vpc_id          = var.vpc_id
  amazon_side_asn = var.amazon_side_asn
  tags = merge(
    var.tags,
    {
      "Name" = local.vgw_name
    },
  )
}

resource "aws_customer_gateway" "this" {
  count = var.create_vpn_connection ? length(var.cgw_ip_addresses) : 0

  bgp_asn    = var.cgw_bgp_asn
  ip_address = var.cgw_ip_addresses[count.index]
  type       = "ipsec.1"
  tags = merge(
    var.tags,
    {
      "Name" = "${local.cgw_name}_${count.index}"
    },
  )
}

resource "aws_vpn_connection" "this" {
  count = var.create_vpn_connection ? length(var.cgw_ip_addresses) : 0

  vpn_gateway_id      = aws_vpn_gateway.this[0].id
  customer_gateway_id = aws_customer_gateway.this[count.index].id
  type                = "ipsec.1"
  static_routes_only  = var.static_routes_only
  tags = merge(
    var.tags,
    {
      "Name" = "${local.vpn_name}_${count.index}"
    },
  )
}

resource "aws_vpn_connection_route" "this" {
  count = var.create_vpn_connection ? length(var.destination_cidr_blocks) : 0

  destination_cidr_block = var.destination_cidr_blocks[count.index]
  vpn_connection_id      = aws_vpn_connection.this[0].id
}

resource "aws_vpn_gateway_route_propagation" "this" {
  count = var.create_vpn_connection ? var.propagating_route_table_count : 0

  vpn_gateway_id = aws_vpn_gateway.this[0].id
  route_table_id = var.propagating_route_table_ids[count.index]
}
