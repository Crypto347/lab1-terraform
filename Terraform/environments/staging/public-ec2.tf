data "external" "current_ip" {
  program = ["bash", "-c", "curl -s 'https://api.ipify.org?format=json'"]
}

module "public-security-group" {
  source  = "../../modules/security-groups"
  sg_name = "public-sg"
  vpc_id  = module.staging_vpc.vpc_id
  ingress_rules = [
    {
      description = "description"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["${data.external.current_ip.result.ip}/32"]
    }
  ]

  environment = "Staging"
  createdBy   = "Terraform"
}

module "public-ec2" {
  source                 = "../../modules/ec2"
  instance_type          = "t3.nano"
  monitoring             = true
  key_name               = module.keypair.key_name
  subnet_id              = module.staging_vpc.public_subnets[0]
  vpc_security_group_ids = [module.public-security-group.security_group_id]
  associate_public_ip    = true
  environment            = "Staging"
  createdBy              = "Terraform"
}
