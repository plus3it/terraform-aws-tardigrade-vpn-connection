module "vpn_gateway" {
  source = "../../modules/vpn-gateway"

  vpn_gateway = {
    name   = "tardigrade-vpn-connection-${random_string.this.result}"
    vpc_id = module.vpc.vpc_id
  }
}

module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc?ref=v5.19.0"

  name = "tardigrade-vpn-connection-${random_string.this.result}"
  cidr = "10.0.0.0/16"
}

resource "random_string" "this" {
  length  = 6
  upper   = false
  special = false
  numeric = false
}
