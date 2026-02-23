# Task ID: T-AUDIT-007

## Title
Content Mutation Audit Logging

## Area
AUDIT

## Requirement IDs
- REQ-AUDIT-001

## Depends On
- T-AUDIT-001
- T-CONTENT-003

## Description
Implement audit logging for content mutations: draft create, update, schedule, publish, archive, delete (if enabled), and manual metric overrides.

## Acceptance Criteria
- All content mutation actions create audit entries
- Publish events include post_id and platform metadata
- Schedule changes include previous/new scheduled timestamp
- Archive events include reason where provided
- Manual overrides explicitly flagged in metadata

## Technical Notes
- Integrate in content server actions
- Ensure workspace and actor identity attached
- Avoid logging large content bodies; use hashes/summaries where needed
- Keep action types standardized for analytics

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Audit event recorded for content mutations
