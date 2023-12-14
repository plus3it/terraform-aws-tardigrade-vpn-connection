output "vpn_gateway" {
  description = "Object of VPN Gateway attributes"
  value       = aws_vpn_gateway.this
}

output "vpn_connections" {
  description = "Map of objects containing VPN Connection attributes"
  value       = module.vpn_connections
}
