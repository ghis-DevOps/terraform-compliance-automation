output "s3_encryption_rule_arn" {
  description = "ARN of the deployed AWS Config S3 encryption rule."
  value       = aws_config_config_rule.s3_bucket_server_side_encryption_enabled.arn
}

output "required_tags_rule_arn" {
  description = "ARN of the deployed AWS Config required tags rule."
  value       = aws_config_config_rule.required_tags_check.arn
}