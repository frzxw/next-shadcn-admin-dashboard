# Task ID: T-CONTENT-001

## Title
Content Items & Posts Database Schema

## Area
CONTENT

## Requirement IDs
- REQ-CONTENT-001
- REQ-CONTENT-004

## Depends On
- T-CORE-001
- T-AGENT-001

## Description
Create database tables for the content production pipeline: `content_items` (lifecycle states: idea → draft → review → scheduled → published → reviewed) and `posts` (published artifacts with platform + external ID). Includes campaign_id nullable FK and agent/platform associations.

Reference: specs/05-data-model.md §6.1, §6.2.

## Acceptance Criteria
- `content_items` table: id, agent_id, title, objective, lifecycle_state enum, scheduled_at, campaign_id, created_by, timestamps
- `posts` table: id, content_item_id, agent_id, platform, external_post_id, published_at, url, created_at
- Unique constraint on (platform, external_post_id)
- Indexes on agent_id, lifecycle_state for content_items
- Lifecycle state enum enforced at DB level
- Migration runs cleanly

## Technical Notes
- Content items are agent-scoped (specs/05-data-model.md §1)
- Post is a 0..1 relation from content_item (specs/05-data-model.md §14)
- Soft delete via lifecycle_state or separate status field (specs/05-data-model.md §15)
- campaign_id links to future campaigns table (T-CAL-005)

## Definition of Done
- Requirement satisfied: REQ-CONTENT-001, REQ-CONTENT-004
- Type-safe ORM models
- No console errors
- Migration idempotent
