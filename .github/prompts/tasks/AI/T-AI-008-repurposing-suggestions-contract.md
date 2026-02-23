# Task ID: T-AI-008

## Title
Repurposing Suggestions Contract

## Area
AI

## Requirement IDs
- REQ-AI-003

## Depends On
- T-AI-001

## Description
Define contracts/schemas for AI repurposing suggestions across formats/platforms.

## Acceptance Criteria
- Request schema includes source content, target platforms/formats, objective
- Response schema includes ranked suggestions with rationale
- Output structure validated and typed
- Contract reused by action and UI

## Technical Notes
- Keep output deterministic with explicit fields
- Include trace metadata typing
- Validate target platform enum values

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
