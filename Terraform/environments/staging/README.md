## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>5.43 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_external"></a> [external](#provider\_external) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_keypair"></a> [keypair](#module\_keypair) | ../../modules/keypair | n/a |
| <a name="module_private-ec2"></a> [private-ec2](#module\_private-ec2) | ../../modules/ec2 | n/a |
| <a name="module_private-security-group"></a> [private-security-group](#module\_private-security-group) | ../../modules/security-groups | n/a |
| <a name="module_public-ec2"></a> [public-ec2](#module\_public-ec2) | ../../modules/ec2 | n/a |
| <a name="module_public-security-group"></a> [public-security-group](#module\_public-security-group) | ../../modules/security-groups | n/a |
| <a name="module_staging_vpc"></a> [staging\_vpc](#module\_staging\_vpc) | ../../modules/networking | n/a |

## Resources

| Name | Type |
|------|------|
| [external_external.current_ip](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Region in which aws resources to be created | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_association_id"></a> [association\_id](#output\_association\_id) | The association ID of the Elastic IP address that's associated with the NAT Gateway |
| <a name="output_current_ip"></a> [current\_ip](#output\_current\_ip) | n/a |
| <a name="output_id"></a> [id](#output\_id) | Contains the EIP allocation ID |
| <a name="output_igw_arn"></a> [igw\_arn](#output\_igw\_arn) | The ARN of the Internet Gateway |
| <a name="output_igw_id"></a> [igw\_id](#output\_igw\_id) | The ID of the Internet Gateway |
| <a name="output_key_name"></a> [key\_name](#output\_key\_name) | set name for keypair |
| <a name="output_nat_gw_id"></a> [nat\_gw\_id](#output\_nat\_gw\_id) | Contains the Natgateway ID |
| <a name="output_nat_public_ip"></a> [nat\_public\_ip](#output\_nat\_public\_ip) | The Elastic IP address associated with the NAT Gateway. |
| <a name="output_private_ec2_ami"></a> [private\_ec2\_ami](#output\_private\_ec2\_ami) | AMI ID that was used to create the instance |
| <a name="output_private_ec2_arn"></a> [private\_ec2\_arn](#output\_private\_ec2\_arn) | The ARN of the instance |
| <a name="output_private_ec2_availability_zone"></a> [private\_ec2\_availability\_zone](#output\_private\_ec2\_availability\_zone) | The availability zone of the created instance |
| <a name="output_private_ec2_id"></a> [private\_ec2\_id](#output\_private\_ec2\_id) | The ID of the instance |
| <a name="output_private_ec2_instance_state"></a> [private\_ec2\_instance\_state](#output\_private\_ec2\_instance\_state) | The state of the instance |
| <a name="output_private_ec2_private_ip"></a> [private\_ec2\_private\_ip](#output\_private\_ec2\_private\_ip) | The private IP address assigned to the instance, if applicable. |
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | the private key of keypai |
| <a name="output_private_route_table_association_ids"></a> [private\_route\_table\_association\_ids](#output\_private\_route\_table\_association\_ids) | List of IDs of the private route table association |
| <a name="output_private_security_group_id"></a> [private\_security\_group\_id](#output\_private\_security\_group\_id) | The ID of the security group |
| <a name="output_private_security_group_ingress_rules"></a> [private\_security\_group\_ingress\_rules](#output\_private\_security\_group\_ingress\_rules) | The ARN of the security group |
| <a name="output_private_security_group_name"></a> [private\_security\_group\_name](#output\_private\_security\_group\_name) | The name of the security group |
| <a name="output_private_subnet_arns"></a> [private\_subnet\_arns](#output\_private\_subnet\_arns) | List of ARNs of private subnets |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_private_subnets_cidr_blocks"></a> [private\_subnets\_cidr\_blocks](#output\_private\_subnets\_cidr\_blocks) | List of cidr\_blocks of private subnets |
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | Public DNS associated with the Elastic IP address |
| <a name="output_public_ec2_ami"></a> [public\_ec2\_ami](#output\_public\_ec2\_ami) | AMI ID that was used to create the instance |
| <a name="output_public_ec2_arn"></a> [public\_ec2\_arn](#output\_public\_ec2\_arn) | The ARN of the instance |
| <a name="output_public_ec2_availability_zone"></a> [public\_ec2\_availability\_zone](#output\_public\_ec2\_availability\_zone) | The availability zone of the created instance |
| <a name="output_public_ec2_id"></a> [public\_ec2\_id](#output\_public\_ec2\_id) | The ID of the instance |
| <a name="output_public_ec2_instance_state"></a> [public\_ec2\_instance\_state](#output\_public\_ec2\_instance\_state) | The state of the instance |
| <a name="output_public_ec2_private_ip"></a> [public\_ec2\_private\_ip](#output\_public\_ec2\_private\_ip) | The private IP address assigned to the instance |
| <a name="output_public_ec2_public_ip"></a> [public\_ec2\_public\_ip](#output\_public\_ec2\_public\_ip) | The public IP address assigned to the instance, if applicable. |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Contains the public IP address |
| <a name="output_public_route_table_association_ids"></a> [public\_route\_table\_association\_ids](#output\_public\_route\_table\_association\_ids) | n/a |
| <a name="output_public_security_group_id"></a> [public\_security\_group\_id](#output\_public\_security\_group\_id) | The ID of the security group |
| <a name="output_public_security_group_ingress_rules"></a> [public\_security\_group\_ingress\_rules](#output\_public\_security\_group\_ingress\_rules) | The ARN of the security group |
| <a name="output_public_security_group_name"></a> [public\_security\_group\_name](#output\_public\_security\_group\_name) | The name of the security group |
| <a name="output_public_subnet_arns"></a> [public\_subnet\_arns](#output\_public\_subnet\_arns) | List of ARNs of public subnets |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | List of IDs of public subnets |
| <a name="output_public_subnets_cidr_blocks"></a> [public\_subnets\_cidr\_blocks](#output\_public\_subnets\_cidr\_blocks) | List of cidr\_blocks of public subnets |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_enable_dns_hostnames"></a> [vpc\_enable\_dns\_hostnames](#output\_vpc\_enable\_dns\_hostnames) | Whether or not the VPC has DNS hostname support |
| <a name="output_vpc_enable_dns_support"></a> [vpc\_enable\_dns\_support](#output\_vpc\_enable\_dns\_support) | Whether or not the VPC has DNS support |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
| <a name="output_vpc_instance_tenancy"></a> [vpc\_instance\_tenancy](#output\_vpc\_instance\_tenancy) | Tenancy of instances spin up within VPC |
