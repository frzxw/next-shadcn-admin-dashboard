# Task ID: T-AI-011

## Title
Scoring Contracts (Alignment, Integrity, Audience)

## Area
AI

## Requirement IDs
- REQ-AI-004
- REQ-AI-005
- REQ-AI-006

## Depends On
- T-AI-001

## Description
Define zod contracts and types for narrative alignment, persona integrity, and audience quality scoring requests/responses.

## Acceptance Criteria
- Alignment request/response schema implemented
- Integrity request/response schema implemented
- Audience quality request/response schema implemented
- Score ranges validated (0–100)
- Trace metadata typing shared across all scoring responses

## Technical Notes
- Scoring models should use deterministic settings
- Include model_version in score payload typing
- Keep contracts versioned and reusable

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
