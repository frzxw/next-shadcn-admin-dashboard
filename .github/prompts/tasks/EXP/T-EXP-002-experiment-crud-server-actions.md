# Task ID: T-EXP-002

## Title
Experiment CRUD Server Actions

## Area
EXP

## Requirement IDs
- REQ-EXP-001

## Depends On
- T-EXP-001
- T-COLLAB-002
- T-AUDIT-006

## Description
Implement server actions for experiment lifecycle: propose, activate, complete, archive. Add variant management actions. Each action validates permissions (Creator for activate/complete, Creator+Editor for propose), enforces guardrails, and logs audit events.

Reference: specs/09-experimentation-framework.md §4, specs/10-permissions-matrix.md §4.5.

## Acceptance Criteria
- `proposeExperiment` action: Creator+Editor, creates with hypothesis + primary_metric
- `activateExperiment` action: Creator only, transitions proposed → active
- `completeExperiment` action: Creator only, stores results
- `archiveExperiment` action: Creator only
- `addVariant` / `removeVariant` actions
- Max 3 active experiments per agent enforced
- Cannot change hypothesis mid-experiment
- Cannot modify variant content post-publish
- All mutations log audit events

## Technical Notes
- Guardrails from specs/09-experimentation-framework.md §8
- No overlapping experiments on same primary metric
- Zod validation on all inputs
- State machine transitions enforced server-side

## Definition of Done
- Requirement satisfied: REQ-EXP-001
- Type-safe
- Server-side permission enforcement present
- Audit event recorded
