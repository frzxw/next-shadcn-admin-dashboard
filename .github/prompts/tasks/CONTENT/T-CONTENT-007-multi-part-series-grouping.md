# Task ID: T-CONTENT-007

## Title
Multi-Part Series Grouping

## Area
CONTENT

## Requirement IDs
- REQ-CONTENT-006

## Depends On
- T-CONTENT-001
- T-CONTENT-003

## Description
Implement multi-part series grouping for content items. Allow creators to group related content into series (arcs, frameworks, sequential topics). Series have a name, description, ordering, and completion tracking. Calendar integration point for scheduling series sequentially.

Reference: specs/01-product-spec.md §5.3 Series.

## Acceptance Criteria
- `content_series` table: id, agent_id, name, description, created_at
- `content_series_items` junction: series_id, content_item_id, order_index
- CRUD server actions for series management
- Series UI: create series, add/reorder items, track completion percentage
- Series visible in content library as grouping
- Calendar integration: series items schedulable as a batch

## Technical Notes
- Order_index allows drag-and-drop reordering
- Completion = published items / total items in series
- Creator + Editor can manage series
- Zod validation on inputs
- Audit logging for series mutations

## Definition of Done
- Requirement satisfied: REQ-CONTENT-006
- Type-safe
- No console errors
- Server-side permission enforcement present
- Audit event recorded
