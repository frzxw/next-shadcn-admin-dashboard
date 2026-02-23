# Task ID: T-AI-014

## Title
Audience Quality Scoring Action

## Area
AI

## Requirement IDs
- REQ-AI-006

## Depends On
- T-AI-011
- T-AUD-003
- T-AUDIT-003

## Description
Implement audience quality scoring action using engagement-depth inputs and configurable weighting profile.

## Acceptance Criteria
- Computes audience_quality score (0–100)
- Inputs include returning viewer %, saves/shares per 1k, comment depth, conversion
- Weight profile version captured
- Result persisted to post_analysis
- Audit logged with trace

## Technical Notes
- Use sigmoid-normalized scoring output
- Handle missing metrics with graceful fallbacks
- Keep weights configurable by version profile

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Audit event recorded
