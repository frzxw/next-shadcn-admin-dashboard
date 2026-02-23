param(
  [string]$BoardPath = ".github/prompts/workflows/task-board.example.yaml",
  [switch]$Push,
  [switch]$WhatIf
)

$ErrorActionPreference = "Stop"

function Parse-Board {
  param([string]$Path)

  if (-not (Test-Path $Path)) {
    throw "Board file not found: $Path"
  }

  $lines = Get-Content -Path $Path
  $integration = ""
  $workers = @()
  $inWorkers = $false
  $current = $null

  foreach ($raw in $lines) {
    $line = $raw.Trim()

    if ($line.StartsWith("integration_branch:")) {
      $integration = $line.Substring("integration_branch:".Length).Trim().Trim('"')
      continue
    }

    if ($line -eq "workers:") {
      $inWorkers = $true
      continue
    }

    if ($inWorkers -and $line -eq "tasks:") {
      if ($null -ne $current) {
        $workers += [pscustomobject]$current
      }
      break
    }

    if (-not $inWorkers) { continue }

    if ($line.StartsWith("- id:")) {
      if ($null -ne $current) {
        $workers += [pscustomobject]$current
      }

      $current = [ordered]@{
        id = $line.Substring(5).Trim().Trim('"')
        branch = ""
      }
      continue
    }

    if ($null -eq $current) { continue }

    if ($line.StartsWith("branch:")) {
      $current.branch = $line.Substring(7).Trim().Trim('"')
      continue
    }
  }

  if ($null -ne $current -and ($workers | Where-Object { $_.id -eq $current.id }).Count -eq 0) {
    $workers += [pscustomobject]$current
  }

  if ([string]::IsNullOrWhiteSpace($integration)) {
    throw "integration_branch not found in board file: $Path"
  }

  $workers = @($workers | Where-Object { -not [string]::IsNullOrWhiteSpace($_.branch) })
  if ($workers.Count -eq 0) {
    throw "No workers with branch values found in board file: $Path"
  }

  return [pscustomobject]@{
    integration_branch = $integration
    workers = $workers
  }
}

function Get-WorktreeMap {
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

$board = Parse-Board -Path $BoardPath
$integration = $board.integration_branch
$workers = $board.workers

$status = (git status --porcelain)
if (-not $WhatIf -and -not [string]::IsNullOrWhiteSpace($status)) {
  throw "Working tree is not clean. Commit or stash changes before running merge-codex-workers.ps1"
}

$existingIntegration = git branch --list $integration
if ([string]::IsNullOrWhiteSpace($existingIntegration)) {
  throw "Integration branch not found: $integration"
}

$worktreeMap = Get-WorktreeMap

Write-Host ("Switching to integration branch: {0}" -f $integration)
if (-not $WhatIf) {
  git switch $integration | Out-Null
}

$summary = New-Object System.Collections.Generic.List[string]

foreach ($worker in $workers) {
  $workerBranch = $worker.branch
  $workerId = $worker.id

  $existingWorker = git branch --list $workerBranch
  if ([string]::IsNullOrWhiteSpace($existingWorker)) {
    $summary.Add(("SKIP {0} ({1}) - branch missing" -f $workerId, $workerBranch))
    continue
  }

  if (-not $worktreeMap.ContainsKey($workerBranch)) {
    $summary.Add(("SKIP {0} ({1}) - no worktree" -f $workerId, $workerBranch))
    continue
  }

  $workerWorktree = $worktreeMap[$workerBranch]

  Write-Host ("Rebasing worker {0} ({1}) onto {2}" -f $workerId, $workerBranch, $integration)
  if (-not $WhatIf) {
    try {
      git -C $workerWorktree switch $workerBranch | Out-Null
      git -C $workerWorktree rebase $integration | Out-Null
    } catch {
      $summary.Add(("FAIL {0} ({1}) - rebase conflict/error" -f $workerId, $workerBranch))
      continue
    }
  }

  Write-Host ("Merging {0} into {1} with --ff-only" -f $workerBranch, $integration)
  if ($WhatIf) {
    $summary.Add(("PLAN {0} ({1}) - rebase + ff-merge" -f $workerId, $workerBranch))
    continue
  }

  try {
    git merge --ff-only $workerBranch | Out-Null
    $summary.Add(("OK   {0} ({1}) - merged" -f $workerId, $workerBranch))
  } catch {
    $summary.Add(("FAIL {0} ({1}) - ff-merge failed" -f $workerId, $workerBranch))
    continue
  }
}

if ($Push -and -not $WhatIf) {
  Write-Host ("Pushing integration branch: {0}" -f $integration)
  git push origin $integration | Out-Null
}

Write-Host ""
Write-Host "Merge summary:"
foreach ($line in $summary) {
  Write-Host $line
}
