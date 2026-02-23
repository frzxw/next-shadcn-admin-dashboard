# Task ID: T-NFR-003

## Title
KPI Snapshot Caching Strategy

## Area
NFR

## Requirement IDs
- REQ-NFR-002

## Depends On
- T-INSIGHT-001

## Description
Implement cache strategy for read-heavy KPI queries keyed by workspace, agent, and range with short TTL and invalidation hooks.

## Acceptance Criteria
- Cache layer applied to KPI snapshot reads
- Cache key includes workspace_id, agent_id, range
- TTL configured for active workspaces
- Invalidate on new metrics ingestion or memory/identity events where relevant
- Dashboard response times improve vs uncached baseline

## Technical Notes
- Favor server-side cache boundaries
- Keep cache payload compact
- Use stale-while-revalidate if supported
- Ensure cache safety in multi-tenant context

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Performance target support demonstrated
