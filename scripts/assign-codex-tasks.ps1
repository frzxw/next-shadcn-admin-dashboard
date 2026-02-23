param(
  [string]$BoardPath = ".github/prompts/workflows/task-board.example.yaml",
  [string]$TasksRoot = ".github/prompts/tasks",
  [string]$CompletedPath = ".github/prompts/workflows/completed-tasks.txt",
  [string]$OutputPath = ".github/prompts/workflows/assignments.current.md"
)

$ErrorActionPreference = "Stop"

function Normalize-PathPrefix {
  param([string]$Path)

  if ([string]::IsNullOrWhiteSpace($Path)) {
    return ""
  }

  $normalized = $Path.Trim().Trim('"').Replace("\\", "/")

  if ($normalized.StartsWith("./")) {
    $normalized = $normalized.Substring(2)
  }

  while ($normalized.Contains("//")) {
    $normalized = $normalized.Replace("//", "/")
  }

  if (-not $normalized.EndsWith("/")) {
    $normalized = "$normalized/"
  }

  return $normalized
}

function Parse-ListBlock {
  param(
    [string[]]$Lines,
    [int]$StartIndex
  )

  $items = @()
  $i = $StartIndex + 1
  $startLine = $Lines[$StartIndex]
  $startIndent = ($startLine.Length - $startLine.TrimStart().Length)

  while ($i -lt $Lines.Count) {
    $line = $Lines[$i]
    if ([string]::IsNullOrWhiteSpace($line)) { break }

    $lineIndent = ($line.Length - $line.TrimStart().Length)
    if ($lineIndent -le $startIndent) { break }

    $trimmed = $line.Trim()
    if ($trimmed.StartsWith("- ")) {
      $items += $trimmed.Substring(2).Trim().Trim('"')
      $i++
      continue
    }

    $i++
  }

  return @($items)
}

function Parse-TaskCard {
  param([string]$Path)

  $lines = Get-Content -Path $Path

  $task = [ordered]@{
    id = ""
    title = ""
    type = ""
    scope = ""
    goal = ""
    depends_on = @()
    allowed_paths = @()
    validation = @()
    commit_subject = ""
    file = $Path
  }

  for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i].Trim()

    if ($line.StartsWith("id:")) { $task.id = $line.Substring(3).Trim().Trim('"'); continue }
    if ($line.StartsWith("title:")) { $task.title = $line.Substring(6).Trim().Trim('"'); continue }
    if ($line.StartsWith("type:")) { $task.type = $line.Substring(5).Trim().Trim('"'); continue }
    if ($line.StartsWith("scope:")) { $task.scope = $line.Substring(6).Trim().Trim('"'); continue }
    if ($line.StartsWith("goal:")) { $task.goal = $line.Substring(5).Trim().Trim('"'); continue }

    if ($line -eq "depends_on: []") { $task.depends_on = @(); continue }
    if ($line -eq "depends_on:") { $task.depends_on = [string[]](Parse-ListBlock -Lines $lines -StartIndex $i); continue }

    if ($line -eq "allowed_paths:") { $task.allowed_paths = [string[]](Parse-ListBlock -Lines $lines -StartIndex $i); continue }
    if ($line -eq "validation:") { $task.validation = [string[]](Parse-ListBlock -Lines $lines -StartIndex $i); continue }

    if ($line -eq "commit:") {
      for ($j = $i + 1; $j -lt $lines.Count; $j++) {
        $inner = $lines[$j].Trim()
        if ($inner.StartsWith("subject:")) {
          $task.commit_subject = $inner.Substring(8).Trim().Trim('"')
          break
        }
        if (-not $lines[$j].StartsWith("  ")) { break }
      }
      continue
    }
  }

  return [pscustomobject]$task
}

function Parse-Workers {
  param([string]$Path)

  $lines = Get-Content -Path $Path
  $workers = @()

  $inWorkers = $false
  $current = $null

  for ($i = 0; $i -lt $lines.Count; $i++) {
    $raw = $lines[$i]
    $line = $raw.Trim()

    if ($line -eq "workers:") {
      $inWorkers = $true
      continue
    }

    if ($inWorkers -and $line -eq "tasks:") {
      if ($null -ne $current) { $workers += [pscustomobject]$current }
      break
    }

    if (-not $inWorkers) { continue }

    if ($line.StartsWith("- id:")) {
      if ($null -ne $current) { $workers += [pscustomobject]$current }
      $current = [ordered]@{
        id = $line.Substring(5).Trim()
        branch = ""
        allowed_paths = @()
      }
      continue
    }

    if ($null -eq $current) { continue }

    if ($line.StartsWith("branch:")) {
      $current.branch = $line.Substring(7).Trim()
      continue
    }

    if ($line -eq "allowed_paths:") {
      $current.allowed_paths = Parse-ListBlock -Lines $lines -StartIndex $i
      continue
    }
  }

  if ($inWorkers -and $null -ne $current -and ($workers | Where-Object { $_.id -eq $current.id }).Count -eq 0) {
    $workers += [pscustomobject]$current
  }

  return $workers
}

