# Task ID: T-COLLAB-003

## Title
Role-Gated UI Components

## Area
COLLAB

## Requirement IDs
- REQ-COLLAB-001
- REQ-COLLAB-003
- REQ-COLLAB-005

## Depends On
- T-COLLAB-001
- T-CORE-003

## Description
Create reusable role-gating UI wrappers and action guards to hide/disable unauthorized controls while preserving server-side enforcement. Include read-only insights mode for Viewer.

## Acceptance Criteria
- Reusable `RoleGate` component created
- Unauthorized actions hidden or disabled with explanatory tooltip
- Viewer gets read-only insights access
- Editor sees content/calendar controls only where permitted
- Creator-only controls rendered correctly for identity/memory approvals
- REQ-COLLAB-005 satisfied

## Technical Notes
- UI gating is UX only; never replaces server checks
- Use existing shared UI primitives (button, tooltip, alert)
- Keep role context sourced from server session/membership
- No custom design tokens

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- UI follows shared UI primitives rules
