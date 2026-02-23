# Task ID: T-MEMORY-007

## Title
Error-to-Post/Insight Linking Service

## Area
MEMORY

## Requirement IDs
- REQ-MEMORY-006

## Depends On
- T-MEMORY-005
- T-CONTENT-002
- T-INSIGHT-001

## Description
Implement linking between mistakes/errors and the posts and insights that surfaced them. When a mistake is detected from a post's scoring anomaly or insight threshold breach, the link is recorded for drill-down navigation.

Reference: specs/08-memory-system.md §7, specs/02-requirements.md REQ-MEMORY-006.

## Acceptance Criteria
- Mistake records linked to source post_id
- Mistake records linked to triggering insight/KPI anomaly
- Navigation: mistake → post drill-down
- Navigation: post drill-down → related mistakes
- Impact analysis: mistakes linked to performance delta

## Technical Notes
- mistakes.post_id FK to posts
- Additional metadata field for insight_reference (jsonb)
- Bidirectional navigation in UI
- Linking occurs during auto-detection or manual assignment

## Definition of Done
- Requirement satisfied: REQ-MEMORY-006
- Type-safe
- No console errors
