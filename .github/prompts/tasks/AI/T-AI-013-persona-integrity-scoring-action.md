# Task ID: T-AI-013

## Title
Persona Integrity Scoring Action

## Area
AI

## Requirement IDs
- REQ-AI-005

## Depends On
- T-AI-011
- T-AUDIT-003

## Description
Implement text-based persona integrity scoring action with component outputs (voice_similarity, stance_consistency, style_consistency).

## Acceptance Criteria
- Action returns integrity_score and component sub-scores
- Boundary/violation penalty handling applied
- Score persisted to post_analysis with model_version
- Integrity drop signals emitted for alerting and mistakes loop
- Audit logged

## Technical Notes
- Use identity snapshot from agent files
- Maintain deterministic scoring settings
- Store sub-scores in metadata for agent dashboards

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Audit event recorded
