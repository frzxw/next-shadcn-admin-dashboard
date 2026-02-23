# Task ID: T-INSIGHT-006

## Title
Idea Cluster Bubble Chart

## Area
INSIGHT

## Requirement IDs
- REQ-INSIGHT-005

## Depends On
- T-INSIGHT-002
- T-CONTENT-006

## Description
Build an idea cluster bubble chart showing content topic clusters as bubbles. Bubble size = number of posts in cluster, color intensity = average performance. Clusters labeled with theme names. Interactive: click to drill into cluster details.

Reference: specs/01-product-spec.md §5.5, specs/04-information-architecture.md §3.2 Row 4, §3.5 Row 4.

## Acceptance Criteria
- Bubble chart: one bubble per idea cluster
- Size proportional to post count in cluster
- Color encodes performance (green = high, yellow = medium, red = low)
- Labels displayed on bubbles
- Click navigates to cluster detail / filtered content library
- Hover tooltip: cluster name, post count, avg performance
- Saturation index overlay if > 60 (warning coloring)

## Technical Notes
- Data from idea_clusters + post_analysis aggregation
- Compounding and saturation scores relevant (specs/06-kpi-definitions.md §3.1, §3.2)
- Pre-aggregated server-side
- 6-col card in insights bento

## Definition of Done
- Requirement satisfied: REQ-INSIGHT-005
- Type-safe
- No console errors
- Chart accessible via table fallback
