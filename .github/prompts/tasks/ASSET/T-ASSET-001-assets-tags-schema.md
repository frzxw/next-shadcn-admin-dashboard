# Task ID: T-ASSET-001

## Title
Assets & Tags Database Schema

## Area
ASSET

## Requirement IDs
- REQ-ASSET-001

## Depends On
- T-CORE-001

## Description
Create database tables for the asset management system: `assets` (file_url, file_type, metadata jsonb) and `asset_tags` (tag labeling). Assets are workspace-scoped with optional agent association.

Reference: specs/05-data-model.md §9.

## Acceptance Criteria
- `assets` table: id, workspace_id, agent_id (nullable), file_url, file_type, metadata (jsonb), created_at
- `asset_tags` table: id, asset_id, tag
- Indexes on workspace_id, (asset_id, tag)
- Migration runs cleanly

## Technical Notes
- Assets are workspace-scoped, optionally agent-scoped
- Metadata stores dimensions, size, original filename, etc.
- File URL points to S3-compatible storage (actual upload in T-ASSET-002)
- Soft delete handled by status or archive flag

## Definition of Done
- Requirement satisfied: REQ-ASSET-001
- Type-safe ORM models
- Migration idempotent
