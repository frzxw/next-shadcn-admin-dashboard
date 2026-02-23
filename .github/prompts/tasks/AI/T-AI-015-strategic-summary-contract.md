# Task ID: T-AI-015

## Title
Strategic Summary Contract & Schema

## Area
AI

## Requirement IDs
- REQ-AI-007

## Depends On
- T-AI-001

## Description
Define contract/schema for weekly strategic copilot recommendations.

## Acceptance Criteria
- Request schema includes KPI snapshot, recent posts summary, active experiments
- Response schema includes double_down, stop_doing, experiment_next, risk_alerts arrays
- Schema exported for action and UI
- Trace metadata typed

## Technical Notes
- Keep response bounded and structured
- Avoid free-form unvalidated payloads
- Version prompt template explicitly

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
