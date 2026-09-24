# Trigger external Python script to submit telemetry to compliance tool
resource "null_resource" "run_python_compliance_sync" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command     = "& python '${path.module}/../../scripts/compliance_check.py' --api-url '${var.compliance_tool_api_url}' --env '${var.environment}'"
    interpreter = ["PowerShell", "-NoProfile", "-NonInteractive", "-Command"]
  }
}

# Trigger PowerShell pre-flight validation on Windows
resource "null_resource" "run_shell_preflight" {
  provisioner "local-exec" {
    command     = "& '${path.module}/../../scripts/enforce_policy.ps1'"
    interpreter = ["PowerShell", "-NoProfile", "-NonInteractive", "-ExecutionPolicy", "Bypass", "-Command"]
  }
}