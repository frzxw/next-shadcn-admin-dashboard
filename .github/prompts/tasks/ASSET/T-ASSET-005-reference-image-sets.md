# Task ID: T-ASSET-005

## Title
Reference Image Set Management

## Area
ASSET

## Requirement IDs
- REQ-ASSET-003

## Depends On
- T-ASSET-002
- T-AGENT-001

## Description
Build reference image set management per agent. Allows defining sets of approved face images, poses, and lighting examples used as baselines for visual consistency. Sets are associated with an agent and used by the visual consistency engine and AI generation pipeline.

Reference: specs/12-visual-consistency-engine.md §10, specs/01-product-spec.md §5.7.

## Acceptance Criteria
- Create reference image set per agent
- Set categories: face, pose, lighting
- Upload and select images into sets from asset library
- View current reference sets on agent detail
- Permission: Creator only
- Sets used as baseline for visual consistency scoring (T-AGENT-009)

## Technical Notes
- Reference sets stored as relations: agent_id + asset_id + set_type
- May need `agent_reference_images` table
- Visual consistency engine reads these for baseline (Phase 2 computation)
- Audit log for reference set changes

## Definition of Done
- Requirement satisfied: REQ-ASSET-003
- Type-safe
- No console errors
- Server-side permission enforcement present
