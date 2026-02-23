# Task ID: T-SEC-002

## Title
AI Request Rate Limiting

## Area
SEC

## Requirement IDs
- REQ-NFR-003

## Depends On
- T-AI-001
- T-CORE-002

## Description
Implement per-workspace rate limits for AI generation/scoring calls to prevent abuse and enforce fair usage.

## Acceptance Criteria
- Workspace-level generation and scoring limits enforced
- Burst + sustained limit strategy defined
- Exceeded limit returns safe error and retry timing
- Limits configurable by plan tier
- Rate-limit events logged

## Technical Notes
- Apply at server action or orchestrator boundary
- Keep counters in fast store (redis/db cache) as available
- Do not expose internal limit internals in client errors
- Integrate with monetization gating rules where needed

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Server-side enforcement present
- Audit/security log emitted for throttle events
