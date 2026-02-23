# Task ID: T-MEMORY-001

## Title
Memory Items, Mistakes & Prevention Rules Schema

## Area
MEMORY

## Requirement IDs
- REQ-MEMORY-001
- REQ-MEMORY-004

## Depends On
- T-CORE-001
- T-AGENT-001

## Description
Create database tables for the memory system: `memory_items` (tier: ephemeral/candidate/durable, content, tags jsonb, confidence_score, source_type), `mistakes` (failure_type, root_cause, correction, linked post), `prevention_rules` (rule_text, confidence, active flag, promoted_to_memory).

Reference: specs/05-data-model.md §11, §12; specs/08-memory-system.md §3.

## Acceptance Criteria
- `memory_items` table: id, agent_id, tier enum (ephemeral|candidate|durable), content, tags (jsonb), confidence_score, source_type (manual|experiment|ai_auto), created_at, promoted_at (nullable)
- Index on (agent_id, tier)
- `mistakes` table: id, agent_id, failure_type, context, root_cause, correction, status (active|resolved), post_id (nullable), created_at
- Index on (agent_id, failure_type)
- `prevention_rules` table: id, agent_id, mistake_id (nullable), rule_text, confidence_score, is_active, promoted_to_memory, created_at
- Migration runs cleanly

## Technical Notes
- Memory items support jsonb tags for Supermemory namespacing (specs/08-memory-system.md §6.2)
- Mistakes are structured ERRORS.md equivalent
- Prevention rules link to mistakes and may promote to durable memory
- Ephemeral memory auto-expires (handled by service, not schema)
- Failures classified by taxonomy from specs/01-product-spec.md

## Definition of Done
- Requirement satisfied: REQ-MEMORY-001, REQ-MEMORY-004
- Type-safe ORM models
- Migration idempotent
