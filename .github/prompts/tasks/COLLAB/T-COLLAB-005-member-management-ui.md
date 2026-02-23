# Task ID: T-COLLAB-005

## Title
Member Management Settings UI

## Area
COLLAB

## Requirement IDs
- REQ-COLLAB-001

## Depends On
- T-COLLAB-004
- T-CORE-003

## Description
Build settings UI for workspace members: list members, roles, invite flow, role changes, and remove action. Ensure role-gated visibility and safe confirmations.

## Acceptance Criteria
- Members table shows name, email, role, joined date
- Invite member form available for Creator
- Role select + update action with confirmation
- Remove member action with destructive confirmation
- Non-Creator roles see read-only view or no access
- Loading and error states included

## Technical Notes
- Use shared table, dialog, form, select primitives
- Confirmations via standard alert-dialog component
- No custom colors or ad-hoc styling
- Server actions from T-COLLAB-004 only

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- UI follows shared UI primitives rules
