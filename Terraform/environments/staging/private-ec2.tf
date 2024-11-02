module "private-security-group" {
  source  = "../../modules/security-groups"
  sg_name = "private-sg"
  vpc_id  = module.staging_vpc.vpc_id
  ingress_rules = [
    {
      description = "description"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [element(module.staging_vpc.public_subnets_cidr_blocks, 0)]
    }
  ]
  environment = "Staging"
  createdBy   = "Terraform"
}

module "private-ec2" {
  source                 = "../../modules/ec2"
  instance_type          = "t3.nano"
  monitoring             = true
  key_name               = module.keypair.key_name
  subnet_id              = module.staging_vpc.private_subnets[0]
  vpc_security_group_ids = [module.private-security-group.security_group_id]
  associate_public_ip    = false
  environment            = "Staging"
  createdBy              = "Terraform"
}
