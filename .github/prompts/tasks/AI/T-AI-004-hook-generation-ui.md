# Task ID: T-AI-004

## Title
Hook Generation UI Integration

## Area
AI

## Requirement IDs
- REQ-AI-001

## Depends On
- T-AI-003

## Description
Integrate hook generation UI into draft workflow with generate button, loading state, streaming/partial support if available, and selection actions.

## Acceptance Criteria
- Generate hooks action available in draft editor
- Displays 3–7 hook candidates with scores
- Supports regenerate action
- Selected hook can be applied to draft
- Loading, error, and retry states implemented
- Trace info optionally viewable in debug panel

## Technical Notes
- Use shared card/list primitives
- Keep UI responsive during generation
- Guard action by role gate
- No custom design tokens

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- UI follows shared UI primitives rules
