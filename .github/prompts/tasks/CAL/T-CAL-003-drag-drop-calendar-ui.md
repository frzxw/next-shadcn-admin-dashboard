# Task ID: T-CAL-003

## Title
Drag-and-Drop Calendar UI

## Area
CAL

## Requirement IDs
- REQ-CAL-001
- REQ-CAL-002

## Depends On
- T-CAL-002
- T-CORE-003
- T-CORE-005

## Description
Build the interactive content calendar with drag-and-drop support in both weekly and monthly views. Each calendar item shows title, agent badge, platform icon, and lifecycle state. Items are draggable to reschedule. Supports agent and platform filter from global context.

Reference: specs/01-product-spec.md §5.4, specs/04-information-architecture.md §2 (Calendar tabs).

## Acceptance Criteria
- Weekly view: 7-day grid with time slots
- Monthly view: 30-day grid with day cells
- Drag-and-drop to reschedule (calls moveScheduledContent action)
- Each item: title, agent badge (color-coded), platform icon, state
- View toggle: weekly ↔ monthly
- Filter by agent/platform/state from global filters
- Loading and empty states
- Mobile: simplified list view

## Technical Notes
- Use an established drag-and-drop library (react-dnd or dnd-kit)
- Calendar data fetched server-side by date range
- Status lanes reflected by color/style on items
- Tier 2 tabs: Monthly View, Weekly View, Campaigns, Cadence Health

## Definition of Done
- Requirement satisfied: REQ-CAL-001, REQ-CAL-002
- Type-safe
- No console errors
- UI follows shared UI primitives rules
- Responsive behavior verified
