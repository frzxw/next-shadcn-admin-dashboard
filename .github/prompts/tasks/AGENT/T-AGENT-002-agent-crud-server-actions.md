# Task ID: T-AGENT-002

## Title
Agent CRUD Server Actions

## Area
AGENT

## Requirement IDs
- REQ-AGENT-001

## Depends On
- T-AGENT-001
- T-COLLAB-002
- T-AUDIT-001

## Description
Implement server actions for agent create, read, update, and archive operations at `src/server/actions/agents.actions.ts`. Each mutation validates session, checks RBAC permissions (Creator role for create/archive), validates input with zod schemas, and logs audit events.

Reference: specs/03-architecture.md §3.2, specs/10-permissions-matrix.md §4.1.

## Acceptance Criteria
- `createAgent` server action: validates Creator role, creates agent + initial identity file stubs
- `updateAgent` server action: validates Creator/Editor role, updates metadata
- `archiveAgent` server action: validates Creator role, soft-delete via status
- `getAgent` / `listAgents` server actions: workspace-scoped reads
- All mutations log audit events
- Input validated with zod schemas
- Returns typed responses

## Technical Notes
- Agent creation must create stub SOUL.md, IDENTITY.md, USER.md, MEMORY.md files
- Permission enforcement at server level (specs/10-permissions-matrix.md §5.1)
- Audit logging for create/archive/update (specs/11-audit-traceability.md §3.1)
- Editor cannot change agent type or archive (conditional permission)

## Definition of Done
- Requirement satisfied: REQ-AGENT-001
- Type-safe with zod validation
- No console errors
- Server-side permission enforcement present
- Audit event recorded for mutations
