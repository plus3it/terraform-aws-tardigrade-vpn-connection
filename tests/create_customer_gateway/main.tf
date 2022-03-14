resource "random_string" "this" {
  length  = 6
  upper   = false
  special = false
  number  = false
}

module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc?ref=v3.13.0"

  name = "tardigrade-vpn-connection-${random_string.this.result}"
  cidr = "10.0.0.0/16"
}

module "example" {
  source = "../../"

  name             = "tardigrade-vpc-connection-${random_string.this.result}"
  vpc_id           = module.vpc.vpc_id
  cgw_ip_addresses = ["19.1.1.1", "19.1.1.2"]
  cgw_bgp_asn      = "64511"
}
