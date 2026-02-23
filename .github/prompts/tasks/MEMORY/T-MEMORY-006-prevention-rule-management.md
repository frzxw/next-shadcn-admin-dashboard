# Task ID: T-MEMORY-006

## Title
Prevention Rule Management Service

## Area
MEMORY

## Requirement IDs
- REQ-MEMORY-007

## Depends On
- T-MEMORY-005
- T-COLLAB-002

## Description
Implement prevention rule management: create rules from mistakes, activate/deactivate rules, promote effective rules to durable memory. Rules are injected into AI context during generation to prevent repeating mistakes.

Reference: specs/08-memory-system.md §7, specs/10-permissions-matrix.md §4.7.

## Acceptance Criteria
- Create prevention rule from mistake or manually
- Fields: rule_text, failure_type, confidence_score, is_active, linked mistake_id
- Activate/deactivate toggle (Creator only)
- Promote to durable memory (Creator only, via T-MEMORY-004)
- Active rules injected into AI context (max 500 tokens per specs/08-memory-system.md §10)
- Rule list per agent

## Technical Notes
- Editor can create rules; Creator only can activate/deactivate (specs/10-permissions-matrix.md §4.7)
- Active rules are part of AI context injection priority #1 (specs/07-ai-contracts.md §9)
- promoted_to_memory flag tracked
- Audit logging for all rule state changes

## Definition of Done
- Requirement satisfied: REQ-MEMORY-007
- Type-safe
- Server-side permission enforcement present
- Audit event recorded
