output "id" {
  description = "The ID of the instance"
  value = try(
    aws_instance.myec2.id,
    null
  )
}

output "arn" {
  description = "The ARN of the instance"
  value = try(
    aws_instance.myec2.arn,
    null
  )
}

output "instance_state" {
  description = "The state of the instance"
  value = try(
    aws_instance.myec2.instance_state,
    null
  )
}

output "public_ip" {
  description = "The public IP address assigned to the instance, if applicable."
  value = try(
    aws_instance.myec2.public_ip,
    null
  )
}


output "private_ip" {
  description = "The private IP address assigned to the instance"
  value = try(
    aws_instance.myec2.private_ip,
    null
  )
}

output "ami" {
  description = "AMI ID that was used to create the instance"
  value = try(
    aws_instance.myec2.ami,
    null
  )
}

output "availability_zone" {
  description = "The availability zone of the created instance"
  value = try(
    aws_instance.myec2.availability_zone,
    null
  )
}
