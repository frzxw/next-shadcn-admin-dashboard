# Task ID: T-AI-009

## Title
Repurposing Suggestions Server Action

## Area
AI

## Requirement IDs
- REQ-AI-003

## Depends On
- T-AI-001
- T-AI-008
- T-COLLAB-002
- T-AUDIT-003

## Description
Implement server action for cross-format repurposing suggestions with permission checks and audited AI trace.

## Acceptance Criteria
- Session and role validation (Creator/Editor)
- Request validation with repurposing schema
- Context injection includes identity and prevention rules
- Returns ranked suggestions + trace metadata
- Safe error fallback and retry support
- Audit event logged for call

## Technical Notes
- Keep provider routing in orchestrator
- Avoid exposing sensitive context to client
- Apply token budget for context injection

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Server-side permission enforcement present
- Audit event recorded
