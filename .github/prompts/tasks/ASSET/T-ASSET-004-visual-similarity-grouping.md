# Task ID: T-ASSET-004

## Title
Visual Similarity Grouping Service

## Area
ASSET

## Requirement IDs
- REQ-ASSET-002

## Depends On
- T-ASSET-001

## Description
Implement visual similarity grouping for assets. Uses embedding-based similarity to group visually similar images together. Enables creators to identify visual consistency or detect unintended variations across their asset library.

Reference: specs/01-product-spec.md §5.7 Media Vault.

## Acceptance Criteria
- Service computes visual embeddings for image assets
- Groups assets by embedding similarity (configurable threshold)
- Similarity groups displayed in asset library
- Manual override: merge or split groups
- Works for image assets only (not video MVP)

## Technical Notes
- Visual embeddings reuse same infrastructure as visual consistency engine (Phase 2)
- For MVP: can use simple perceptual hash or deferred to Phase 2 with placeholder
- If Phase 2: create the interface/contract now, implementation later
- Async processing (don't block upload)

## Definition of Done
- Requirement satisfied: REQ-ASSET-002
- Type-safe interfaces defined
- No console errors
