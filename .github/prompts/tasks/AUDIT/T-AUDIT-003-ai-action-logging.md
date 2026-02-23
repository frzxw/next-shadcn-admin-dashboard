# Task ID: T-AUDIT-003

## Title
AI Action Audit Logging

## Area
AUDIT

## Requirement IDs
- REQ-AUDIT-001

## Depends On
- T-AUDIT-001
- T-AI-001

## Description
Implement mandatory audit logging for every AI call with trace metadata: feature, prompt_hash, model, model_version, provider, latency, actor, success.

## Acceptance Criteria
- Every AI generation/scoring request logs an audit entry
- Required fields captured: feature_name, prompt_hash, model, model_version, provider, latency_ms, actor_user_id, success_flag
- Raw prompt text is not logged in audit
- AI trace_id returned and linkable to downstream entities
- Failure cases also logged

## Technical Notes
- Integrate inside orchestrator boundary, not UI
- Prompt hash generated consistently
- Log after response for accurate latency
- Preserve security constraints for secrets

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Audit event recorded for all AI calls
