# Task ID: T-EXP-005

## Title
Experiment Results Dashboard

## Area
EXP

## Requirement IDs
- REQ-EXP-004

## Depends On
- T-EXP-003
- T-EXP-004

## Description
Build the experiment results view showing completed experiments with winner selection, confidence scores, variant comparison charts, and summary. Archive view for past experiments with searchable learnings.

Reference: specs/09-experimentation-framework.md §9 Row 3.

## Acceptance Criteria
- Completed experiment detail: winning variant, confidence badge, delta %
- Variant comparison chart (side-by-side performance)
- Statistical summary text
- Archive list: searchable by hypothesis, agent, date
- Learning notes editable per experiment
- Export learning summary

## Technical Notes
- Data from experiment_results + experiment_variants
- Charts pre-aggregated server-side
- Experiments immutable after completion — results are final

## Definition of Done
- Requirement satisfied: REQ-EXP-004
- Type-safe
- No console errors
- UI follows shared UI primitives rules
