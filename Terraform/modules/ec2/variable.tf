variable "ami_id" {
  default = "ami-0f2eac25772cd4e36"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = null
}


variable "associate_public_ip" {
  description = "(Optional) Whether to associate a public IP address with an instance in a VPC."
  type        = bool
  default     = false
}


variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
  default     = null
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}


variable "ec2_name" {
  description = "Specify a name for creating ec2"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Specify a environment for creating ec2"
  type        = string
  default     = ""
}

variable "createdBy" {
  description = "Specify this resource is created by"
  type        = string
  default     = ""
}

