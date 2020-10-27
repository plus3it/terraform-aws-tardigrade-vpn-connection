output "vpn_gateway_id" {
  description = "ID of the VPN Gateway"
  value       = aws_vpn_gateway.this.id
}

output "customer_gateway_ids" {
  description = "IDs of the Customer Gateways"
  value       = aws_customer_gateway.this.*.id
}

output "vpn_connection_ids" {
  description = "IDs of the VPN Connections"
  value       = aws_vpn_connection.this.*.id
}

