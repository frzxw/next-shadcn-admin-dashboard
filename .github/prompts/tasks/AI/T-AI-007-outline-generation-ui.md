# Task ID: T-AI-007

## Title
Outline Generation UI Integration

## Area
AI

## Requirement IDs
- REQ-AI-002

## Depends On
- T-AI-006

## Description
Integrate outline generation in the draft editor with generate/regenerate/apply actions and section-level editing.

## Acceptance Criteria
- Generate outline button available in draft flow
- Output rendered as editable ordered sections
- Regenerate and apply-to-draft actions available
- Loading/error states implemented
- Role-gated visibility enforced

## Technical Notes
- Use shared form/list components
- Keep section editing client-side and persist via content actions
- Avoid blocking page interactions during generation

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- UI follows shared UI primitives rules
