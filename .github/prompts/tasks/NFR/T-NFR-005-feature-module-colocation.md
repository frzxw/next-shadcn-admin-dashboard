# Task ID: T-NFR-005

## Title
Feature Module Colocation Enforcement

## Area
NFR

## Requirement IDs
- REQ-NFR-004

## Depends On
- T-CORE-003

## Description
Enforce route-group-based feature colocation for app routes, feature-local components, server actions, and services.

## Acceptance Criteria
- Creator domains colocated under `src/app/(main)/dashboard/creator/<domain>`
- Domain local components under `_components` folders
- Server actions grouped by domain in `src/server/actions`
- No cross-domain UI primitive duplication in feature folders
- Project structure documented for contributors

## Technical Notes
- Preserve shared concerns in `src/components`, `src/lib`, `src/stores`
- Keep imports directional (feature -> shared, not shared -> feature)
- Avoid broad refactors outside scoped domains
- Align with repository instruction constraints

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Architecture aligns with spec
