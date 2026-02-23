# Multi-Agent Sequential Workflow

This playbook is for running 2+ Codex agents in parallel while keeping each commit atomic and low-risk.

## 1) Branch Model
- Base branch: `main`
- Integration branch: `split/<initiative>`
- Worker branches: `agent/a`, `agent/b`, `agent/c`, ...

## 2) Prepare Worktrees
Use `scripts/setup-codex-worktrees.ps1` to create worker worktrees and branches.

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

## 7) Conflict Policy
- If conflict appears, do not broad-fix.
- Create a dedicated follow-up task card limited to conflicting files.
- Re-run through normal loop.

## 8) Completion Criteria
- All task cards merged into integration branch.
- Integration checks pass.
- Final PR from integration branch to `main`.
