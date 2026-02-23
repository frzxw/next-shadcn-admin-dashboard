# Task ID: T-CORE-002

## Title
Better Auth Integration

## Area
CORE

## Requirement IDs
- REQ-CORE-002
- REQ-NFR-003

## Depends On
- T-CORE-001

## Description
Integrate Better Auth for session management and authentication. Configure OAuth providers and optional email/password flow. Establish the server-side session validation boundary at `src/server/services/auth/`. Ensure sessions are validated in App Router server components and server actions.

Reference: specs/03-architecture.md §4.1.

## Acceptance Criteria
- Better Auth installed and configured
- OAuth provider(s) configured (at least one)
- Session validation utility available for server actions
- `src/server/services/auth/betterAuth.ts` adapter created
- Login/logout flows functional
- Session accessible in server components
- REQ-NFR-003 (unauthorized access prevention) addressed at auth layer

## Technical Notes
- Server-side only — no client-side auth state
- Session must be validated before any server action
- Integration boundary: `src/server/services/auth/`
- Must work with existing Next.js App Router layout
- Do not create new CosmosClient-style singletons — reuse singleton pattern

## Definition of Done
- Requirement satisfied: REQ-CORE-002, REQ-NFR-003
- Type-safe session types exported
- No console errors
- Auth flows tested (login, logout, session check)
- Server-side session enforcement present
