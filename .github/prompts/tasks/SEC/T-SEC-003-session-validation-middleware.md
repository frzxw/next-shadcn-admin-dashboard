# Task ID: T-SEC-003

## Title
Session Validation Middleware

## Area
SEC

## Requirement IDs
- REQ-NFR-003

## Depends On
- T-CORE-002

## Description
Implement centralized session validation middleware/utilities for protected routes and server actions.

## Acceptance Criteria
- Protected route helper validates active session and membership
- Missing/invalid sessions redirect or return unauthorized safely
- Server actions require validated session context
- Workspace scoping enforced from session identity
- Security failures logged without sensitive details

## Technical Notes
- Build on Better Auth adapter
- Keep route guards lightweight; rely on server action checks for final enforcement
- No client-side trust assumptions
- Reuse across all domain modules

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Server-side enforcement present
