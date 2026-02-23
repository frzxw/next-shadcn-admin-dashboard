# Task ID: T-AGENT-010

## Title
Voice Consistency Metrics & Display

## Area
AGENT

## Requirement IDs
- REQ-AGENT-006

## Depends On
- T-AGENT-006
- T-AI-013

## Description
Implement the Voice Consistency metrics display for educator/commentary agents. Shows tone stability, formality drift, vocabulary deviation, and claim contradiction detection. Data derived from persona integrity scoring (text-based analysis) applied to recent posts.

Reference: specs/01-product-spec.md §5.2 Consistency — Voice Consistency Engine, specs/04-information-architecture.md §3.3 Row 3.

## Acceptance Criteria
- Voice Consistency card/tab visible for educator/commentary agent types
- Metrics: Tone Stability, Formality Drift indicator, Vocabulary Deviation, Claim Contradiction detection
- Each metric displayed as score/indicator with trend
- Threshold-based coloring (stable/warning/critical)
- Data sourced from post_analysis integrity sub-scores
- Empty state for agents without sufficient data

## Technical Notes
- Text-based analysis — part of Phase 1 (unlike visual which is Phase 2)
- Scoring outputs from persona integrity scoring include voice_similarity, stance_consistency, style_consistency
- May require additional sub-metrics stored in post_analysis metadata (jsonb)
- Only shown for agent type = educator or commentary

## Definition of Done
- Requirement satisfied: REQ-AGENT-006
- Type-safe
- No console errors
- UI follows shared UI primitives rules
