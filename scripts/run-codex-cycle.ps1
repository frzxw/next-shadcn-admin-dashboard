param(
  [string]$BoardPath = ".github/prompts/workflows/task-board.example.yaml",
  [string]$CompletedPath = ".github/prompts/workflows/completed-tasks.txt",
  [string]$AssignmentsPath = ".github/prompts/workflows/assignments.current.md",
  [string]$WorkerTemplatePath = ".github/prompts/templates/worker-parallel.template.md",
  [string]$CodexCommand = "codex",
  [switch]$NoLaunch,
  [switch]$AutoPrompt,
  [string]$PromptArgName = ""
)

$ErrorActionPreference = "Stop"

$repoRoot = (Get-Location).Path
$assignScript = Join-Path $repoRoot "scripts/assign-codex-tasks.ps1"
$launchScript = Join-Path $repoRoot "scripts/start-codex-workers.ps1"

if (-not (Test-Path $assignScript)) {
  throw "Missing script: $assignScript"
}

if (-not (Test-Path $launchScript)) {
  throw "Missing script: $launchScript"
}

Write-Host "[1/2] Generating assignments..."
powershell -ExecutionPolicy Bypass -File $assignScript `
  -BoardPath $BoardPath `
  -CompletedPath $CompletedPath `
  -OutputPath $AssignmentsPath

Write-Host "[2/2] Starting workers..."

$launchArgs = @(
  "-ExecutionPolicy", "Bypass",
  "-File", $launchScript,
  "-AssignmentsPath", $AssignmentsPath,
  "-WorkerTemplatePath", $WorkerTemplatePath,
  "-CodexCommand", $CodexCommand
)

if ($NoLaunch) { $launchArgs += "-NoLaunch" }
if ($AutoPrompt) { $launchArgs += "-AutoPrompt" }
if (-not [string]::IsNullOrWhiteSpace($PromptArgName)) {
  $launchArgs += "-PromptArgName"
  $launchArgs += $PromptArgName
}

& powershell @launchArgs

Write-Host "Cycle complete."
