################################################################################
# VPC
################################################################################

output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(aws_vpc.vpc.id, null)
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = try(aws_vpc.vpc.arn, null)
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = try(aws_vpc.vpc.cidr_block, null)
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = try(aws_vpc.vpc.instance_tenancy, null)
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = try(aws_vpc.vpc.enable_dns_support, null)
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = try(aws_vpc.vpc.enable_dns_hostnames, null)
}

################################################################################
# Nat Gateway
################################################################################

output "nat_gw_id" {
  description = "Contains the Natgateway ID"
  value       = aws_nat_gateway.nat_gateway.id
}

output "association_id" {
  description = "The association ID of the Elastic IP address that's associated with the NAT Gateway"
  value       = aws_nat_gateway.nat_gateway.association_id
}

output "nat_public_ip" {
  description = "The Elastic IP address associated with the NAT Gateway."
  value       = aws_nat_gateway.nat_gateway.public_ip
}


################################################################################
# Elastic IP
################################################################################

output "eip_id" {
  description = "Contains the EIP allocation ID"
  value       = aws_eip.eip.id
}

output "eip_public_ip" {
  description = "Contains the public IP address"
  value       = aws_eip.eip.public_ip
}

output "eip_public_dns" {
  description = "Public DNS associated with the Elastic IP address"
  value       = aws_eip.eip.public_dns
}

################################################################################
# Internet Gateway
################################################################################

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = try(aws_internet_gateway.vpc_igw.id, null)
}

output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = try(aws_internet_gateway.vpc_igw.arn, null)
}

################################################################################
# Publiс Subnets
################################################################################

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = [for subnet in aws_subnet.vpc_public_subnet : subnet.id]
}
output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = [for subnet in aws_subnet.vpc_public_subnet : subnet.arn]
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = [for subnet in aws_subnet.vpc_public_subnet : subnet.cidr_block]
}

output "public_route_table_association_ids" {
  value = [for route in aws_route_table_association.vpc_route_association_public_subnet : route.id]
}
################################################################################
# Private Subnets
################################################################################

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = [for subnet in aws_subnet.vpc_private_subnet : subnet.id]
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = [for subnet in aws_subnet.vpc_private_subnet : subnet.arn]
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = [for subnet in aws_subnet.vpc_private_subnet : subnet.cidr_block]
}

output "private_route_table_association_ids" {
  description = "List of IDs of the private route table association"
  value       = [for route in aws_route_table_association.vpc_route_association_private_subnet : route.id]
}

