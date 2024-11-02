# Get latest AMI ID for Amazon Linux2 OS
data "aws_ami" "amzlinux2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip

  key_name             = var.key_name
  monitoring           = var.monitoring

  tags = merge(
    { "Name" = var.ec2_name },
    { "CreatedBy" = var.createdBy },
    { "Environment" = var.environment }
  )
}

