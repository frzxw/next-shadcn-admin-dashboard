param(
  [Parameter(Mandatory = $true)]
  [string]$IntegrationBranch,

  [int]$AgentCount = 2,
  [string]$BaseBranch = "main",
  [string]$AgentPrefix = "agent",
  [string]$OutputRoot = ".."
)

$ErrorActionPreference = "Stop"

if ($AgentCount -lt 1) {
  throw "AgentCount must be >= 1"
}

Write-Host "Fetching latest refs..."
git fetch origin

Write-Host "Ensuring integration branch exists: $IntegrationBranch"
$existingIntegration = git branch --list $IntegrationBranch
if ([string]::IsNullOrWhiteSpace($existingIntegration)) {
  git switch $BaseBranch
  git pull --ff-only origin $BaseBranch
  git switch -c $IntegrationBranch
} else {
  git switch $IntegrationBranch
}

for ($i = 1; $i -le $AgentCount; $i++) {
  $workerLetter = [char](96 + $i)
  $workerBranch = "$AgentPrefix/$workerLetter"
  $worktreePath = Join-Path $OutputRoot ("motiva-{0}" -f $workerBranch.Replace("/", "-"))

  $existingWorker = git branch --list $workerBranch
  if ([string]::IsNullOrWhiteSpace($existingWorker)) {
    Write-Host "Creating worktree + branch: $workerBranch -> $worktreePath"
    git worktree add $worktreePath -b $workerBranch $IntegrationBranch
  } else {
    Write-Host "Worker branch exists, adding worktree: $workerBranch -> $worktreePath"
    git worktree add $worktreePath $workerBranch
  }
}

Write-Host ""
Write-Host "Setup complete."
Write-Host "Integration branch: $IntegrationBranch"
Write-Host "Workers: $AgentCount"
