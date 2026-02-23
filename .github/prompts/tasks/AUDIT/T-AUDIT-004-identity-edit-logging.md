# Task ID: T-AUDIT-004

## Title
Identity Edit Audit with Diff Hash

## Area
AUDIT

## Requirement IDs
- REQ-AUDIT-002

## Depends On
- T-AUDIT-001
- T-AGENT-004

## Description
Log identity file edits (SOUL, IDENTITY, USER, MEMORY durable) with previous/new version IDs and diff hash metadata.

## Acceptance Criteria
- Identity edits create audit events with actor, file_type, previous_version_id, new_version_id, diff_hash
- Optional structured diff summary stored
- Audit write failure blocks critical identity mutation
- History query supports per-agent file change timeline
- No raw secrets included in metadata

## Technical Notes
- Hook into identity save transaction
- Compute diff hash deterministically
- Ensure ordering with file version creation
- Works for creator-only and conditional USER edits

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Audit event recorded for identity mutations
