# Task ID: T-AI-016

## Title
Weekly Strategic Summary Server Action

## Area
AI

## Requirement IDs
- REQ-AI-007

## Depends On
- T-AI-015
- T-AI-001
- T-AUDIT-003

## Description
Implement server action to generate weekly strategic recommendations from KPI and experiment context.

## Acceptance Criteria
- Session/permission checks for allowed roles
- Input assembled from snapshot and experiment services
- Structured output returned per contract
- Streaming support optional for longer summaries
- Audit logged with trace metadata

## Technical Notes
- Use high-capability generation model route
- Include memory and prevention rule context where relevant
- Handle provider failures with safe fallback

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Server-side permission enforcement present
- Audit event recorded
