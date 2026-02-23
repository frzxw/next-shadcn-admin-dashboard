# Task ID: T-AI-006

## Title
Outline Generation Server Action

## Area
AI

## Requirement IDs
- REQ-AI-002

## Depends On
- T-AI-001
- T-AI-005
- T-COLLAB-002
- T-AUDIT-003

## Description
Implement server action that generates structured outlines with permission checks, schema validation, memory-aware context injection, and audited trace metadata.

## Acceptance Criteria
- Session and role validation enforced
- Request validated with outline schema
- Context injection follows memory rules
- Orchestrator invoked and returns typed outline
- Errors handled safely; retry possible
- Audit entry written for every call

## Technical Notes
- Generation model route configured by orchestrator
- Keep scoring-specific settings separate
- Token budget enforcement applied

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Server-side permission enforcement present
- Audit event recorded
