# Task ID: T-NFR-004

## Title
Server Component Rendering Optimization

## Area
NFR

## Requirement IDs
- REQ-NFR-002

## Depends On
- T-CORE-003

## Description
Optimize dashboard shells to use server components by default and hydrate only interactive widgets.

## Acceptance Criteria
- Major dashboard shells are server components
- Client components limited to interactive controls/charts needing client runtime
- Removed avoidable client-side heavy transforms
- Route-level loading boundaries configured
- Initial render latency reduced for dashboard routes

## Technical Notes
- Follow Next.js App Router RSC boundaries
- Move expensive data transforms to server services
- Keep chart data precomputed server-side
- Avoid passing oversized serialized payloads to client

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Performance target support demonstrated
