# Task ID: T-INSIGHT-002

## Title
Insights Page Bento Layout

## Area
INSIGHT

## Requirement IDs
- REQ-INSIGHT-001

## Depends On
- T-CORE-003
- T-CORE-007
- T-NFR-001

## Description
Build the Insights page as bento grid layout with asymmetrical hierarchy. Row 1: KPI Strip. Row 2: Retention Overlay (8-col) + Hook Trend (4-col). Row 3: Audience Funnel (6-col) + Loyalty Trend (6-col). Row 4: Idea Clusters (6-col) + Longevity Curve (6-col). Each card accepts loading/error/empty states.

Reference: specs/04-information-architecture.md §3.5.

## Acceptance Criteria
- Bento grid with 4 rows matching spec layout
- Reuses KPI strip from T-CORE-007
- Chart placeholder cards with loading states
- Tier 2 tabs: Performance, Positioning, Audience Quality, Compounding, Longevity, Matrix
- Max 6 tabs visible, scrollable if overflow
- Active tab persisted in URL
- Responsive: 12-col desktop → stacked mobile

## Technical Notes
- Server component shell
- Chart data loaded per-chart (parallel fetching)
- Performance budget: fully interactive < 3s (specs/13-performance-budget.md §3.1)
- No heavy chart transforms client-side

## Definition of Done
- Requirement satisfied: REQ-INSIGHT-001
- Type-safe
- No console errors
- UI follows shared UI primitives rules
