# Task ID: T-ASSET-007

## Title
Asset-Post Performance Linking

## Area
ASSET

## Requirement IDs
- REQ-ASSET-005

## Depends On
- T-ASSET-001
- T-CONTENT-001
- T-CONTENT-002

## Description
Implement linking between assets and posts to correlate asset usage with post performance. Track which assets were used in which posts and surface performance data on asset detail views.

Reference: specs/01-product-spec.md §5.7.

## Acceptance Criteria
- `post_assets` junction table: post_id, asset_id
- Assets can be linked to posts via content editing or post publishing
- Asset detail view shows linked posts with performance metrics
- Performance summary: avg engagement, best performing post using this asset
- API to query assets by performance

## Technical Notes
- Many-to-many relation between posts and assets
- Performance data sourced from post_metrics
- Feeds into visual consistency analysis (which assets performed best)
- Server action for linking/unlinking

## Definition of Done
- Requirement satisfied: REQ-ASSET-005
- Type-safe
- No console errors
