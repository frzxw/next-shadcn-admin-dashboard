# Task ID: T-CONTENT-005

## Title
Post Drill-Down Panel with Retention Graph

## Area
CONTENT

## Requirement IDs
- REQ-CONTENT-003
- REQ-CONTENT-007

## Depends On
- T-CONTENT-004
- T-CONTENT-002
- T-AI-020

## Description
Build the post analysis drill-down view as a slide-over panel (desktop) or full page (mobile). Display retention graph with AI annotations for drop-off points, hook score, audience depth breakdown, alignment/integrity scores, visual drift indicator, and structural retention drop explanations.

Reference: specs/04-information-architecture.md §3.4, specs/01-product-spec.md §5.3 Post Analysis.

## Acceptance Criteria
- Slide-over panel on desktop, full page on mobile
- Retention graph with time axis and percentage axis
- AI annotations marking drop-off points with explanations
- Hook score displayed
- Audience depth breakdown (new vs returning, comment depth)
- AI scores: alignment, integrity, audience quality
- Drift indicator if applicable
- Structural retention drop causes displayed (from T-AI-020)

## Technical Notes
- Avoid modals for analysis — use slide-over panels (specs/16-design-system-alignment.md §10.2)
- Retention data from post_metrics + retention_drop_annotations from post_analysis
- If no retention curve, show completion_rate fallback (specs/06-kpi-definitions.md §2.2)
- Chart performance: < 300ms rendering
- All charts support hover tooltips

## Definition of Done
- Requirement satisfied: REQ-CONTENT-003, REQ-CONTENT-007
- Type-safe
- No console errors
- UI follows shared UI primitives rules
- Slide-over panel pattern
