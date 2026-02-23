# Task ID: T-AI-012

## Title
Narrative Alignment Scoring Action

## Area
AI

## Requirement IDs
- REQ-AI-004

## Depends On
- T-AI-011
- T-AUDIT-003

## Description
Implement server action/service for narrative alignment scoring using pillar context and prohibited topic checks.

## Acceptance Criteria
- Scores post text against pillar context and prohibited topics
- Returns alignment_score, matched_pillar, drift_detected, explanation
- Score persisted to post_analysis with model_version
- Consecutive low-score drift signals emitted for alerting
- Audit logged with trace metadata

## Technical Notes
- Use pillar data from agent configuration
- Enforce score bounds and integer rounding for display
- Keep deterministic scoring params

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Audit event recorded
