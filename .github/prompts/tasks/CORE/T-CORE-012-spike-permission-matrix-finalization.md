# Task ID: T-CORE-012

## Title
SPIKE — Permission Matrix Finalization

## Area
CORE

## Requirement IDs
- None (resolves OQ-003)

## Depends On
- None

## Description
Finalize the exact permission matrix for each role (Creator, Editor, Analyst, Viewer) across all modules. Review the draft matrix in specs/10-permissions-matrix.md and resolve any ambiguities, especially conditional permissions for Editor role. Produce the finalized matrix as a structured document.

Reference: specs/10-permissions-matrix.md, specs/02-requirements.md OQ-003.

## Acceptance Criteria
- Finalized permission matrix covering all domains: Agents, Identity Files, Content, Calendar, Insights, Experiments, Memory, Prevention Rules, Assets, Settings
- All conditional (△) permissions resolved with explicit rules
- Document committed to repo
- Decision unblocks T-COLLAB-001

## Technical Notes
- Editor conditionals per specs/10-permissions-matrix.md §4.1, §4.2, §4.8 need resolution
- Memory protection rules per specs/10-permissions-matrix.md §6
- Plan-based restrictions noted but deferred (specs/10-permissions-matrix.md §8)

## Definition of Done
- Finalized matrix document committed
- All conditional permissions resolved
- No implementation required — research only
