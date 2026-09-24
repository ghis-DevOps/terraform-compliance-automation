output "python_sync_execution_id" {
  description = "Unique ID generated upon execution of the Python compliance sync provisioner."
  value       = null_resource.run_python_compliance_sync.id
}

output "shell_preflight_execution_id" {
  description = "Unique ID generated upon execution of the Shell pre-flight check provisioner."
  value       = null_resource.run_shell_preflight.id
}

