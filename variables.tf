variable "aws_region" {
  type        = string
  description = "AWS deployment region"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Deployment environment (e.g. dev, staging, prod)"
  default     = "prod"
}

variable "compliance_tool_api_url" {
  type        = string
  description = "Endpoint URL for the external corporate compliance tool"
  default     = "https://compliance-api.company.internal/v1/scan"
}