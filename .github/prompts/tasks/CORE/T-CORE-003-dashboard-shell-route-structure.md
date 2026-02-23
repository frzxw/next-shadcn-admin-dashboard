# Task ID: T-CORE-003

## Title
Creator Dashboard Shell & Route Structure

## Area
CORE

## Requirement IDs
- REQ-CORE-002
- REQ-NFR-004

## Depends On
- T-CORE-002

## Description
Create the creator workspace route group at `src/app/(main)/dashboard/creator/` with sub-routes for all Tier 1 navigation domains: home, agents, content, calendar, insights, audience, assets, experiments, memory, settings. Each route gets a placeholder `page.tsx`. Create a shared layout with sidebar slot.

Reference: specs/03-architecture.md §3.1, specs/04-information-architecture.md §2.

## Acceptance Criteria
- Route group `src/app/(main)/dashboard/creator/` created
- All 10 domain routes created with placeholder pages
- Shared layout.tsx with sidebar integration point
- Feature-local `_components/` directories created per domain
- Route group follows colocated module pattern (REQ-NFR-004)
- Pages render without error

## Technical Notes
- Use server components for layout shell
- Sidebar component integrated via layout (implemented in T-CORE-004)
- Each domain route is a separate directory under `creator/`
- Home route uses `(home)/page.tsx` pattern
- Preserve existing `src/app/(main)/dashboard/` routes

## Definition of Done
- Requirement satisfied: REQ-CORE-002, REQ-NFR-004
- Type-safe
- No console errors
- All routes accessible via browser
- Colocated structure matches specs/03-architecture.md §3.1
