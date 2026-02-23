# Task ID: T-AGENT-007

## Title
Persona Integrity Score Tracking & Trend

## Area
AGENT

## Requirement IDs
- REQ-AGENT-003

## Depends On
- T-AGENT-006
- T-INSIGHT-001
- T-AI-013

## Description
Implement the persona integrity score tracking and trend visualization per agent. Display the integrity score over time as a line chart on the Agent Overview. Data sourced from post_analysis (per-post scores) and agent_kpi_snapshots (rolling averages). Highlight threshold breaches.

Reference: specs/06-kpi-definitions.md §2.5, specs/04-information-architecture.md §3.3 Row 2.

## Acceptance Criteria
- Line chart showing integrity_score over time (daily or per-post)
- Threshold lines: warning (<75) and critical (<60) per specs/06-kpi-definitions.md §8
- Current score displayed as large KPI number
- Trend arrow (improving/declining/stable)
- Tooltip on hover showing score + date + post reference
- "Low Data" state for agents < 7 days

## Technical Notes
- Data from agent_kpi_snapshots.integrity_avg and post_analysis.integrity_score
- Pre-aggregated server-side
- Chart rendering < 300ms (specs/13-performance-budget.md §4.2)
- Score formula: 0.45 * voice + 0.35 * stance + 0.20 * style (specs/06-kpi-definitions.md §2.5)

## Definition of Done
- Requirement satisfied: REQ-AGENT-003
- Type-safe
- No console errors
- Chart accessible via table fallback
