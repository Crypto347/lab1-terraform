module "staging_vpc" {
  source = "../../modules/networking"

  cidr_block_vpc       = "192.168.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnets = {
    first_public_subnet = {
      availability_zone = "us-east-1a"
      cidr_block        = "192.168.10.0/24"
    }
    second_public_subnet = {
      availability_zone = "us-east-1b"
      cidr_block        = "192.168.20.0/24"
    }
  }
  map_public_ip_on_launch = true
  map_public_ip_on_launch_private = false

  private_subnets = {
    first_private_subnet = {
      availability_zone = "us-east-1a"
      cidr_block        = "192.168.90.0/24"
    }
    second_private_subnet = {
      availability_zone = "us-east-1b"
      cidr_block        = "192.168.100.0/24"
    }
  }

  createdBy     = "Terraform"
  allow_eip_vpc = true


  single_nat = false

  environment      = "Staging"
  instance_tenancy = "default"
  use_ipam_pool    = false
  create_igw       = true
}
