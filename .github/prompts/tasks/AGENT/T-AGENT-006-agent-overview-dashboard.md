# Task ID: T-AGENT-006

## Title
Agent Overview Bento Dashboard

## Area
AGENT

## Requirement IDs
- REQ-AGENT-003
- REQ-AGENT-004

## Depends On
- T-AGENT-003
- T-CORE-007
- T-NFR-001

## Description
Build the Agent Overview tab as a bento dashboard. Layout: Row 1 (Agent Header Card — name, status, integrity score), Row 2 (Persona Integrity Trend 6-col + Narrative Alignment Trend 6-col), Row 3 (Visual Consistency 6-col + Voice Consistency 6-col), Row 4 (Mistake Recurrence 4-col + Top Prevention Rules 4-col + Audience Loyalty 4-col).

Reference: specs/04-information-architecture.md §3.3.

## Acceptance Criteria
- Agent Overview renders bento grid with 4 rows
- Agent header card shows name, status, current integrity score
- Trend chart slots for integrity + alignment (data from T-AGENT-007, T-AGENT-008)
- Consistency metric slots (data from T-AGENT-009, T-AGENT-010)
- Mistake + prevention + loyalty summary slots
- Cards accept loading/error/empty states
- Responsive: 12-col desktop → stacked mobile

## Technical Notes
- Server component shell with interactive chart widgets
- Reuse KPI strip pattern for header card
- Charts require precomputed series from agent_kpi_snapshots
- Hover tooltips on all charts
- "View Details" drill-down action on each card

## Definition of Done
- Requirement satisfied: REQ-AGENT-003, REQ-AGENT-004
- Type-safe
- No console errors
- UI follows shared UI primitives rules
- Responsive layout verified
