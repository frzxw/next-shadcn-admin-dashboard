# Task ID: T-AUD-003

## Title
Comment Depth Scoring Service

## Area
AUD

## Requirement IDs
- REQ-AUD-003

## Depends On
- T-AUD-001

## Description
Implement comment depth scoring — an AI-powered analysis of comment quality and depth. Uses the AI comment depth scoring contract to analyze comment arrays and produce a depth score, theme list, and sentiment summary per post.

Reference: specs/07-ai-contracts.md §6.5.

## Acceptance Criteria
- Server action accepts post comments array
- Calls AI scoring with comment depth contract
- Returns: comment_depth_score (0–100), themes array, sentiment_summary
- Score stored in post_analysis or audience metadata
- Handles empty comments gracefully

## Technical Notes
- AI contract input: { comments: [string] } → output: { comment_depth_score, themes, sentiment_summary }
- Uses lower-latency model (classification task per specs/07-ai-contracts.md §7.1)
- Audit log for AI call
- Result feeds into audience_quality_score calculation

## Definition of Done
- Requirement satisfied: REQ-AUD-003
- Type-safe
- No console errors
- AI trace logged
