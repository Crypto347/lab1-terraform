variable "environment" {
  description = "Specify a environment for creating vpc"
  type        = string
  default     = ""
}

variable "createdBy" {
  description = "Specify this resource is created by"
  type        = string
  default     = ""
}


################################################################################
# NAT
################################################################################
variable "allow_eip_vpc" {
  type        = bool
  description = "allow to create elastic ip for private ips of instances"
  default     = true
}

variable "single_nat" {
  type        = bool
  description = "Use single NAT Gateway"
  default     = false
}



################################################################################
# VPC Subnets
################################################################################

variable "cidr_block_vpc" {
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using `ipv4_netmask_length` & `ipv4_ipam_pool_id`"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "use_ipam_pool" {
  description = "Determines whether IPAM pool is used for CIDR allocation"
  type        = bool
  default     = false
}


################################################################################
# Internet Gateway
################################################################################


variable "create_igw" {
  description = "Controls if an Internet Gateway is created for public subnets and the related routes that connect them"
  type        = bool
  default     = true
}

################################################################################
# Security Group
################################################################################


variable "vpc_security_group_name" {
  description = "Creates name for security group"
  type        = string
  default     = ""
}

################################################################################
# Publiс Subnets
################################################################################

variable "public_subnets" {
  type = map(object({
    availability_zone = string # Availability Zone for the subnet.
    cidr_block        = string # The IPv4 CIDR block for the subnet.
  }))
  description = "(Optional) Map of objects contining the definition for each public subnet"
  default     = {}
}

variable "create_multiple_public_route_tables" {
  description = "Indicates whether to create a separate route table for each public subnet. Default: `false`"
  type        = bool
  default     = false
}

variable "map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is `false`"
  type        = bool
  default     = true
}

################################################################################
# Internet Gateway
################################################################################

variable "private_subnets" {
  type = map(object({
    availability_zone = string # Availability Zone for the subnet.
    cidr_block        = string # The IPv4 CIDR block for the subnet.
  }))
  description = "(Optional) Map of objects contining the definition for each private subnet"
  default     = {}
}

variable "private_subnets_enable_resource_name_dns_a_record_on_launch" {
  type        = bool
  description = "(Optional) Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false."
  default     = false
}

variable "map_public_ip_on_launch_private" {
  type        = bool
  description = "(Optional) Specify true to indicate that instances launched into the subnet should be assigned a public IP address"
  default     = false
}