output "customer_gateway" {
  description = "Object of Customer Gateway attributes"
  value       = aws_customer_gateway.this
}

output "vpn_connection" {
  description = "Object of VPN Connection attributes"
  value       = aws_vpn_connection.this
}
