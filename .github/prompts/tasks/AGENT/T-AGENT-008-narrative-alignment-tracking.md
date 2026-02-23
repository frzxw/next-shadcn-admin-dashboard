# Task ID: T-AGENT-008

## Title
Narrative Alignment Score Tracking & Trend

## Area
AGENT

## Requirement IDs
- REQ-AGENT-004

## Depends On
- T-AGENT-006
- T-INSIGHT-001
- T-AI-012

## Description
Implement narrative alignment score tracking and trend per agent. Display alignment over time as a line chart. Data sourced from post_analysis (per-post) and agent_kpi_snapshots (rolling average). Highlight drift events when score drops below threshold.

Reference: specs/06-kpi-definitions.md §2.4, specs/04-information-architecture.md §3.3 Row 2.

## Acceptance Criteria
- Line chart showing alignment_score over time
- Threshold lines: warning (<70) and critical (<55)
- Current score as large KPI number
- Drift indicators for posts below threshold
- Matched pillar label displayed for each scored post
- Trend arrow

## Technical Notes
- Data from post_analysis.alignment_score and agent_kpi_snapshots.alignment_avg
- Score formula: 0.7 * max_pillar_similarity + 0.3 * avg_top3 - drift_penalty
- alignment_model_version must be stored (specs/06-kpi-definitions.md §2.4)
- Pre-aggregated server-side

## Definition of Done
- Requirement satisfied: REQ-AGENT-004
- Type-safe
- No console errors
- Chart accessible via table fallback
