# Task ID: T-CAL-004

## Title
Recurring Posting Slot Management

## Area
CAL

## Requirement IDs
- REQ-CAL-003

## Depends On
- T-CAL-002
- T-CAL-003

## Description
Build the UI for managing recurring posting slots per agent. Slots define the regular posting rhythm (e.g., Monday 10am on Instagram). Slots appear as ghost items on the calendar. Users can fill slots with content or leave them as scheduling suggestions.

Reference: specs/01-product-spec.md §5.4.

## Acceptance Criteria
- Recurring slot management panel (within Calendar settings or Cadence tab)
- Create slot: agent, day_of_week, time, platform
- Edit/delete existing slots
- Slots render as ghost/placeholder items on calendar views
- Slots generate suggested schedule dates when creating new content
- Active/inactive toggle per slot

## Technical Notes
- recurring_slots table from T-CAL-001
- Ghost items are visual only; they become real content_items when filled
- Zod validation
- Permission: Creator + Editor

## Definition of Done
- Requirement satisfied: REQ-CAL-003
- Type-safe
- No console errors
- UI follows shared UI primitives rules
