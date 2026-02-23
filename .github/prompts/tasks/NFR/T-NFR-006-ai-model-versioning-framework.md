# Task ID: T-NFR-006

## Title
AI Model/Prompt Versioning Framework

## Area
NFR

## Requirement IDs
- REQ-NFR-006

## Depends On
- T-AI-001
- T-AUDIT-003

## Description
Implement consistent model and prompt version tracking across AI outputs and persisted scoring records.

## Acceptance Criteria
- AI responses include model_version and prompt_version metadata
- `post_analysis` stores model_version for scoring outputs
- Prompt version increments are explicit and traceable
- Version metadata included in audit entries
- Historical outputs remain immutable after version changes

## Technical Notes
- Define shared version constants per feature
- Avoid silent prompt behavior changes
- Hash prompt templates for trace correlation
- Include version in exported reports where relevant

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Audit event recorded for AI version metadata
