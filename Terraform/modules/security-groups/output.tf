output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.security_group.id
}

output "security_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.security_group.name
}

output "security_group_ingress_rules" {
  description = "The ARN of the security group"
  value       = aws_security_group.security_group.arn
}