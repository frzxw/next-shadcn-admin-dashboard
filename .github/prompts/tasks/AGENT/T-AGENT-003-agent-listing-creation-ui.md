# Task ID: T-AGENT-003

## Title
Agent Listing & Creation UI

## Area
AGENT

## Requirement IDs
- REQ-AGENT-001

## Depends On
- T-AGENT-002
- T-CORE-003
- T-COLLAB-003

## Description
Build the Agents page with listing grid/table showing all workspace agents with name, type, status, integrity score badge, and creation date. Add agent creation flow via dialog/modal with form for name, type, default platform. Role-gate the create button (Creator only).

Reference: specs/04-information-architecture.md §2 (Agents tabs), specs/16-design-system-alignment.md §10.2.

## Acceptance Criteria
- Agent listing displays all workspace agents
- Each agent card: name, type badge, status, integrity score (if available)
- Create button visible only for Creator role
- Creation dialog: name, type select, platform select
- Form validates with zod on client
- Successful creation navigates to new agent detail
- Loading and empty states handled

## Technical Notes
- Use shared Card component for agent cards
- Dialog for creation (identity edits use modals per specs/16-design-system-alignment.md §10.2)
- Role gating via T-COLLAB-003 components
- Feature-local components in `src/app/(main)/dashboard/creator/agents/_components/`

## Definition of Done
- Requirement satisfied: REQ-AGENT-001
- Type-safe
- No console errors
- UI follows shared UI primitives rules
- Role-gated create button
