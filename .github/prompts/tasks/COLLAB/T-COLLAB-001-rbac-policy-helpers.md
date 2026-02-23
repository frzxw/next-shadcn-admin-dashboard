# Task ID: T-COLLAB-001

## Title
RBAC Policy Helpers

## Area
COLLAB

## Requirement IDs
- REQ-COLLAB-001

## Depends On
- T-CORE-001
- T-CORE-012

## Description
Implement centralized RBAC policy helpers in `src/lib/permissions/` with `policies.ts` and `can.ts`. Define action-level permission checks by role (Creator, Editor, Analyst, Viewer) across domains.

## Acceptance Criteria
- Role enum and permission matrix implemented in code
- `can(role, action, context)` helper exported and typed
- Domain policy groups include Agents, Identity Files, Content, Calendar, Insights, Experiments, Memory, Assets, Settings
- Conditional Editor rules implemented per finalized matrix
- Unit-testable pure policy functions
- REQ-COLLAB-001 satisfied

## Technical Notes
- Server is source of truth; UI uses same helpers for gating only
- Keep policy definitions declarative and centrally versioned
- Zod schema for role/action inputs where applicable
- No direct DB calls inside policy helper

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Server-side permission enforcement ready for integration
