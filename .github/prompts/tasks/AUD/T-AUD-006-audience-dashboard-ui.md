# Task ID: T-AUD-006

## Title
Audience Intelligence Dashboard UI

## Area
AUD

## Requirement IDs
- REQ-AUD-001
- REQ-AUD-002
- REQ-AUD-004

## Depends On
- T-AUD-001
- T-AUD-002
- T-AUD-004
- T-CORE-003

## Description
Build the Audience page with Tier 2 tabs: Segments, Loyalty, Behavior, Feedback. Display new vs returning segment breakdown, loyalty index trend, comment depth distribution, feedback theme clusters with sentiment, and AI-complaint indicators.

Reference: specs/01-product-spec.md §5.6, specs/04-information-architecture.md §2.

## Acceptance Criteria
- Segments tab: pie/bar chart of new vs returning vs high_depth vs trend_traffic
- Loyalty tab: loyalty index trend chart + current value
- Behavior tab: comment depth distribution, engagement depth metrics
- Feedback tab: theme cluster cards with sentiment badges + occurrence counts
- AI complaint badge visible if detected
- Agent-scoped, filtered by global context
- Loading/empty states on all cards
- Responsive

## Technical Notes
- Data from audience_segments, audience_feedback_clusters, agent_kpi_snapshots
- Bento layout cards
- Charts pre-aggregated server-side
- Tabs max 6, persisted in URL (specs/04-information-architecture.md §2)

## Definition of Done
- Requirement satisfied: REQ-AUD-001, REQ-AUD-002, REQ-AUD-004
- Type-safe
- No console errors
- UI follows shared UI primitives rules
