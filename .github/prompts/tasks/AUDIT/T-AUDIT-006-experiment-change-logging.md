# Task ID: T-AUDIT-006

## Title
Experiment Change Audit Logging

## Area
AUDIT

## Requirement IDs
- REQ-AUDIT-003

## Depends On
- T-AUDIT-001
- T-EXP-002

## Description
Log experiment lifecycle and mutation events: create, activate, complete, archive, variant updates, and learning promotions.

## Acceptance Criteria
- All experiment mutations create audit entries
- Variant-level changes include experiment_id and variant_id metadata
- Completion logs confidence_score and winning_variant_id
- Archive reason captured
- Promotion-to-memory link captured when applicable

## Technical Notes
- Hook in experiment server actions
- Keep metadata compact and typed
- Support filtering by entity_type=experiment
- Ensure no silent state transitions

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Audit event recorded for experiment changes
