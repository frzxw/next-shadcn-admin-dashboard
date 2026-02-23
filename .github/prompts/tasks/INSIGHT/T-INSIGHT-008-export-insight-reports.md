# Task ID: T-INSIGHT-008

## Title
Export Insight Reports

## Area
INSIGHT

## Requirement IDs
- REQ-INSIGHT-007

## Depends On
- T-INSIGHT-002
- T-INSIGHT-001

## Description
Implement export functionality for insight reports. Allow users to export KPI data, chart data, and summary reports as CSV or PDF. Export button as Tier 3 contextual tool in the Insights page header.

Reference: specs/02-requirements.md REQ-INSIGHT-007, specs/04-information-architecture.md §3 (Tier 3 tools).

## Acceptance Criteria
- Export button in Insights page toolbar
- CSV export: KPI snapshots for selected date range + agent
- PDF export: summary report with key metrics and mini-charts (optional for MVP)
- Export respects current filters (agent, date range)
- Download triggered client-side
- Permission: Creator + Editor + Analyst (all except Viewer)

## Technical Notes
- Server action generates export data
- CSV generation server-side for large datasets
- PDF generation optional (can use client-side lib or server-side)
- Rate-limit exports to prevent abuse
- Audit log for export actions

## Definition of Done
- Requirement satisfied: REQ-INSIGHT-007
- Type-safe
- No console errors
- Server-side permission enforcement present
