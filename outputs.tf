output "config_rule_s3_encryption_arn" {
  description = "ARN of the S3 bucket server-side encryption compliance rule."
  value       = module.compliance_guardrails.s3_encryption_rule_arn
}

output "config_rule_required_tags_arn" {
  description = "ARN of the required tags enforcement rule."
  value       = module.compliance_guardrails.required_tags_rule_arn
}

output "compliance_sync_status" {
  description = "Confirmation status that Python telemetry was triggered."
  value       = module.script_exec.python_sync_execution_id
}