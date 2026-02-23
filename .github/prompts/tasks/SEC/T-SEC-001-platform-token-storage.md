# Task ID: T-SEC-001

## Title
Secure Platform Token Storage

## Area
SEC

## Requirement IDs
- REQ-NFR-009

## Depends On
- T-CORE-001
- T-CORE-002

## Description
Implement secure storage for external platform tokens/credentials with encryption-at-rest and restricted server-side access patterns.

## Acceptance Criteria
- Token storage abstraction created in server service layer
- Tokens encrypted before persistence
- Decryption only allowed in server runtime
- Token values never returned to client
- Rotation/update flow supported
- Access attempts audited

## Technical Notes
- Use environment-managed encryption key
- Avoid logging token material
- Restrict read methods to integration services only
- Workspace-scoped token ownership

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Server-side permission enforcement present
- Audit event recorded for token changes
