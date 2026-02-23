# Task ID: T-AUDIT-002

## Title
Hash-Chaining Tamper Evidence

## Area
AUDIT

## Requirement IDs
- REQ-NFR-007

## Depends On
- T-AUDIT-001

## Description
Add tamper-evident hash chaining to audit logs using `hash = SHA256(current_entry_data + previous_hash)` per workspace chain.

## Acceptance Criteria
- Each new audit entry stores `hash` and `previous_hash`
- Chain validation utility detects modified records
- Hash input excludes mutable/system-volatile fields not part of event payload
- Workspace-level chain continuity preserved
- Verification command/function available for forensic checks

## Technical Notes
- Use stable canonical serialization before hashing
- Hash chain should be deterministic
- Fail-safe behavior defined if previous hash missing (genesis entry)
- Consider background verification job for integrity checks

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Tamper-evidence verified with test scenario
