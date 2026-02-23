param(
  [string]$AssignmentsPath = ".github/prompts/workflows/assignments.current.md",
  [string]$WorkerTemplatePath = ".github/prompts/templates/worker-parallel.template.md",
  [string]$RuntimeDir = ".github/prompts/workflows/runtime",
  [string]$CodexCommand = "codex",
  [switch]$AutoPrompt,
  [string]$PromptArgName = "",
  [switch]$NoLaunch
)

$ErrorActionPreference = "Stop"

function Parse-Assignments {
  param([string]$Path)

  if (-not (Test-Path $Path)) {
    throw "Assignment snapshot not found: $Path"
  }

  $lines = Get-Content -Path $Path
  $result = @()
  $current = $null

  foreach ($raw in $lines) {
    $line = $raw.Trim()

    if ($line -match "^- Worker\s+([^\s]+)\s+\(([^\)]+)\)$") {
      if ($null -ne $current) { $result += [pscustomobject]$current }
      $current = [ordered]@{
        worker_id = $matches[1]
        branch = $matches[2]
        task_id = ""
        task_title = ""
        commit = ""
        validate = ""
        card = ""
      }
      continue
    }

    if ($null -eq $current) { continue }

    if ($line -match "^- Task:\s+([^\s]+)\s+—\s+(.+)$") {
      $current.task_id = $matches[1]
      $current.task_title = $matches[2]
      continue
    }

    if ($line.StartsWith("- Commit:")) {
      $current.commit = $line.Substring(9).Trim()
      continue
    }

    if ($line.StartsWith("- Validate:")) {
      $current.validate = $line.Substring(11).Trim()
      continue
    }

    if ($line.StartsWith("- Card:")) {
      $current.card = $line.Substring(7).Trim()
      continue
    }
  }

  if ($null -ne $current) {
    $result += [pscustomobject]$current
  }

  return $result
}

function Get-WorktreeByBranch {
  $output = git worktree list --porcelain
  $map = @{}

  $currentPath = ""
  foreach ($line in $output) {
    if ($line.StartsWith("worktree ")) {
      $currentPath = $line.Substring(9).Trim()
      continue
    }

    if ($line.StartsWith("branch refs/heads/")) {
      $branch = $line.Substring("branch refs/heads/".Length).Trim()
      $map[$branch] = $currentPath
    }
  }

  return $map
}

if (-not (Get-Command $CodexCommand -ErrorAction SilentlyContinue)) {
  throw "Codex command not found: $CodexCommand"
}

$assignments = Parse-Assignments -Path $AssignmentsPath
if ($assignments.Count -eq 0) {
  throw "No worker assignments found in: $AssignmentsPath"
}

$worktreeMap = Get-WorktreeByBranch

if (-not (Test-Path $RuntimeDir)) {
  New-Item -Path $RuntimeDir -ItemType Directory | Out-Null
}

$workerTemplate = ""
if (Test-Path $WorkerTemplatePath) {
  $workerTemplate = Get-Content -Raw -Path $WorkerTemplatePath
}

foreach ($a in $assignments) {
  if (-not $worktreeMap.ContainsKey($a.branch)) {
    Write-Warning ("No worktree found for branch {0}; skipping worker {1}" -f $a.branch, $a.worker_id)
    continue
  }

  $worktree = $worktreeMap[$a.branch]
  $cardPath = $a.card.Replace("/", "\\")
  if (-not [System.IO.Path]::IsPathRooted($cardPath)) {
    $cardPath = Join-Path (Get-Location).Path $cardPath
  }

  if (-not (Test-Path $cardPath)) {
    Write-Warning ("Task card not found: {0}" -f $cardPath)
    continue
  }

  $cardContent = Get-Content -Raw -Path $cardPath

  $promptFile = Join-Path $RuntimeDir ("worker-{0}-{1}.prompt.md" -f $a.worker_id.ToLower(), $a.task_id.ToLower())

  $promptText = @(
    "# Worker Launch Prompt"
    ""
    ("Worker ID: {0}" -f $a.worker_id)
    ("Branch: {0}" -f $a.branch)
    ("Task ID: {0}" -f $a.task_id)
    ("Task Title: {0}" -f $a.task_title)
    ("Commit: {0}" -f $a.commit)
    ("Validate: {0}" -f $a.validate)
    ""
    "## Worker Template"
    $workerTemplate
    ""
    "## Task Card"
    '```yaml'
    $cardContent
    '```'
  ) -join "`r`n"

  Set-Content -Path $promptFile -Value $promptText -Encoding utf8

  $worktreeEscaped = $worktree.Replace("'", "''")
  $promptEscaped = $promptFile.Replace("'", "''")

  if ($NoLaunch) {
    Write-Host ("Prepared worker {0} prompt: {1}" -f $a.worker_id, $promptFile)
    continue
  }

  if ($AutoPrompt -and -not [string]::IsNullOrWhiteSpace($PromptArgName)) {
    $cmd = "Set-Location '$worktreeEscaped'; & $CodexCommand $PromptArgName '$promptEscaped'"
  } else {
    $cmd = "Set-Location '$worktreeEscaped'; Write-Host 'Use prompt file: $promptEscaped'; & $CodexCommand"
  }

  Start-Process powershell -ArgumentList "-NoExit", "-Command", $cmd | Out-Null
  Write-Host ("Launched worker {0} in {1}" -f $a.worker_id, $worktree)
}
