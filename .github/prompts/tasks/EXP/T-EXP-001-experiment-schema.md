# Task ID: T-EXP-001

## Title
Experiment + Variants + Results Schema

## Area
EXP

## Requirement IDs
- REQ-EXP-001
- REQ-EXP-002

## Depends On
- T-CORE-001
- T-AGENT-001
- T-CONTENT-001

## Description
Create database tables for the experimentation engine: `experiments` (hypothesis, status, primary_metric), `experiment_variants` (content_item link, performance_index), `experiment_results` (winning variant, confidence score, summary).

Reference: specs/05-data-model.md §10, specs/09-experimentation-framework.md §5.

## Acceptance Criteria
- `experiments` table: id, agent_id, hypothesis, primary_metric, status enum (proposed|active|completed|archived), created_at
- `experiment_variants` table: id, experiment_id, variant_label, content_item_id, performance_index, created_at
- `experiment_results` table: id, experiment_id, winning_variant_id, confidence_score, summary, created_at
- Experiment status lifecycle enforced
- Indexes on agent_id, status
- Migration runs cleanly

## Technical Notes
- Max 3 active experiments per agent (specs/09-experimentation-framework.md §8)
- Experiments immutable after completion (specs/05-data-model.md §16)
- Confidence score stored as float 0–100
- primary_metric stores the KPI being tested

## Definition of Done
- Requirement satisfied: REQ-EXP-001, REQ-EXP-002
- Type-safe ORM models
- Migration idempotent
