# Task ID: T-AI-017

## Title
Strategic Copilot Panel UI

## Area
AI

## Requirement IDs
- REQ-AI-007

## Depends On
- T-AI-016
- T-CORE-006

## Description
Build Home dashboard strategic copilot panel rendering weekly recommendations with action-oriented sections.

## Acceptance Criteria
- Panel displays double_down, stop_doing, experiment_next, risk_alerts
- Includes refresh/regenerate control
- Shows loading and fallback states
- Recommendation items link to relevant module views
- Role-gated visibility consistent with permissions

## Technical Notes
- Use bento card pattern
- Keep dense but readable layout
- Avoid modal-heavy interactions; use inline or slide-over details

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- UI follows shared UI primitives rules
