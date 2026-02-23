# Task ID: T-AGENT-005

## Title
Content Pillars Definition & CRUD

## Area
AGENT

## Requirement IDs
- REQ-AGENT-008

## Depends On
- T-AGENT-001
- T-AGENT-002

## Description
Enable defining, editing, and deleting content pillars per agent. Content pillars define the strategic topic clusters that the agent should focus on. Used downstream for narrative alignment scoring. CRUD operations via server actions with Creator/Editor permission.

Reference: specs/01-product-spec.md §5.2,  specs/06-kpi-definitions.md §2.4 (pillar embeddings input).

## Acceptance Criteria
- Pillar CRUD server actions (create, update, delete, list) for a given agent
- Pillar UI within agent detail (Identity or Overview tab)
- Each pillar: name, description
- Minimum 1 pillar recommended per agent
- Pillar data used as input for alignment scoring (T-AI-012)
- Permission: Creator + Editor can manage pillars

## Technical Notes
- Stored in `agent_content_pillars` table from T-AGENT-001
- Pillar embeddings computed lazily when alignment scoring runs
- Zod validation on inputs
- Audit log for pillar changes

## Definition of Done
- Requirement satisfied: REQ-AGENT-008
- Type-safe
- No console errors
- Server-side permission enforcement present
- Audit event recorded
