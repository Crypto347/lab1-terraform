output "current_ip" {
  value = data.external.current_ip.result.ip
}

################################################################################
# Public EC2
################################################################################

output "public_ec2_id" {
  description = "The ID of the instance"
  value = try(
    module.public-ec2.id,
    null
  )
}

output "public_ec2_arn" {
  description = "The ARN of the instance"
  value = try(
    module.public-ec2.arn,
    null
  )
}

output "public_ec2_instance_state" {
  description = "The state of the instance"
  value = try(
    module.public-ec2.instance_state,
    null
  )
}

output "public_ec2_public_ip" {
  description = "The public IP address assigned to the instance, if applicable."
  value = try(
    module.public-ec2.public_ip,
    null
  )
}

output "public_ec2_private_ip" {
  description = "The private IP address assigned to the instance"
  value = try(
    module.public-ec2.private_ip,
    null
  )
}

output "public_ec2_ami" {
  description = "AMI ID that was used to create the instance"
  value = try(
    module.public-ec2.ami,
    null
  )
}

output "public_ec2_availability_zone" {
  description = "The availability zone of the created instance"
  value = try(
    module.public-ec2.availability_zone,
    null
  )
}


################################################################################
# Private EC2
################################################################################

output "private_ec2_id" {
  description = "The ID of the instance"
  value = try(
    module.private-ec2.id,
    null
  )
}

output "private_ec2_arn" {
  description = "The ARN of the instance"
  value = try(
    module.private-ec2.arn,
    null
  )
}

output "private_ec2_instance_state" {
  description = "The state of the instance"
  value = try(
    module.private-ec2.instance_state,
    null
  )
}

output "private_ec2_private_ip" {
  description = "The private IP address assigned to the instance, if applicable."
  value = try(
    module.private-ec2.private_ip,
    null
  )
}
output "private_ec2_ami" {
  description = "AMI ID that was used to create the instance"
  value = try(
    module.private-ec2.ami,
    null
  )
}

output "private_ec2_availability_zone" {
  description = "The availability zone of the created instance"
  value = try(
    module.private-ec2.availability_zone,
    null
  )
}



################################################################################
# VPC
################################################################################

output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(module.staging_vpc.vpc_id, null)
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = try(module.staging_vpc.arn, null)
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = try(module.staging_vpc.cidr_block, null)
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = try(module.staging_vpc.instance_tenancy, null)
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = try(module.staging_vpc.enable_dns_support, null)
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = try(module.staging_vpc.enable_dns_hostnames, null)
}

################################################################################
# Nat Gateway
################################################################################

output "nat_gw_id" {
  description = "Contains the Natgateway ID"
  value       = module.staging_vpc.nat_gw_id
}

output "association_id" {
  description = "The association ID of the Elastic IP address that's associated with the NAT Gateway"
  value       = module.staging_vpc.association_id
}

output "nat_public_ip" {
  description = "The Elastic IP address associated with the NAT Gateway."
  value       = module.staging_vpc.nat_public_ip
}


################################################################################
# Elastic IP
################################################################################

output "id" {
  description = "Contains the EIP allocation ID"
  value       = module.staging_vpc.eip_id
}

output "public_ip" {
  description = "Contains the public IP address"
  value       = module.staging_vpc.eip_public_ip
}

output "public_dns" {
  description = "Public DNS associated with the Elastic IP address"
  value       = module.staging_vpc.eip_public_dns
}

################################################################################
# Internet Gateway
################################################################################

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = try(module.staging_vpc.igw_id, null)
}

output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = try(module.staging_vpc.igw_arn, null)
}

################################################################################
# Publiс Subnets
################################################################################

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       =  module.staging_vpc.public_subnets
}
output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = module.staging_vpc.public_subnet_arns
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.staging_vpc.public_subnets_cidr_blocks
}

output "public_route_table_association_ids" {
  value = module.staging_vpc.public_route_table_association_ids
}
################################################################################
# Private Subnets
################################################################################

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.staging_vpc.private_subnets
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.staging_vpc.private_subnet_arns
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.staging_vpc.private_subnets_cidr_blocks
}

output "private_route_table_association_ids" {
  description = "List of IDs of the private route table association"
  value       = module.staging_vpc.private_route_table_association_ids
}

################################################################################
# Public Security group
################################################################################

output "public_security_group_id" {
  description = "The ID of the security group"
  value       = module.public-security-group.security_group_id
}

output "public_security_group_name" {
  description = "The name of the security group"
  value       = module.public-security-group.security_group_name
}

output "public_security_group_ingress_rules" {
  description = "The ARN of the security group"
  value       = module.public-security-group.security_group_ingress_rules
}

################################################################################
# Private Security group
################################################################################

output "private_security_group_id" {
  description = "The ID of the security group"
  value       = module.private-security-group.security_group_id
}

output "private_security_group_name" {
  description = "The name of the security group"
  value       = module.private-security-group.security_group_name
}

output "private_security_group_ingress_rules" {
  description = "The ARN of the security group"
  value       = module.private-security-group.security_group_ingress_rules
}


################################################################################
# Keypair
################################################################################

output "private_key" {
  description = "the private key of keypai"
  value       = module.keypair.private_key
  sensitive   = true
}

output "key_name" {
  description = "set name for keypair"
  value       = module.keypair.key_name
}
