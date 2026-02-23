# Task ID: T-CAL-005

## Title
Campaign Grouping & UI

## Area
CAL

## Requirement IDs
- REQ-CAL-005

## Depends On
- T-CAL-001
- T-CAL-003

## Description
Build campaign management UI allowing creators to group calendar items into themed campaigns (product launches, seasonal arcs, themed content blocks). Campaign view on calendar highlights grouped items. Campaign detail view shows status and progress.

Reference: specs/01-product-spec.md §5.4 Campaign Management.

## Acceptance Criteria
- Campaign list view (Campaigns tab under Calendar)
- Campaign creation: name, description, date range
- Assign content items to campaigns
- Calendar items color-coded or badged by campaign
- Campaign detail: items list, progress (scheduled/published counts)
- Campaign filter on calendar view

## Technical Notes
- Campaigns are workspace-scoped
- Content items linked via campaign_id
- CRUD via T-CAL-002 actions
- Suggested use cases: themed arcs, product launches, seasonal planning

## Definition of Done
- Requirement satisfied: REQ-CAL-005
- Type-safe
- No console errors
- UI follows shared UI primitives rules
