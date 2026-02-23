# Task ID: T-AUD-001

## Title
Audience Segments Schema & Service

## Area
AUD

## Requirement IDs
- REQ-AUD-001

## Depends On
- T-CORE-001
- T-AGENT-001

## Description
Create database tables for audience segmentation: `audience_segments` (new, returning, high_depth, trend_traffic) and `audience_feedback_clusters` (theme detection). Build a service that computes segment breakdowns from post_metrics data.

Reference: specs/05-data-model.md §8.1, §8.2.

## Acceptance Criteria
- `audience_segments` table: id, agent_id, segment_type (new|returning|high_depth|trend_traffic), size_estimate, created_at
- `audience_feedback_clusters` table: id, agent_id, theme_label, sentiment_score, occurrence_count, created_at
- Service computes new vs returning viewer segmentation from post_metrics.returning_viewer_pct
- Segments updated on post_metrics ingestion
- Migration runs cleanly

## Technical Notes
- Segments are agent-scoped
- returning_viewer_pct from platform data or proxy (specs/06-kpi-definitions.md §2.3)
- Feedback clusters populated by AI analysis (T-AUD-004)
- Index on agent_id

## Definition of Done
- Requirement satisfied: REQ-AUD-001
- Type-safe ORM models
- No console errors
- Migration idempotent
