# Task ID: T-AI-002

## Title
Hook Generation Contract & Schema

## Area
AI

## Requirement IDs
- REQ-AI-001

## Depends On
- T-AI-001

## Description
Define typed request/response contracts and zod schemas for hook generation.

## Acceptance Criteria
- Request schema includes content_brief, objective, platform, tone_preference(optional)
- Response schema includes hooks array with text, curiosity_score, clarity_score
- Enforce min 3 max 7 hooks
- Hook length validation respects platform limits
- Contract exported for server action and UI use

## Technical Notes
- Keep schemas in `src/lib/ai/contracts.ts`
- Include prompt/model version fields in trace typing
- Avoid unstructured outputs

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
