# Task ID: T-CONTENT-002

## Title
Post Metrics & Analysis Database Schema

## Area
CONTENT

## Requirement IDs
- REQ-CONTENT-002
- REQ-CONTENT-003

## Depends On
- T-CONTENT-001

## Description
Create database tables for post metrics (time-series aggregates) and post analysis (AI-derived scores). `post_metrics` stores snapshots of views, likes, comments, shares, saves, watch_time, returning_viewer_pct. `post_analysis` stores alignment_score, integrity_score, audience_quality_score, hook_score, retention_drop_annotations, idea_cluster_id, model_version.

Reference: specs/05-data-model.md §6.3, §6.4.

## Acceptance Criteria
- `post_metrics` table: post_id, snapshot_date, views, likes, comments, shares, saves, watch_time, returning_viewer_pct, created_at
- Index on (post_id, snapshot_date)
- `post_analysis` table: post_id, alignment_score, integrity_score, audience_quality_score, hook_score, retention_drop_annotations (jsonb), idea_cluster_id, model_version, created_at
- Migration runs cleanly

## Technical Notes
- post_metrics is time-series: multiple rows per post at different snapshot dates
- retention_drop_annotations is jsonb for flexible AI output
- model_version required per specs/06-kpi-definitions.md §7 and REQ-NFR-006
- idea_cluster_id nullable — links to future clustering entity

## Definition of Done
- Requirement satisfied: REQ-CONTENT-002, REQ-CONTENT-003
- Type-safe ORM models
- No console errors
- Migration idempotent
