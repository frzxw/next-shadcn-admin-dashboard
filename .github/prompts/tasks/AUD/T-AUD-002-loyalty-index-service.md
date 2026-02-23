# Task ID: T-AUD-002

## Title
Loyalty Index Computation Service

## Area
AUD

## Requirement IDs
- REQ-AUD-002

## Depends On
- T-AUD-001
- T-INSIGHT-001

## Description
Implement the loyalty index computation service. Formula: loyalty_index = 0.6 * returning_viewer_pct + 0.4 * repeat_engagement_rate. Integrated into the KPI snapshot aggregation pipeline. Produces per-agent loyalty trend data.

Reference: specs/06-kpi-definitions.md §3.3.

## Acceptance Criteria
- Loyalty index computed per agent per snapshot
- Formula matches spec: 0.6 * returning_viewer_pct + 0.4 * repeat_engagement_rate
- Stored in agent_kpi_snapshots.loyalty_index
- Handles missing data gracefully (null if insufficient)
- Trend data available for charting

## Technical Notes
- repeat_engagement_rate derived from post_metrics
- Integrated into T-INSIGHT-001 aggregation service
- Value normalized for display

## Definition of Done
- Requirement satisfied: REQ-AUD-002
- Type-safe
- No console errors
- Formula verified
