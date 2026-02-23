# Task ID: T-CONTENT-004

## Title
Content Library Data Table UI

## Area
CONTENT

## Requirement IDs
- REQ-CONTENT-002

## Depends On
- T-CONTENT-003
- T-CORE-005
- T-NFR-001

## Description
Build the Content Library page as a sortable data table with performance metrics. Columns: title, agent, platform, lifecycle state, alignment score, integrity score, audience quality score, cluster tag, published date. Support sorting, filtering by state/agent/platform, and expandable rows.

Reference: specs/04-information-architecture.md §3.4, specs/01-product-spec.md §5.3 Library.

## Acceptance Criteria
- Data table rendering all content items for workspace
- Sortable columns: title, scores, date, state
- Filterable by lifecycle state, agent, platform (uses global filters from T-CORE-005)
- Expandable row or click-to-drill-down to post analysis (T-CONTENT-005)
- Sticky filter bar at top
- Performance metrics displayed inline
- Loading and empty states

## Technical Notes
- Reuse `src/components/data-table/` components
- Server-side data fetching with pagination
- Score columns color-coded per threshold (specs/06-kpi-definitions.md §8)
- Split-view only on desktop (specs/04-information-architecture.md §3.4)
- Right slide panel optional for post analysis (desktop)

## Definition of Done
- Requirement satisfied: REQ-CONTENT-002
- Type-safe
- No console errors
- UI follows shared UI primitives rules
- Responsive layout
