# Task ID: T-MEMORY-005

## Title
Mistakes CRUD & Failure Taxonomy

## Area
MEMORY

## Requirement IDs
- REQ-MEMORY-004
- REQ-MEMORY-005

## Depends On
- T-MEMORY-001
- T-COLLAB-002

## Description
Implement CRUD for mistakes (structured ERRORS.md equivalent) with failure taxonomy classification. Failure types: VISUAL_IDENTITY_DRIFT, LIP_SYNC_UNCANNY, STYLE_INCONSISTENCY, OFF_BRAND_TOPIC, STRUCTURAL_RETENTION_DROP, FACTUAL_ERROR. Supports active/resolved status and linked posts.

Reference: specs/01-product-spec.md §5.2 Mistakes, specs/08-memory-system.md §7.

## Acceptance Criteria
- Create/update/resolve mistake records
- Failure type classified from taxonomy enum
- Context, root_cause, correction fields captured
- Active vs resolved status tracking
- Recurrence rate calculation: same failure_type count over time
- Linked to post_id for drill-down
- Permission: system-created (auto-detection), Creator+Editor (manual)

## Technical Notes
- Failure taxonomy from specs/01-product-spec.md: VISUAL_IDENTITY_DRIFT, LIP_SYNC_UNCANNY, STYLE_INCONSISTENCY, OFF_BRAND_TOPIC, STRUCTURAL_RETENTION_DROP, FACTUAL_ERROR
- Auto-detection creates mistakes from scoring anomalies (AI integration)
- Recurring failure rate = repeat_failures / total_failures (specs/06-kpi-definitions.md §5.2)
- Zod validation on inputs
- Audit logging for mutations

## Definition of Done
- Requirement satisfied: REQ-MEMORY-004, REQ-MEMORY-005
- Type-safe enum for failure taxonomy
- Server-side permission enforcement present
- Audit event recorded
