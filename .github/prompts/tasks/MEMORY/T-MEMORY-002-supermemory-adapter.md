# Task ID: T-MEMORY-002

## Title
Supermemory Adapter Service

## Area
MEMORY

## Requirement IDs
- REQ-MEMORY-001

## Depends On
- T-MEMORY-001

## Description
Build the Supermemory client adapter at `src/server/services/supermemory/supermemoryClient.ts`. Implements remember(), recall(), forget(), and summarize() operations. Handles namespacing with workspace/agent/tier/domain tags. Respects token budget limits for recall.

Reference: specs/03-architecture.md §6, specs/08-memory-system.md §6.

## Acceptance Criteria
- `remember(item)`: creates memory with tags + confidence
- `recall(query, filters)`: semantic search with namespace filtering, returns top-k results
- `forget(id)`: disables/deletes item (admin gated)
- `summarize(filters)`: optional rollup for dashboards
- Namespace tags applied: workspace:<id>, agent:<id>, tier:<tier>, domain:<domain>
- Token budget enforced: durable ≤ 1000, candidate ≤ 500, prevention ≤ 500
- Top-k memory retrieval only (never full dump)

## Technical Notes
- Integration boundary: `src/server/services/supermemory/`
- DB remains system-of-record; Supermemory is recall substrate (specs/03-architecture.md §6.1)
- Never inject entire memory store into context (specs/08-memory-system.md §6.3)
- Memory recall priority: prevention rules > durable > recent (specs/07-ai-contracts.md §9)
- Server-only module

## Definition of Done
- Requirement satisfied: REQ-MEMORY-001
- Type-safe
- No console errors
- Token budget limits enforced
