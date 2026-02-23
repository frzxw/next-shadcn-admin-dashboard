# Task ID: T-MEMORY-003

## Title
Ephemeral & Candidate Memory Write Services

## Area
MEMORY

## Requirement IDs
- REQ-MEMORY-002

## Depends On
- T-MEMORY-001
- T-MEMORY-002
- T-AUDIT-005

## Description
Implement services for creating ephemeral and candidate memory items. Ephemeral memory auto-created by system events (KPI anomalies, experiment completion, AI summaries). Candidate memory created by repeated signals or explicit user action. Both write to DB and optionally mirror to Supermemory.

Reference: specs/08-memory-system.md §5.1, §5.2.

## Acceptance Criteria
- `createEphemeralMemory` service: creates tier=ephemeral item, logs audit
- `createCandidateMemory` service: creates tier=candidate with confidence_score, logs audit
- Auto-expiration logic for ephemeral (configurable window, e.g., 30 days)
- Candidate expiration for unreviewed items (e.g., 60 days)
- Mirrors to Supermemory with appropriate tags
- Permission: system-generated (ephemeral), Creator+Editor (manual candidate)

## Technical Notes
- Ephemeral triggered by: KPI anomaly, experiment completion, AI summary
- Candidate triggered by: repeated signal, experiment confidence, recurring failure
- Auto-expire implemented via scheduled cleanup or soft TTL
- Audit log for all memory writes (specs/08-memory-system.md §12)

## Definition of Done
- Requirement satisfied: REQ-MEMORY-002
- Type-safe
- No console errors
- Audit event recorded
