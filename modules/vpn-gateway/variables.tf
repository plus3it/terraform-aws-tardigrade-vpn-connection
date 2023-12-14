variable "vpn_gateway" {
  type = object({
    name              = string
    amazon_side_asn   = optional(string)
    availability_zone = optional(string)
    tags              = optional(map(string))
    vpc_id            = optional(string)

    route_propagations = optional(list(object({
      name           = string
      route_table_id = string
    })), [])
  })
}

variable "vpn_connections" {
  description = "List of VPN Connections to create and associate to this VPN Gateway. See top-level module for options"
  type        = any
  default     = []
}
