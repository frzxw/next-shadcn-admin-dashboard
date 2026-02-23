# Task ID: T-AUD-004

## Title
Feedback Theme Detection Service

## Area
AUD

## Requirement IDs
- REQ-AUD-004

## Depends On
- T-AUD-001
- T-AUD-003

## Description
Build a service that detects repeated audience feedback themes across an agent's posts. Clusters comment themes, tracks occurrence counts, and surfaces trending positive or negative feedback patterns.

Reference: specs/01-product-spec.md §5.6 Feedback.

## Acceptance Criteria
- Feedback themes identified from comment depth analysis output
- Themes stored in audience_feedback_clusters with occurrence counts and sentiment
- Recurring themes highlighted (occurrence > threshold)
- Trend detection: new vs growing vs declining themes
- Data feeds into audience dashboard (T-AUD-006)

## Technical Notes
- Leverages AI comment analysis output themes array
- Clustering may use simple frequency + similarity (MVP) or AI clustering
- Updated on new comment analysis runs
- Agent-scoped

## Definition of Done
- Requirement satisfied: REQ-AUD-004
- Type-safe
- No console errors
