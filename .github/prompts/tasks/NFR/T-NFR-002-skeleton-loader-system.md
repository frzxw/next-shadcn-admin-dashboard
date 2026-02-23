# Task ID: T-NFR-002

## Title
Skeleton Loading & Perceived Latency

## Area
NFR

## Requirement IDs
- REQ-NFR-002

## Depends On
- T-CORE-006

## Description
Add consistent skeleton/loading states for all async dashboard cards and data-heavy views to meet perceived speed targets.

## Acceptance Criteria
- Shared skeleton variants for KPI cards, charts, tables, panels
- Loading states shown immediately on route transition
- No blank or flashing states in async areas
- Error fallback UI present for failed fetches
- Home/Insights/Agent dashboards include skeleton coverage

## Technical Notes
- Use shared `skeleton` primitive
- Keep layout stable during loading to reduce jank
- Pair with server component data fetching
- Ensure accessibility semantics for loading regions

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- UI follows shared UI primitives rules
