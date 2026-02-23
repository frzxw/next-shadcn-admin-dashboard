# Task ID: T-EXP-004

## Title
Experiment Confidence Score Computation

## Area
EXP

## Requirement IDs
- REQ-EXP-003

## Depends On
- T-EXP-001
- T-CONTENT-002

## Description
Implement the confidence score computation service for experiments. Uses the V1 simplified formula: confidence_score = abs(variantA_perf - variantB_perf) / pooled_variance. Enforces minimum sample rules. Produces confidence bands: Low (<60%), Medium (60–80%), High (>80%).

Reference: specs/09-experimentation-framework.md §6, specs/06-kpi-definitions.md §4.2.

## Acceptance Criteria
- Confidence score computed per experiment when variants have sufficient data
- Performance index normalized: log(views + 1) / log(median_views + 1)
- Minimum sample rule enforced (configurable threshold)
- Confidence bands displayed: Low, Medium, High
- Cannot complete experiment unless minimum sample met
- Score stored in experiment_results.confidence_score

## Technical Notes
- Pooled_variance = combined variance across variants
- Performance data from post_metrics via experiment_variants
- Computation triggered on metrics update or manual request
- Statistical threshold configurable per plan tier (OQ-006)

## Definition of Done
- Requirement satisfied: REQ-EXP-003
- Type-safe
- Formula matches spec
- Edge cases handled (insufficient data, single variant)
