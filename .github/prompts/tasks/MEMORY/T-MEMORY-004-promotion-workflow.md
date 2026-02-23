# Task ID: T-MEMORY-004

## Title
Memory Promotion Workflow

## Area
MEMORY

## Requirement IDs
- REQ-MEMORY-003

## Depends On
- T-MEMORY-003
- T-COLLAB-002
- T-AUDIT-005

## Description
Implement the candidate → durable memory promotion workflow. Creator reviews candidate memories, approves or rejects. Approval: updates tier to durable, appends summary to MEMORY.md (new version), pushes to Supermemory with durable tag. Rejection logged with reason.

Reference: specs/08-memory-system.md §5.3.

## Acceptance Criteria
- `promoteMemory` server action: Creator only
- On approval: tier → durable, MEMORY.md version bump, Supermemory update
- On rejection: tier → rejected (or deleted), reason logged
- pending promotion queue displayed in Memory UI
- Confidence threshold auto-suggestion (optional Creator override)
- Audit log for promotion/rejection (via T-AUDIT-005)

## Technical Notes
- Promotion requires Creator role (specs/10-permissions-matrix.md §4.6)
- MEMORY.md update creates new agent_file version
- Supermemory tag update from candidate → durable
- Conflict detection: check for contradictory durable memories (specs/08-memory-system.md §9)
- Memory size limits enforced on durable injection cap

## Definition of Done
- Requirement satisfied: REQ-MEMORY-003
- Type-safe
- Server-side permission enforcement present
- Audit event recorded
