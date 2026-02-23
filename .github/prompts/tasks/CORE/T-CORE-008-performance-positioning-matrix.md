# Task ID: T-CORE-008

## Title
Performance vs Positioning Matrix Visualization

## Area
CORE

## Requirement IDs
- REQ-CORE-004

## Depends On
- T-CORE-006
- T-INSIGHT-001

## Description
Implement the Performance vs Positioning matrix chart for the Home dashboard. This is a scatter/quadrant chart plotting agents by performance metrics (Y axis) against positioning/alignment metrics (X axis). Each agent is a point/bubble. Quadrant lines divide the space into strategic zones.

Reference: specs/01-product-spec.md §5.1, specs/04-information-architecture.md §3.2 Row 3.

## Acceptance Criteria
- Matrix renders as scatter/quadrant chart (8-col card on desktop)
- Agents plotted as labeled points
- Quadrant lines with labels (High Perf/High Align, High Perf/Low Align, etc.)
- Hover tooltips on each agent point
- Matrix converts to vertical list with quadrant badge on mobile
- Consistent chart color palette (specs/16-design-system-alignment.md §7)
- Axis labels present

## Technical Notes
- Pre-aggregate data server-side — no large dataset transforms in browser
- Chart must have consistent tooltip style
- Avoid excessive gridlines
- Maximum 6 major charts per page rule respected
- Data from agent_kpi_snapshots table

## Definition of Done
- Requirement satisfied: REQ-CORE-004
- Type-safe
- No console errors
- Chart accessible via table fallback (accessibility)
- Responsive mobile fallback
