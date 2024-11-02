
variable "ingress_rules" {
  description = "List of security group ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    description = string
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 443
      to_port     = 443
      description = "Allow HTTPS traffic"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      description = "Allow HTTP traffic"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "sg_name" {
  description = "specify a name for security group"
}

variable "vpc_id" {
  description = "specify vpc id for security group"
  type = string
}


variable "environment" {
  description = "Specify a environment for creating sg"
  type        = string
  default     = ""
}

variable "createdBy" {
  description = "Specify this resource is created by"
  type        = string
  default     = ""
}
