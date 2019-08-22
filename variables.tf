variable "create_vpn_connection" {
  description = "Controls whether to create the VPN resources"
  default     = true
}

variable "name" {
  description = "Name tag to associate to all resources that support tags"
  type        = "string"
  default     = ""
}

variable "vpc_id" {
  description = "VPC ID to which the VPN Connection will be attached"
  type        = "string"
  default     = ""
}

variable "amazon_side_asn" {
  description = "ASN for the Amazon side of the VPN gateway"
  type        = "string"
  default     = "64512"
}

variable "cgw_bgp_asn" {
  description = "BGP ASN of the customer gateway"
  type        = "string"
  default     = ""
}

variable "cgw_ip_addresses" {
  description = "List of IP addresses of the customer gateways"
  type        = "list"
  default     = []
}

variable "static_routes_only" {
  description = "Boolean used to determine whether the VPN connection uses static routes exclusively. Static routes must be used for devices that don't support BGP"
  type        = "string"
  default     = "false"
}

variable "destination_cidr_blocks" {
  description = "List of CIDR blocks to route through the VPN Connection"
  default     = []
}

variable "propagating_route_table_ids" {
  description = "List of Route Table IDs to propagate routes into, from the VPN Gateway"
  default     = []
}

# Hack to work around count not computed errors, pending tf 0.12 for a solution based on length of propagating_route_table_ids
variable "propagating_route_table_count" {
  description = "Number of route tables in the list of progagating_route_table_ids"
  default     = "0"
}

variable "tags" {
  description = "A map of tags to add to any VPN resource that supports tags"
  type        = "map"
  default     = {}
}
