# Task ID: T-COLLAB-002

## Title
Server Permission Enforcement Middleware

## Area
COLLAB

## Requirement IDs
- REQ-COLLAB-002
- REQ-COLLAB-003
- REQ-COLLAB-004

## Depends On
- T-COLLAB-001
- T-CORE-002

## Description
Apply mandatory RBAC checks in server actions and sensitive routes. Enforce Creator-only identity edits and durable memory promotion approval; enforce Editor access for drafts/calendar operations.

## Acceptance Criteria
- Permission guard utility used by all mutating server actions
- Creator-only enforcement for SOUL/IDENTITY/MEMORY durable edits
- Creator-only enforcement for memory promotion approval
- Editor access allowed for drafts and calendar mutations
- Unauthorized requests return safe 403 responses
- REQ-COLLAB-002, REQ-COLLAB-003, REQ-COLLAB-004 satisfied

## Technical Notes
- Validate session first, then membership, then policy check
- Keep checks server-side even if UI hides controls
- Use zod for action input validation before mutation
- Audit denied access attempts where applicable

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Server-side permission enforcement present
- Audit event recorded for sensitive denies if configured
