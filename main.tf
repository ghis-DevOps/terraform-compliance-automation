terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment        = var.environment
      ManagedBy          = "Terraform"
      ComplianceVerified = "True"
    }
  }
}

# Module 1: Cloud Native Compliance Guardrails
module "compliance_guardrails" {
  source      = "./modules/script_exec/compliance_guardrails"
  environment = var.environment
}

# Module 2: Python & Shell Automation Orchestrations
module "script_exec" {
  source                  = "./modules/script_exec"
  compliance_tool_api_url = var.compliance_tool_api_url
  environment             = var.environment
  depends_on              = [module.compliance_guardrails]
}