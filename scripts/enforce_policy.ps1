$ErrorActionPreference = "Stop"

Write-Output "=========================================="
Write-Output " Running Local Compliance Policy Checks   "
Write-Output "=========================================="

foreach ($tool in @("terraform", "python")) {
    $command = Get-Command $tool -ErrorAction SilentlyContinue
    if (-not $command) {
        Write-Error "Required CLI tool '$tool' is missing."
        exit 1
    }

    & $command.Source --version *> $null
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Required CLI tool '$tool' is not executable."
        exit 1
    }
}

Write-Output "[OK] Environment readiness check passed."