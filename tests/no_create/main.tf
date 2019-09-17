provider aws {
  region = "us-east-1"
}


module "example" {
  source = "../../"
  providers = {
    aws = aws
  }

  create_vpn_connection = false
}
