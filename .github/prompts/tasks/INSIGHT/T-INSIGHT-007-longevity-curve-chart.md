# Task ID: T-INSIGHT-007

## Title
Longevity Curve Chart

## Area
INSIGHT

## Requirement IDs
- REQ-INSIGHT-006

## Depends On
- T-INSIGHT-002
- T-CONTENT-002

## Description
Build a longevity curve chart showing the tail performance of content over 7/14/30 day windows. Displays how views accumulate post-publish, indicating evergreen vs flash-in-the-pan content. Supports comparison between posts.

Reference: specs/06-kpi-definitions.md §3.4 (Longevity Index).

## Acceptance Criteria
- Line chart showing cumulative views at 7d, 14d, 30d post-publish
- Multi-post overlay for comparison
- Longevity index score displayed (views_after_30d / views_first_7d)
- Suppress for posts < 30 days old
- Hover tooltips
- Date range filtering

## Technical Notes
- Data from post_metrics time-series snapshots
- Longevity Index normalized to 0–100 (specs/06-kpi-definitions.md §3.4)
- 6-col card in insights bento
- Pre-aggregated server-side

## Definition of Done
- Requirement satisfied: REQ-INSIGHT-006
- Type-safe
- No console errors
- Chart accessible via table fallback
