## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.vpc_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.vpc_route_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.vpc_route_table_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.vpc_route_table_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.vpc_route_association_private_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.vpc_route_association_public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.default_myvpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.vpc_private_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.vpc_public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_eip_vpc"></a> [allow\_eip\_vpc](#input\_allow\_eip\_vpc) | allow to create elastic ip for private ips of instances | `bool` | `true` | no |
| <a name="input_cidr_block_vpc"></a> [cidr\_block\_vpc](#input\_cidr\_block\_vpc) | (Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using `ipv4_netmask_length` & `ipv4_ipam_pool_id` | `string` | `"10.0.0.0/16"` | no |
| <a name="input_create_igw"></a> [create\_igw](#input\_create\_igw) | Controls if an Internet Gateway is created for public subnets and the related routes that connect them | `bool` | `true` | no |
| <a name="input_create_multiple_public_route_tables"></a> [create\_multiple\_public\_route\_tables](#input\_create\_multiple\_public\_route\_tables) | Indicates whether to create a separate route table for each public subnet. Default: `false` | `bool` | `false` | no |
| <a name="input_createdBy"></a> [createdBy](#input\_createdBy) | Specify this resource is created by | `string` | `""` | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | Should be true to enable DNS hostnames in the VPC | `bool` | `true` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | Should be true to enable DNS support in the VPC | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Specify a environment for creating vpc | `string` | `""` | no |
| <a name="input_instance_tenancy"></a> [instance\_tenancy](#input\_instance\_tenancy) | A tenancy option for instances launched into the VPC | `string` | `"default"` | no |
| <a name="input_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#input\_map\_public\_ip\_on\_launch) | Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is `false` | `bool` | `true` | no |
| <a name="input_map_public_ip_on_launch_private"></a> [map\_public\_ip\_on\_launch\_private](#input\_map\_public\_ip\_on\_launch\_private) | (Optional) Specify true to indicate that instances launched into the subnet should be assigned a public IP address | `bool` | `false` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | (Optional) Map of objects contining the definition for each private subnet | <pre>map(object({<br/>    availability_zone = string # Availability Zone for the subnet.<br/>    cidr_block        = string # The IPv4 CIDR block for the subnet.<br/>  }))</pre> | `{}` | no |
| <a name="input_private_subnets_enable_resource_name_dns_a_record_on_launch"></a> [private\_subnets\_enable\_resource\_name\_dns\_a\_record\_on\_launch](#input\_private\_subnets\_enable\_resource\_name\_dns\_a\_record\_on\_launch) | (Optional) Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false. | `bool` | `false` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | (Optional) Map of objects contining the definition for each public subnet | <pre>map(object({<br/>    availability_zone = string # Availability Zone for the subnet.<br/>    cidr_block        = string # The IPv4 CIDR block for the subnet.<br/>  }))</pre> | `{}` | no |
| <a name="input_single_nat"></a> [single\_nat](#input\_single\_nat) | Use single NAT Gateway | `bool` | `false` | no |
| <a name="input_use_ipam_pool"></a> [use\_ipam\_pool](#input\_use\_ipam\_pool) | Determines whether IPAM pool is used for CIDR allocation | `bool` | `false` | no |
| <a name="input_vpc_security_group_name"></a> [vpc\_security\_group\_name](#input\_vpc\_security\_group\_name) | Creates name for security group | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_association_id"></a> [association\_id](#output\_association\_id) | The association ID of the Elastic IP address that's associated with the NAT Gateway |
| <a name="output_eip_id"></a> [eip\_id](#output\_eip\_id) | Contains the EIP allocation ID |
| <a name="output_eip_public_dns"></a> [eip\_public\_dns](#output\_eip\_public\_dns) | Public DNS associated with the Elastic IP address |
| <a name="output_eip_public_ip"></a> [eip\_public\_ip](#output\_eip\_public\_ip) | Contains the public IP address |
| <a name="output_igw_arn"></a> [igw\_arn](#output\_igw\_arn) | The ARN of the Internet Gateway |
| <a name="output_igw_id"></a> [igw\_id](#output\_igw\_id) | The ID of the Internet Gateway |
| <a name="output_nat_gw_id"></a> [nat\_gw\_id](#output\_nat\_gw\_id) | Contains the Natgateway ID |
| <a name="output_nat_public_ip"></a> [nat\_public\_ip](#output\_nat\_public\_ip) | The Elastic IP address associated with the NAT Gateway. |
| <a name="output_private_route_table_association_ids"></a> [private\_route\_table\_association\_ids](#output\_private\_route\_table\_association\_ids) | List of IDs of the private route table association |
| <a name="output_private_subnet_arns"></a> [private\_subnet\_arns](#output\_private\_subnet\_arns) | List of ARNs of private subnets |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_private_subnets_cidr_blocks"></a> [private\_subnets\_cidr\_blocks](#output\_private\_subnets\_cidr\_blocks) | List of cidr\_blocks of private subnets |
| <a name="output_public_route_table_association_ids"></a> [public\_route\_table\_association\_ids](#output\_public\_route\_table\_association\_ids) | n/a |
| <a name="output_public_subnet_arns"></a> [public\_subnet\_arns](#output\_public\_subnet\_arns) | List of ARNs of public subnets |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | List of IDs of public subnets |
| <a name="output_public_subnets_cidr_blocks"></a> [public\_subnets\_cidr\_blocks](#output\_public\_subnets\_cidr\_blocks) | List of cidr\_blocks of public subnets |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_enable_dns_hostnames"></a> [vpc\_enable\_dns\_hostnames](#output\_vpc\_enable\_dns\_hostnames) | Whether or not the VPC has DNS hostname support |
| <a name="output_vpc_enable_dns_support"></a> [vpc\_enable\_dns\_support](#output\_vpc\_enable\_dns\_support) | Whether or not the VPC has DNS support |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
| <a name="output_vpc_instance_tenancy"></a> [vpc\_instance\_tenancy](#output\_vpc\_instance\_tenancy) | Tenancy of instances spin up within VPC |
