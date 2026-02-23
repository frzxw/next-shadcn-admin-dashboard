# Task ID: T-CAL-006

## Title
Posting Cadence Health Indicators

## Area
CAL

## Requirement IDs
- REQ-CAL-004

## Depends On
- T-CAL-003
- T-CAL-004
- T-INSIGHT-001

## Description
Implement posting cadence health indicators: consistency score (actual posts vs recurring slots), overposting alerts, strategic gap detection, and burnout risk. Display as a health card within the Cadence Health tab or as badges in calendar views.

Reference: specs/01-product-spec.md §5.4 Cadence Health.

## Acceptance Criteria
- Posting consistency score: actual_posts / expected_posts_from_slots
- Overposting detection: alerts when frequency significantly exceeds plan
- Strategic gap detection: identifies unfilled time periods
- Health indicators displayed per agent
- Warning/success colors per threshold
- Cadence Health tab or card in Calendar section

## Technical Notes
- Data computed from content_items (published/scheduled) vs recurring_slots
- Rollup computation server-side
- Can leverage agent_kpi_snapshots for historical cadence data
- Burnout detection heuristic: excessive daily posts over 7-day window

## Definition of Done
- Requirement satisfied: REQ-CAL-004
- Type-safe
- No console errors
- UI follows shared UI primitives rules
