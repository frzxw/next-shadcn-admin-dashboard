# Task ID: T-CORE-004

## Title
Tiered Navigation Sidebar Component

## Area
CORE

## Requirement IDs
- REQ-CORE-002

## Depends On
- T-CORE-003

## Description
Build the Tier 1 persistent vertical sidebar navigation for the creator workspace. Implements the 10 primary nav items (Home, Agents, Content, Calendar, Insights, Audience, Assets, Experiments, Memory, Settings) with icons, labels, active state, and collapsible behavior. On mobile, render as bottom tab bar (max 5 shortcuts).

Reference: specs/04-information-architecture.md §2, specs/16-design-system-alignment.md §9.1.

## Acceptance Criteria
- Sidebar renders all 10 Tier 1 items with icons + labels
- Active route highlighted
- Sidebar collapses to icons on tablet breakpoint
- Mobile bottom tab bar with top 5 shortcuts
- Links navigate to correct routes
- Uses shared UI primitives from `src/components/ui/sidebar.tsx`
- No more than 7 items visible without scrolling (specs/04-information-architecture.md §1)

## Technical Notes
- Reuse existing `src/components/ui/sidebar.tsx` component
- Extend `src/navigation/sidebar/sidebar-items.ts` for creator workspace items
- Responsive breakpoints: desktop (12-col), tablet (8-col), mobile (4-col)
- No nested collapsible beyond Tier 2 (specs/16-design-system-alignment.md §9.1)
- Use consistent spacing tokens

## Definition of Done
- Requirement satisfied: REQ-CORE-002
- Type-safe
- No console errors
- UI follows shared UI primitives rules
- Responsive behavior verified across breakpoints
