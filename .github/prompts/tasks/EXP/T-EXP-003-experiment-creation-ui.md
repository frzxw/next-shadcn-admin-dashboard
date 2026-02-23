# Task ID: T-EXP-003

## Title
Experiment Creation & Management UI

## Area
EXP

## Requirement IDs
- REQ-EXP-001
- REQ-EXP-002

## Depends On
- T-EXP-002
- T-CORE-003
- T-COLLAB-003

## Description
Build the Experiments page with Tier 2 tabs: A/B Tests, Hypotheses, Results, Learnings. Create experiment creation flow with hypothesis form, variant setup, metric selection, and lifecycle management controls.

Reference: specs/09-experimentation-framework.md §9, specs/01-product-spec.md §5.8.

## Acceptance Criteria
- Experiment list showing active/completed/archived
- Create experiment flow: hypothesis, primary metric, agent, variants
- Active experiment cards with: hypothesis, variant comparison, confidence badge, metric delta
- Activate/Complete/Archive buttons role-gated
- Variant comparison chart
- Promote to Memory CTA (links to T-EXP-006)
- Loading/empty states

## Technical Notes
- Bento layout per specs/09-experimentation-framework.md §9
- Row 1: Active count, completed this month, high confidence wins
- Row 2: Active experiment cards
- Row 3: Completed experiment archive
- Tabs max 6, URL-persisted

## Definition of Done
- Requirement satisfied: REQ-EXP-001, REQ-EXP-002
- Type-safe
- No console errors
- UI follows shared UI primitives rules
- Role-gated controls
