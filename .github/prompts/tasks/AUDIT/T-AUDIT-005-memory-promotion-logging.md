# Task ID: T-AUDIT-005

## Title
Memory Action Audit Logging

## Area
AUDIT

## Requirement IDs
- REQ-AUDIT-004

## Depends On
- T-AUDIT-001
- T-MEMORY-004

## Description
Implement audit logging for memory lifecycle actions: ephemeral create, candidate create, promotion, rejection, conflict resolution.

## Acceptance Criteria
- Memory events log memory_id, tier_before, tier_after, confidence_score, actor, timestamp
- Promotion and rejection both audited
- Conflict resolution actions audited with resolution metadata
- Failed promotions produce failure audit event
- Query by memory_id supported

## Technical Notes
- Integrate in memory service layer
- Avoid duplicate logging for single transaction
- Use consistent action_type naming conventions
- Required for compliance and forensic tracing

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Audit event recorded for memory actions
