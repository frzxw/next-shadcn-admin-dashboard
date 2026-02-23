# Task ID: T-CORE-011

## Title
SPIKE — Analytics Ingestion Source Strategy

## Area
CORE

## Requirement IDs
- None (resolves OQ-002)

## Depends On
- None

## Description
Research and decide on analytics ingestion strategy for MVP. Determine which sources power retention and engagement metrics: manual entry, CSV upload, and/or API connectors. Document the normalized metrics schema mapping, freshness targets, and connector architecture.

Reference: specs/18-analytics-ingestion-spec.md, specs/02-requirements.md OQ-002.

## Acceptance Criteria
- Decision document produced with: MVP ingestion sources, normalization rules, freshness targets
- Manual entry + CSV upload confirmed for MVP (or alternative)
- Normalized metrics schema reviewed against specs/18-analytics-ingestion-spec.md §4
- Platform connector architecture sketched for Phase 2
- Decision unblocks T-NFR-007 and T-INSIGHT-001

## Technical Notes
- MVP likely manual + CSV (specs/18-analytics-ingestion-spec.md §2)
- Idempotency rules must be defined (specs/18-analytics-ingestion-spec.md §5)
- Data freshness: immediate for manual, daily for API (specs/18-analytics-ingestion-spec.md §10)

## Definition of Done
- Decision document committed
- Ingestion sources identified
- No implementation required — research only
