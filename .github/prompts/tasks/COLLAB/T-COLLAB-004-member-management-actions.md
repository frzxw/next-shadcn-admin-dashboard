# Task ID: T-COLLAB-004

## Title
Workspace Member Management Actions

## Area
COLLAB

## Requirement IDs
- REQ-COLLAB-001

## Depends On
- T-CORE-001
- T-COLLAB-002

## Description
Implement server actions for workspace member invite, role update, and removal. Restrict membership management to Creator role.

## Acceptance Criteria
- `inviteMember`, `updateMemberRole`, `removeMember` actions implemented
- Creator-only enforcement for all membership mutations
- Role changes validated against allowed role enum
- Membership list query provided for settings UI
- Audit log written for role and membership changes

## Technical Notes
- Workspace scoping mandatory on all membership operations
- Prevent removing last Creator without replacement
- Use zod schemas for payload validation
- Protect against self-demotion edge case

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Server-side permission enforcement present
- Audit event recorded
