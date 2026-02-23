# Task ID: T-NFR-007

## Title
Idempotent Post Metrics Ingestion

## Area
NFR

## Requirement IDs
- REQ-NFR-005

## Depends On
- T-CONTENT-002
- T-CORE-011

## Description
Implement idempotent ingestion handling for post metrics using `(post_id, snapshot_date)` uniqueness and safe upsert semantics.

## Acceptance Criteria
- Ingestion checks existing record by post and snapshot date
- Existing rows updated only by newer snapshot policy
- Partial metric updates preserve non-null existing values
- Duplicate batches do not create duplicate metrics
- Ingestion update events are audited

## Technical Notes
- Use transactional upsert pattern
- Validate incoming values (non-negative metrics, valid rates)
- Support backfill mode without blocking dashboard
- Trigger incremental KPI recompute only for impacted ranges

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Audit event recorded for ingestion updates
