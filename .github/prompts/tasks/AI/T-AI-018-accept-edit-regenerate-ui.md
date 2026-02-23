# Task ID: T-AI-018

## Title
Accept/Edit/Regenerate AI Output Actions

## Area
AI

## Requirement IDs
- REQ-AI-008

## Depends On
- T-AI-004
- T-AI-007
- T-AI-010

## Description
Implement standardized action controls for AI outputs: accept, edit, regenerate.

## Acceptance Criteria
- Every AI output card includes accept, edit, regenerate controls
- Accept persists selected output to relevant entity
- Edit supports inline modifications before save
- Regenerate triggers same feature with traceable new call
- Action outcomes are deterministic and auditable

## Technical Notes
- Reuse common action component across AI features
- Keep state transitions explicit and user-confirmed
- Audit accepted outputs when persisted as mutations

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- UI follows shared UI primitives rules
