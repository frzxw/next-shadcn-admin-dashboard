# Task ID: T-CAL-001

## Title
Calendar Scheduling Schema Extensions

## Area
CAL

## Requirement IDs
- REQ-CAL-001
- REQ-CAL-003
- REQ-CAL-005

## Depends On
- T-CONTENT-001

## Description
Extend the content data model with calendar-specific tables: `campaigns` (themed groupings), `recurring_slots` (repeating schedule templates). The content_items table already has scheduled_at and campaign_id from T-CONTENT-001.

Reference: specs/05-data-model.md §6.1, specs/01-product-spec.md §5.4.

## Acceptance Criteria
- `campaigns` table: id, workspace_id, name, description, start_date, end_date, created_at
- `recurring_slots` table: id, agent_id, day_of_week, time, platform, is_active, created_at
- campaign_id FK on content_items references campaigns
- Migration runs cleanly
- Indexes on workspace_id for campaigns

## Technical Notes
- Campaigns are workspace-scoped, not agent-scoped
- Recurring slots are agent-scoped
- Slots define posting rhythm for cadence health indicators

## Definition of Done
- Requirement satisfied: REQ-CAL-001, REQ-CAL-003, REQ-CAL-005
- Type-safe ORM models
- Migration idempotent
