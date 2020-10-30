provider aws {
  region = "us-east-1"
}

resource "random_string" "this" {
  length  = 6
  upper   = false
  special = false
  number  = false
}

module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc?ref=v2.15.0"

  providers = {
    aws = aws
  }

  name = "tardigrade-vpn-connection-${random_string.this.result}"
  cidr = "10.0.0.0/16"
}

module "example" {
  source = "../../"
  providers = {
    aws = aws
  }

  name             = "tardigrade-vpc-connection-${random_string.this.result}"
  vpc_id           = module.vpc.vpc_id
  cgw_ip_addresses = ["19.1.1.1", "19.1.1.2"]
  cgw_bgp_asn      = "64511"
}
