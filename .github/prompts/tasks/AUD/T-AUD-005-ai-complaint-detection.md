# Task ID: T-AUD-005

## Title
AI-Looking Complaint Detection

## Area
AUD

## Requirement IDs
- REQ-AUD-005

## Depends On
- T-AUD-003

## Description
Implement detection of "AI-looking" complaint patterns in audience comments. Uses AI classification to identify comments suggesting the audience perceives content/avatar as artificially generated, robotic, or uncanny. Flags these as a specific feedback theme with severity.

Reference: specs/01-product-spec.md §5.6 Feedback.

## Acceptance Criteria
- AI classification identifies AI-perception complaints in comment arrays
- Complaint pattern stored as special feedback theme type
- Severity scoring: isolated incidents vs persistent pattern
- Triggers alert if pattern crosses threshold (feeds into T-CORE-009 alerting)
- Linked to post for drill-down

## Technical Notes
- Extension of comment depth scoring (T-AUD-003) — additional classification pass
- Keywords/patterns: "fake", "AI", "robotic", "uncanny", "looks generated", etc.
- AI classification using lower-latency model
- Audit log for AI call

## Definition of Done
- Requirement satisfied: REQ-AUD-005
- Type-safe
- No console errors
- AI trace logged
