# Task ID: T-AUDIT-001

## Title
Append-Only Audit Log Service

## Area
AUDIT

## Requirement IDs
- REQ-AUDIT-001

## Depends On
- T-CORE-001

## Description
Implement core audit service at `src/server/services/audit/audit.ts` and append-only `audit_log` table writes for critical mutations and AI actions.

## Acceptance Criteria
- Audit write helper supports action_type, entity_type, entity_id, metadata, actor, workspace
- No update/delete paths exposed for audit records
- All audit writes are append-only inserts
- Metadata excludes secrets and raw credentials
- Service reusable across domains

## Technical Notes
- Use lightweight JSON metadata
- Keep audit writes non-blocking where safe
- Provide strict typed event payload contracts
- Required for all write mutations

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Append-only enforcement present
