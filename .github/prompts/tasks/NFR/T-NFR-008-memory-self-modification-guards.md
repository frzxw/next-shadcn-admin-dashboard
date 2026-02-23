# Task ID: T-NFR-008

## Title
Memory Self-Modification Guardrails

## Area
NFR

## Requirement IDs
- REQ-NFR-010

## Depends On
- T-MEMORY-004
- T-COLLAB-002

## Description
Implement hard guardrails preventing uncontrolled memory and identity self-modification by AI.

## Acceptance Criteria
- AI cannot directly edit SOUL/IDENTITY/MEMORY durable files
- AI cannot auto-promote candidate memory to durable in MVP
- Promotion always requires explicit Creator approval in server flow
- Guard checks enforced in server orchestration layer
- Violations are blocked and logged

## Technical Notes
- Enforce at mutation boundary, not prompt-only policy
- Validate source of mutation intent (human actor vs automated)
- Add explicit allowlist for safe AI write operations (ephemeral/candidate only)
- Couple with audit alerts for suspicious promotion spikes

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Server-side enforcement present
- Audit/security events recorded
