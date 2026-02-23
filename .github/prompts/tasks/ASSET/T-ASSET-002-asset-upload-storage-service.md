# Task ID: T-ASSET-002

## Title
Asset Upload & Storage Service

## Area
ASSET

## Requirement IDs
- REQ-ASSET-001

## Depends On
- T-ASSET-001

## Description
Implement the asset upload and storage service at `src/server/services/storage/storage.ts`. Handles file uploads to S3-compatible object storage, generates file_url, extracts basic metadata, and creates asset DB record with tags.

Reference: specs/03-architecture.md §5.2.

## Acceptance Criteria
- Upload endpoint/action accepts file + metadata + tags
- File stored in S3-compatible storage
- Asset record created in DB with file_url
- Basic metadata extracted (file type, size)
- Tags associated on upload
- Permission: Creator + Editor
- Audit log for uploads

## Technical Notes
- Storage adapter at `src/server/services/storage/storage.ts`
- Keep metadata in DB, binary in object storage (specs/03-architecture.md §5.2)
- File type validation (images, videos)
- Size limits enforced
- Zod validation on metadata/tags

## Definition of Done
- Requirement satisfied: REQ-ASSET-001
- Type-safe
- No console errors
- Server-side permission enforcement present
- Audit event recorded
