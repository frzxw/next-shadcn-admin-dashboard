# Task ID: T-CAL-002

## Title
Calendar Server Actions

## Area
CAL

## Requirement IDs
- REQ-CAL-001
- REQ-CAL-002

## Depends On
- T-CAL-001
- T-CONTENT-003
- T-COLLAB-002

## Description
Implement server actions for calendar operations: schedule content (set scheduled_at + agent + platform), move items (update scheduled_at), assign agent/platform to scheduled content, manage campaigns and recurring slots. All actions check permissions and log audit events.

Reference: specs/03-architecture.md §3.2, specs/10-permissions-matrix.md §4.3.

## Acceptance Criteria
- `scheduleContent` action: set scheduled_at, agent, platform on content_item
- `moveScheduledContent` action: update scheduled_at (drag-and-drop support)
- `assignAgentPlatform` action: update agent/platform assignment
- `createCampaign` / `updateCampaign` actions
- `createRecurringSlot` / `updateRecurringSlot` / `deleteRecurringSlot` actions
- Permission: Creator + Editor (specs/10-permissions-matrix.md §4.3)
- Audit logging for all mutations

## Technical Notes
- Drag-and-drop in UI calls moveScheduledContent with new date/time
- Zod validation on all inputs
- Recurring slots generate suggested dates, not auto-create content
- Content item state must be appropriate for scheduling (draft → scheduled)

## Definition of Done
- Requirement satisfied: REQ-CAL-001, REQ-CAL-002
- Type-safe
- Server-side permission enforcement present
- Audit event recorded
