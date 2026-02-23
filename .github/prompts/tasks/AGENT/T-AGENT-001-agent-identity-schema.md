# Task ID: T-AGENT-001

## Title
Agent & Identity Files Database Schema

## Area
AGENT

## Requirement IDs
- REQ-AGENT-001
- REQ-AGENT-002
- REQ-NFR-008

## Depends On
- T-CORE-001

## Description
Create database tables for agents and the OpenClaw-style agent brain files. Tables: `agents` (with type, status, default_platform), `agent_files` (SOUL/IDENTITY/USER/MEMORY versioned content), `agent_file_current` (pointer to latest version), and `agent_content_pillars`. Includes indexes per specs/05-data-model.md §4–§5.

Reference: specs/05-data-model.md §4, §5; specs/03-architecture.md §7.

## Acceptance Criteria
- `agents` table: id, workspace_id, name, type enum (influencer|educator|commentary|other), status (active|archived), default_platform, timestamps
- `agent_files` table: id, agent_id, file_type enum (SOUL|IDENTITY|USER|MEMORY), content, version_number, created_by, created_at
- Unique constraint on (agent_id, file_type, version_number)
- `agent_file_current` pointer table: agent_id, file_type, current_version_id
- `agent_content_pillars` table: id, agent_id, pillar_name, description
- Indexes on workspace_id, (workspace_id, status)
- Migration runs cleanly

## Technical Notes
- Agent type drives UI behavior (influencer → visual engine, educator → voice engine)
- Version history is append-only for identity files (specs/05-data-model.md §3)
- Soft delete via status field (specs/05-data-model.md §15)
- All agent entities scoped to workspace (specs/05-data-model.md §1)

## Definition of Done
- Requirement satisfied: REQ-AGENT-001, REQ-AGENT-002, REQ-NFR-008
- Type-safe ORM models
- No console errors
- Migration idempotent