function Parse-BoardTasks {
  param([string]$Path)

  $lines = Get-Content -Path $Path
  $tasks = @()

  $inTasks = $false
  $current = $null

  for ($i = 0; $i -lt $lines.Count; $i++) {
    $raw = $lines[$i]
    $line = $raw.Trim()

    if ($line -eq "tasks:") {
      $inTasks = $true
      continue
    }

    if (-not $inTasks) { continue }

    if ($line.StartsWith("- id:")) {
      if ($null -ne $current) { $tasks += [pscustomobject]$current }
      $current = [ordered]@{
        id = $line.Substring(5).Trim()
        title = ""
        type = ""
        scope = ""
        goal = ""
        depends_on = @()
        allowed_paths = @()
        validation = @()
        commit_subject = ""
      }
      continue
    }

    if ($null -eq $current) { continue }

    if ($line.StartsWith("title:")) { $current.title = $line.Substring(6).Trim().Trim('"'); continue }
    if ($line.StartsWith("type:")) { $current.type = $line.Substring(5).Trim().Trim('"'); continue }
    if ($line.StartsWith("scope:")) { $current.scope = $line.Substring(6).Trim().Trim('"'); continue }
    if ($line.StartsWith("goal:")) { $current.goal = $line.Substring(5).Trim().Trim('"'); continue }

    if ($line -eq "depends_on: []") { $current.depends_on = @(); continue }
    if ($line -eq "depends_on:") { $current.depends_on = [string[]](Parse-ListBlock -Lines $lines -StartIndex $i); continue }

    if ($line -eq "allowed_paths:") { $current.allowed_paths = [string[]](Parse-ListBlock -Lines $lines -StartIndex $i); continue }
    if ($line -eq "validation:") { $current.validation = [string[]](Parse-ListBlock -Lines $lines -StartIndex $i); continue }

    if ($line -eq "commit:") {
      for ($j = $i + 1; $j -lt $lines.Count; $j++) {
        $innerRaw = $lines[$j]
        $inner = $innerRaw.Trim()
        if ($inner.StartsWith("subject:")) {
          $current.commit_subject = $inner.Substring(8).Trim().Trim('"')
          break
        }
        if (-not $innerRaw.StartsWith("    ")) { break }
      }
      continue
    }
  }

  if ($null -ne $current) {
    $tasks += [pscustomobject]$current
  }

  return $tasks
}

function Path-IsOwned {
  param(
    [string[]]$TaskPaths,
    [string[]]$WorkerPaths
  )

  foreach ($tp in $TaskPaths) {
    $tpNorm = Normalize-PathPrefix -Path $tp
    if ([string]::IsNullOrWhiteSpace($tpNorm)) { continue }

    $owned = $false
    foreach ($wp in $WorkerPaths) {
      $wpNorm = Normalize-PathPrefix -Path $wp
      if ([string]::IsNullOrWhiteSpace($wpNorm)) { continue }

      if ($tpNorm.StartsWith($wpNorm) -or $wpNorm.StartsWith($tpNorm)) {
        $owned = $true
        break
      }
    }
    if (-not $owned) { return $false }
  }

  return $true
}

function Paths-Overlap {
  param(
    [string[]]$A,
    [string[]]$B
  )

  foreach ($a in $A) {
    $aNorm = Normalize-PathPrefix -Path $a
    if ([string]::IsNullOrWhiteSpace($aNorm)) { continue }

    foreach ($b in $B) {
      $bNorm = Normalize-PathPrefix -Path $b
      if ([string]::IsNullOrWhiteSpace($bNorm)) { continue }

      if ($aNorm.StartsWith($bNorm) -or $bNorm.StartsWith($aNorm)) {
        return $true
      }
    }
  }
  return $false
}

if (-not (Test-Path $BoardPath)) {
  throw "Board file not found: $BoardPath"
}

$workers = Parse-Workers -Path $BoardPath
if ($workers.Count -eq 0) {
  throw "No workers found in board file: $BoardPath"
}

$completed = @()
if (Test-Path $CompletedPath) {
  $completed = Get-Content -Path $CompletedPath |
    ForEach-Object { $_.Trim() } |
    Where-Object { -not [string]::IsNullOrWhiteSpace($_) -and -not $_.StartsWith("#") }
}

$taskFiles = Get-ChildItem -Path $TasksRoot -Recurse -Filter "T-*.yaml"
$allTaskCards = @()
foreach ($f in $taskFiles) {
  $parsed = Parse-TaskCard -Path $f.FullName
  if (-not [string]::IsNullOrWhiteSpace($parsed.id)) {
    $allTaskCards += $parsed
  }
}

$taskCardById = @{}
foreach ($card in $allTaskCards) {
  $taskCardById[$card.id] = $card
}

