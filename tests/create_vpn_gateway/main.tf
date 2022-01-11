resource "random_string" "this" {
  length  = 6
  upper   = false
  special = false
  number  = false
}

module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc?ref=v3.11.1"

  name = "tardigrade-vpn-connection-${random_string.this.result}"
  cidr = "10.0.0.0/16"
}

module "example" {
  source = "../../"

  name   = "tardigrade-vpn-connection-${random_string.this.result}"
  vpc_id = module.vpc.vpc_id
}
