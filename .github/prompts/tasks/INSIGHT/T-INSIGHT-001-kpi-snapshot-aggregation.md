# Task ID: T-INSIGHT-001

## Title
KPI Snapshot Schema & Aggregation Service

## Area
INSIGHT

## Requirement IDs
- REQ-INSIGHT-001

## Depends On
- T-CORE-001
- T-AGENT-001
- T-CONTENT-002

## Description
Create the `agent_kpi_snapshots` table and build the aggregation service that computes daily KPI rollups per agent: growth_rate, avg_retention, loyalty_index, compounding_score, saturation_index, integrity_avg, alignment_avg. Service reads from post_metrics and post_analysis, writes precomputed snapshots.

Reference: specs/05-data-model.md §7.1, specs/06-kpi-definitions.md §2–§3.

## Acceptance Criteria
- `agent_kpi_snapshots` table: id, agent_id, snapshot_date, growth_rate, avg_retention, loyalty_index, compounding_score, saturation_index, integrity_avg, alignment_avg, created_at
- Index on (agent_id, snapshot_date)
- Aggregation service computes all KPIs per specs/06-kpi-definitions.md formulas
- Service handles edge cases: division-by-zero, insufficient data, new agents
- Triggered daily or on new post ingestion
- KPIs versioned if formula changes (specs/06-kpi-definitions.md §7)

## Technical Notes
- Located at `src/server/services/analytics/`
- Pre-aggregation avoids expensive dashboard queries (specs/13-performance-budget.md §5.1)
- Rolling windows for growth_rate (30-day), retention (configurable range)
- Do not recompute entire history unless backfill (specs/18-analytics-ingestion-spec.md §7)
- Server-only module

## Definition of Done
- Requirement satisfied: REQ-INSIGHT-001
- Type-safe
- No console errors
- KPI formulas match specs/06-kpi-definitions.md
- Edge cases handled (no NaN, no infinite)
