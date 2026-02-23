# Task ID: T-AI-005

## Title
Outline Generation Contract & Schema

## Area
AI

## Requirement IDs
- REQ-AI-002

## Depends On
- T-AI-001

## Description
Define typed contracts and zod schemas for outline generation.

## Acceptance Criteria
- Request includes topic, objective, duration_target, audience_level
- Response includes ordered outline sections with title, description, estimated_seconds
- Schema validates audience_level enum
- Contract exported for server action and UI

## Technical Notes
- Keep strict structural output schema
- Include trace typing compatibility
- Avoid free-form unvalidated output

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
