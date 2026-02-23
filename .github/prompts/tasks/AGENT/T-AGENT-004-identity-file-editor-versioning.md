# Task ID: T-AGENT-004

## Title
Agent Identity File Editor & Versioning

## Area
AGENT

## Requirement IDs
- REQ-AGENT-002
- REQ-AGENT-007

## Depends On
- T-AGENT-002
- T-COLLAB-002
- T-AUDIT-004

## Description
Build the Identity tab UI for agents: a structured editor for SOUL.md, IDENTITY.md, USER.md, and MEMORY.md files. Supports viewing current version, editing (Creator only for SOUL/IDENTITY/durable MEMORY), viewing version history with diffs, and previewing persona voice/tone summary.

Reference: specs/03-architecture.md §7, specs/01-product-spec.md §5.2 Identity, specs/10-permissions-matrix.md §4.2.

## Acceptance Criteria
- Editor renders current content for each file type
- Edit capability role-gated: SOUL/IDENTITY/MEMORY = Creator only; USER = Creator + Editor (conditional)
- Save creates new version (append-only)
- Version history sidebar shows all versions with timestamps and authors
- Diff viewer between versions
- Persona preview panel (voice, tone, positioning summary)
- All edits logged to audit with diff (via T-AUDIT-004)

## Technical Notes
- Use `src/lib/agent-brain/schema.ts` for file type validation
- Parse helpers at `src/lib/agent-brain/parse.ts`
- Version history stored in agent_files table
- agent_file_current updated on save
- Content pillar preview derived from IDENTITY.md
- Identity change may invalidate Supermemory cache (T-NFR-003)

## Definition of Done
- Requirement satisfied: REQ-AGENT-002, REQ-AGENT-007
- Type-safe
- No console errors
- Server-side permission enforcement present
- Audit event recorded for identity edits
- UI follows shared UI primitives rules
