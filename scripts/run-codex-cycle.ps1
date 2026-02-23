param(
  [string]$BoardPath = ".github/prompts/workflows/task-board.example.yaml",
  [string]$CompletedPath = ".github/prompts/workflows/completed-tasks.txt",
  [string]$AssignmentsPath = ".github/prompts/workflows/assignments.current.md",
  [string]$WorkerTemplatePath = ".github/prompts/templates/worker-parallel.template.md",
  [string]$CodexCommand = "codex",
  [switch]$NoLaunch,
  [switch]$AutoPrompt,
  [string]$PromptArgName = "",
  [switch]$AutoMerge,
  [switch]$PushIntegration
)

$ErrorActionPreference = "Stop"

$repoRoot = (Get-Location).Path
$assignScript = Join-Path $repoRoot "scripts/assign-codex-tasks.ps1"
$launchScript = Join-Path $repoRoot "scripts/start-codex-workers.ps1"
$mergeScript = Join-Path $repoRoot "scripts/merge-codex-workers.ps1"

if (-not (Test-Path $assignScript)) {
  throw "Missing script: $assignScript"
}

if (-not (Test-Path $launchScript)) {
  throw "Missing script: $launchScript"
}

if ($AutoMerge -and -not (Test-Path $mergeScript)) {
  throw "Missing script: $mergeScript"
}

Write-Host "[1/2] Generating assignments..."
powershell -ExecutionPolicy Bypass -File $assignScript `
  -BoardPath $BoardPath `
  -CompletedPath $CompletedPath `
  -OutputPath $AssignmentsPath

if ($LASTEXITCODE -ne 0) {
  throw "Assignment step failed with exit code $LASTEXITCODE"
}

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

if ($LASTEXITCODE -ne 0) {
  throw "Worker launch step failed with exit code $LASTEXITCODE"
}

if ($AutoMerge) {
  Write-Host "[3/3] Merging completed worker branches..."

  $mergeArgs = @(
    "-ExecutionPolicy", "Bypass",
    "-File", $mergeScript,
    "-BoardPath", $BoardPath
  )

  if ($PushIntegration) {
    $mergeArgs += "-Push"
  }

  & powershell @mergeArgs

  if ($LASTEXITCODE -ne 0) {
    throw "Merge step failed with exit code $LASTEXITCODE"
  }
}

Write-Host "Cycle complete."