$boardTasks = Parse-BoardTasks -Path $BoardPath

$tasks = @()
if ($boardTasks.Count -gt 0) {
  foreach ($bt in $boardTasks) {
    if (-not $taskCardById.ContainsKey($bt.id)) {
      Write-Warning ("Board task id not found in task cards: {0}" -f $bt.id)
      continue
    }

    $base = $taskCardById[$bt.id]

    $merged = [pscustomobject]@{
      id = $base.id
      title = if (-not [string]::IsNullOrWhiteSpace($bt.title)) { $bt.title } else { $base.title }
      type = if (-not [string]::IsNullOrWhiteSpace($bt.type)) { $bt.type } else { $base.type }
      scope = if (-not [string]::IsNullOrWhiteSpace($bt.scope)) { $bt.scope } else { $base.scope }
      goal = if (-not [string]::IsNullOrWhiteSpace($bt.goal)) { $bt.goal } else { $base.goal }
      depends_on = [string[]]@($(if ($bt.depends_on.Count -gt 0) { $bt.depends_on } else { $base.depends_on }))
      allowed_paths = [string[]]@($(if ($bt.allowed_paths.Count -gt 0) { $bt.allowed_paths } else { $base.allowed_paths }))
      validation = [string[]]@($(if ($bt.validation.Count -gt 0) { $bt.validation } else { $base.validation }))
      commit_subject = if (-not [string]::IsNullOrWhiteSpace($bt.commit_subject)) { $bt.commit_subject } else { $base.commit_subject }
      file = $base.file
    }

    $tasks += $merged
  }
} else {
  $tasks = $allTaskCards
}

$ready = $tasks |
  Where-Object { $completed -notcontains $_.id } |
  Where-Object {
    if ($_.depends_on.Count -eq 0) { return $true }
    foreach ($dep in $_.depends_on) {
      if ($completed -notcontains $dep) { return $false }
    }
    return $true
  } |
  Sort-Object id

$assignments = @()
$takenTaskIds = New-Object System.Collections.Generic.HashSet[string]
$takenPathGroups = @()

foreach ($worker in $workers) {
  $candidate = $null

  foreach ($task in $ready) {
    if ($takenTaskIds.Contains($task.id)) { continue }
    if (-not (Path-IsOwned -TaskPaths $task.allowed_paths -WorkerPaths $worker.allowed_paths)) { continue }

    $overlap = $false
    foreach ($paths in $takenPathGroups) {
      if (Paths-Overlap -A $task.allowed_paths -B $paths) {
        $overlap = $true
        break
      }
    }
    if ($overlap) { continue }

    $candidate = $task
    break
  }

  if ($null -ne $candidate) {
    $candidatePaths = @($candidate.allowed_paths | ForEach-Object { Normalize-PathPrefix -Path $_ } | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })

    $takenTaskIds.Add($candidate.id) | Out-Null
    $takenPathGroups += ,$candidatePaths
    $assignments += [pscustomobject]@{
      worker_id = $worker.id
      worker_branch = $worker.branch
      task_id = $candidate.id
      task_title = $candidate.title
      commit_subject = $candidate.commit_subject
      validation = if (@($candidate.validation).Count -gt 0) { @($candidate.validation)[0] } else { "npm run check" }
      task_file = $candidate.file
    }
  }
}

$lines = New-Object System.Collections.Generic.List[string]
$lines.Add("# Codex Assignment Snapshot")
$lines.Add("")
$lines.Add(("Generated: {0}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss")))
$lines.Add(("Board: {0}" -f $BoardPath))
$lines.Add(("Completed count: {0}" -f $completed.Count))
$lines.Add(("Ready tasks: {0}" -f $ready.Count))
$lines.Add("")

if ($assignments.Count -eq 0) {
  $lines.Add("No assignable tasks found for current worker path ownership and completed dependency set.")
} else {
  $lines.Add("## Assignments")
  $lines.Add("")
  foreach ($a in $assignments) {
    $lines.Add(("- Worker {0} ({1})" -f $a.worker_id, $a.worker_branch))
    $lines.Add(("  - Task: {0} — {1}" -f $a.task_id, $a.task_title))
    $lines.Add(("  - Commit: {0}" -f $a.commit_subject))
    $lines.Add(("  - Validate: {0}" -f $a.validation))
    $taskFileRelative = Resolve-Path -Relative -Path $a.task_file
    $lines.Add(("  - Card: {0}" -f $taskFileRelative))
  }
}

$lines.Add("")
$lines.Add("## Next")
$lines.Add("1. Send each worker the assigned task card with worker template.")
$lines.Add("2. Collect status/diff/validation outputs.")
$lines.Add("3. Append completed task IDs to completed-tasks.txt and re-run this script.")

Set-Content -Path $OutputPath -Value $lines -Encoding utf8

Write-Host ("Wrote assignment snapshot to {0}" -f $OutputPath)
