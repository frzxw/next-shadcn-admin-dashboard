# Task ID: T-ASSET-003

## Title
Asset Library UI with Search & Tags

## Area
ASSET

## Requirement IDs
- REQ-ASSET-001

## Depends On
- T-ASSET-002
- T-CORE-003

## Description
Build the Assets page with Media Vault tab: a grid/gallery view of workspace assets with tag-based filtering, search, and upload functionality. Support grid or list view toggle. Each asset shows thumbnail, tags, and agent association.

Reference: specs/01-product-spec.md §5.7 Media Vault.

## Acceptance Criteria
- Grid gallery of assets with thumbnails
- Search bar (search by name, tags)
- Tag filter chips
- Upload button (role-gated for Creator+Editor)
- List/grid view toggle
- Asset click opens detail view with metadata
- Agent filter
- Loading/empty states

## Technical Notes
- Tier 2 tabs: Media Vault, Brand Kit, Reference Library, Prompt History
- Reuse shared UI components
- Pagination or infinite scroll for large asset libraries
- Thumbnails loaded lazily for performance

## Definition of Done
- Requirement satisfied: REQ-ASSET-001
- Type-safe
- No console errors
- UI follows shared UI primitives rules
