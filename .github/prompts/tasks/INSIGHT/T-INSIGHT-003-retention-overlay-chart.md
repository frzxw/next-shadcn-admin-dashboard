# Task ID: T-INSIGHT-003

## Title
Retention Overlay Chart Component

## Area
INSIGHT

## Requirement IDs
- REQ-INSIGHT-002

## Depends On
- T-INSIGHT-002
- T-CONTENT-002

## Description
Build the retention overlay chart: a line chart comparing retention curves across multiple posts for a selected agent. Supports overlaying 3–5 posts simultaneously. Highlights structural drop-off points. If retention curve unavailable, show completion rate.

Reference: specs/01-product-spec.md §5.5, specs/06-kpi-definitions.md §2.2.

## Acceptance Criteria
- Line chart with time axis (seconds) and retention percentage axis
- Overlay multiple post retention curves (selectable)
- Drop-off point annotations visible
- Configurable post selection
- Fallback to completion rate bar chart if no retention data
- Hover tooltips on data points
- Axis labels, consistent date formatting

## Technical Notes
- Data from post_metrics (watch_time, completion_rate) and post_analysis (retention_drop_annotations)
- Pre-aggregate server-side, return ready-to-plot series
- Chart rendering < 300ms
- Consistent chart color palette (specs/16-design-system-alignment.md §7)

## Definition of Done
- Requirement satisfied: REQ-INSIGHT-002
- Type-safe
- No console errors
- Chart accessible via table fallback
