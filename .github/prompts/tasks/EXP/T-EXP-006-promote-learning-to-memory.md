# Task ID: T-EXP-006

## Title
Promote Experiment Learning to Memory

## Area
EXP

## Requirement IDs
- REQ-EXP-005

## Depends On
- T-EXP-002
- T-MEMORY-004

## Description
Implement the workflow to promote experiment learnings to the memory queue. When an experiment completes with high confidence, create a candidate memory item and/or prevention rule from the result. Requires Creator approval for promotion to durable memory.

Reference: specs/09-experimentation-framework.md §7, specs/08-memory-system.md §5.2.

## Acceptance Criteria
- "Promote to Memory" action on completed experiments with high confidence
- Creates candidate memory item with experiment summary and confidence score
- Optionally creates prevention_rule or reinforcement rule
- Notifies Creator for review
- Permission: Creator only for promotion approval
- Audit log for promotion action

## Technical Notes
- Integration point between EXP and MEMORY systems
- Memory item source_type = 'experiment'
- Links experiment_id to memory_item
- Feeds into T-MEMORY-004 (promotion workflow)
- Confidence threshold from specs/09-experimentation-framework.md §7

## Definition of Done
- Requirement satisfied: REQ-EXP-005
- Type-safe
- Server-side permission enforcement present
- Audit event recorded
