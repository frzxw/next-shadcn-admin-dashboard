# Task ID: T-AI-003

## Title
Hook Generation Server Action

## Area
AI

## Requirement IDs
- REQ-AI-001

## Depends On
- T-AI-001
- T-AI-002
- T-COLLAB-002
- T-AUDIT-003

## Description
Implement server action for hook generation with session validation, permission checks, contract validation, context injection, orchestrator call, and trace return.

## Acceptance Criteria
- Action validates user session and role (Creator/Editor)
- Input validated using hook contract schema
- Injects identity snapshot + relevant memory + prevention rules
- Calls orchestrator and returns hooks + trace
- Errors handled with safe fallback messages
- AI call audited

## Technical Notes
- Follow context injection priority: prevention -> durable -> recent -> pillars
- Keep token budget limits for memory injection
- Do not expose provider internals in errors

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Server-side permission enforcement present
- Audit event recorded
