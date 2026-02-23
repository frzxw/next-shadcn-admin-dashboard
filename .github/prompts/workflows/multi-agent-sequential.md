# Multi-Agent Sequential Workflow

This playbook is for running 2+ Codex agents in parallel while keeping each commit atomic and low-risk.

## 1) Branch Model
- Base branch: `main`
- Integration branch: `split/<initiative>`
- Worker branches: `agent/a`, `agent/b`, `agent/c`, ...

## 2) Prepare Worktrees
Use `scripts/setup-codex-worktrees.ps1` to create worker worktrees and branches.

## 2.5) Seed Completion State
- Keep completed task IDs in `workflows/completed-tasks.txt`.
- One task ID per line.

## 3) Create Task Cards
- Use `templates/task-card.template.yaml`.
- One card = one commit-sized unit.
- Include explicit `allowed_paths`.
- Include dependency list.

## 4) Coordinator Loop
1. Select dependency-ready task cards.
2. Assign one card per worker.
3. Ensure no overlapping allowed paths among active workers.
4. Wait for worker handoff outputs.
5. Rebase worker on integration branch.
6. Merge with `--ff-only` when possible.

### Automated Assignment
Generate a coordinator snapshot with:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/assign-codex-tasks.ps1 `
	-BoardPath .github/prompts/workflows/task-board.example.yaml `
	-CompletedPath .github/prompts/workflows/completed-tasks.txt `
	-OutputPath .github/prompts/workflows/assignments.current.md
```

Open `workflows/assignments.current.md` and dispatch tasks to workers.

### Automated Worker Launch
After assignments are generated and worker worktrees exist:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/start-codex-workers.ps1 `
	-AssignmentsPath .github/prompts/workflows/assignments.current.md `
	-WorkerTemplatePath .github/prompts/templates/worker-parallel.template.md
```

Dry-run (prepare prompts only, no Codex launch):

```powershell
powershell -ExecutionPolicy Bypass -File scripts/start-codex-workers.ps1 `
	-NoLaunch
```

### One-Command Cycle
Run assignment + launch together:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/run-codex-cycle.ps1
```

Dry-run cycle (no Codex launch, prompt files only):

```powershell
powershell -ExecutionPolicy Bypass -File scripts/run-codex-cycle.ps1 `
	-NoLaunch
```

Run fully autonomous cycle including merge phase:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/run-codex-cycle.ps1 `
	-AutoMerge
```

Run autonomous cycle and push integration branch after merge:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/run-codex-cycle.ps1 `
	-AutoMerge `
	-PushIntegration
```

## 5) Worker Loop
1. Execute one task card only.
2. Validate with task-specific command.
3. Return status, diff, validation output.
4. Stop and wait for next assignment.

## 6) Merge Commands (Coordinator)
```powershell
git switch split/<initiative>
git fetch origin

# worker branch is current in its worktree
git switch agent/a
git rebase split/<initiative>

git switch split/<initiative>
git merge --ff-only agent/a
```

Autonomous merge helper:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/merge-codex-workers.ps1 `
	-BoardPath .github/prompts/workflows/task-board.example.yaml
```

Preview only (no changes):

```powershell
powershell -ExecutionPolicy Bypass -File scripts/merge-codex-workers.ps1 `
	-BoardPath .github/prompts/workflows/task-board.example.yaml `
	-WhatIf
```

## 7) Conflict Policy
- If conflict appears, do not broad-fix.
- Create a dedicated follow-up task card limited to conflicting files.
- Re-run through normal loop.

## 8) Completion Criteria
- All task cards merged into integration branch.
- Integration checks pass.
- Final PR from integration branch to `main`.

## 9) Fast Operating Cycle
1. Update `completed-tasks.txt`.
2. Run `assign-codex-tasks.ps1`.
3. Dispatch tasks to workers.
4. Merge completed worker commits.
5. Repeat.
