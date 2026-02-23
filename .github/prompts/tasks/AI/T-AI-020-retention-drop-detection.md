# Task ID: T-AI-020

## Title
Structural Retention Drop Cause Detection

## Area
AI

## Requirement IDs
- REQ-AI-010

## Depends On
- T-CONTENT-002
- T-AI-011
- T-AUDIT-003

## Description
Implement AI-assisted detection and annotation of structural retention drop causes from retention curves and post structure signals.

## Acceptance Criteria
- Detects significant drop points and generates cause annotations
- Stores annotations in `post_analysis.retention_drop_annotations`
- Supports drill-down consumption in post analysis UI
- Emits mistake/prevention candidate signals for repeated patterns
- Audit logged for scoring runs

## Technical Notes
- Use fallback when full retention curve unavailable
- Keep output structured and bounded for UI rendering
- Integrate with alert thresholds for retention collapse

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Audit event recorded
