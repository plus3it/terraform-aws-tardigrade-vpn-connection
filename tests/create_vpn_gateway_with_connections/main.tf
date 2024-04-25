module "vpn_gateway" {
  source = "../../modules/vpn-gateway"

  vpn_gateway = {
    name   = "tardigrade-vpn-gateway-${local.id}"
    vpc_id = module.vpc.vpc_id
  }

  vpn_connections = [
    {
      name = "tardigrade-vpn-connection-1-${local.id}"
      customer_gateway = {
        name       = "tardigrade-customer-gateway-1-${local.id}"
        bgp_asn    = "64511"
        ip_address = "19.1.1.1"
      }
    },
    {
      name = "tardigrade-vpn-connection-2-${local.id}"
      customer_gateway = {
        name       = "tardigrade-customer-gateway-2-${local.id}"
        bgp_asn    = "64511"
        ip_address = "19.1.1.2"
      }
    }
  ]
}

module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc?ref=v5.8.0"

  name = "tardigrade-vpn-connection-${local.id}"
  cidr = "10.0.0.0/16"
}

locals {
  id = data.terraform_remote_state.prereq.outputs.test_id.result
}

data "terraform_remote_state" "prereq" {
  backend = "local"
  config = {
    path = "prereq/terraform.tfstate"
  }
}
