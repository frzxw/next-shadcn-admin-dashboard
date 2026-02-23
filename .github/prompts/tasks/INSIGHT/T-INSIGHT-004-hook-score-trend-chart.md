# Task ID: T-INSIGHT-004

## Title
Hook Score Trend Chart

## Area
INSIGHT

## Requirement IDs
- REQ-INSIGHT-003

## Depends On
- T-INSIGHT-002
- T-CONTENT-002

## Description
Build a hook score trend visualization showing hook_score over time for agent's posts. Displays as a line or bar chart with trend line. Highlight posts with notably high or low hook scores.

Reference: specs/01-product-spec.md §5.5, specs/04-information-architecture.md §3.5 Row 2.

## Acceptance Criteria
- Line/bar chart: hook_score per post over time
- Trend line overlay
- Threshold markers for good/poor hook performance
- Hover tooltips with post title + score
- Configurable date range
- Consistent chart styling

## Technical Notes
- Data from post_analysis.hook_score
- Pre-aggregated server-side
- 4-col card in insights bento (Row 2)
- Chart rendering < 300ms

## Definition of Done
- Requirement satisfied: REQ-INSIGHT-003
- Type-safe
- No console errors
- Chart accessible via table fallback
