# Task ID: T-INSIGHT-005

## Title
Audience Funnel Visualization

## Area
INSIGHT

## Requirement IDs
- REQ-INSIGHT-004

## Depends On
- T-INSIGHT-002
- T-AUD-001

## Description
Build the audience funnel visualization showing the conversion path: Impressions → Views → Engagement → Follows → Returning Viewers. Each stage displays volume and conversion percentage. Funnel narrows proportionally.

Reference: specs/01-product-spec.md §5.5, specs/04-information-architecture.md §3.2 Row 4.

## Acceptance Criteria
- Funnel chart with stages: Impressions → Views → Engagement → Follows → Returning
- Each stage: absolute number + conversion % from previous stage
- Proportional narrowing
- Hover tooltips
- Date range filtering
- Agent-scoped data
- Loading/empty states

## Technical Notes
- Data aggregated from post_metrics
- Pre-computed server-side
- 6-col card in insights bento
- Uses semantic color tokens

## Definition of Done
- Requirement satisfied: REQ-INSIGHT-004
- Type-safe
- No console errors
- Chart accessible via table fallback
