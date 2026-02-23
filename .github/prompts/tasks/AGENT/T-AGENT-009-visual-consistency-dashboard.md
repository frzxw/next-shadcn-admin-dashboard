# Task ID: T-AGENT-009

## Title
Visual Consistency Metrics Dashboard Shell

## Area
AGENT

## Requirement IDs
- REQ-AGENT-005

## Depends On
- T-AGENT-006

## Description
Build the Visual Consistency tab/card for influencer-type agents. Displays face similarity score, body proportion stability, and style coherence metrics. MVP scope: dashboard shell with metric cards + drift alert summary. Actual embedding computation is Phase 2 (T-AI-019), but the UI and data display layer must be ready.

Reference: specs/12-visual-consistency-engine.md §4–§8, specs/04-information-architecture.md §3.3 Row 3.

## Acceptance Criteria
- Visual Consistency card/tab visible only for influencer-type agents
- Metric cards: Face Similarity (0–100), Body Stability (0–100), Style Similarity (0–100)
- Composite Visual Integrity Score displayed
- Threshold indicators: >85 stable, 70–85 minor, 55–70 warning, <55 critical
- Drift event list/timeline
- Reference image set summary link
- Empty/placeholder state for agents without visual data

## Technical Notes
- Phase 2 data: face_embedding, landmark_vector, style_signature not yet computed
- Shell reads from visual_embeddings and drift_events tables (schema created in Phase 2)
- For MVP: display placeholder/empty states gracefully
- Only shown for agent type = influencer

## Definition of Done
- Requirement satisfied: REQ-AGENT-005
- Type-safe interfaces defined for visual metrics
- No console errors
- Graceful empty state for MVP
- UI follows shared UI primitives rules
