# 06 — KPI Definitions & Metric Formulas

## Document Control
- Version: 0.1
- Status: Draft
- Last Updated: 2026-02-23
- Owner: Product / Data / Architecture

---

# 1. KPI Philosophy

KPIs in the AI Agent Creator OS must:

1. Measure strategy, not vanity  
2. Be stable and explainable  
3. Be versioned (store `model_version` where AI-derived)  
4. Be comparable across time  
5. Be agent-scoped (not global unless explicitly defined)

Each KPI must define:
- Purpose
- Formula
- Data inputs
- Edge case handling
- Versioning strategy

---

# 2. Core Dashboard KPIs

These appear on:
- Home
- Agent Overview
- Insights

---

## 2.1 Growth Rate

Purpose: Measure audience expansion velocity.

Formula:

    growth_rate = 
      (followers_today - followers_30_days_ago) 
      / followers_30_days_ago

If followers are unavailable:

    growth_rate = 
      (avg_views_last_7d - avg_views_prev_7d) 
      / avg_views_prev_7d

Notes:
- Display as percentage.
- Must handle division-by-zero safely.
- Use rolling windows.

---

## 2.2 Average Retention

Purpose: Measure structural video performance.

Formula:

    avg_retention = mean(post_retention_pct over selected range)

If only completion rate is available:

    avg_retention = completion_rate

Notes:
- Normalize by video duration if available.
- Use weighted average by views.

---

## 2.3 Returning Viewer Percentage

Purpose: Measure loyalty depth.

Formula:

    returning_viewer_pct = returning_viewers / total_viewers

Fallback proxy if unavailable:

    loyalty_proxy = saves_per_1k_views + repeat_engagement_rate

---

## 2.4 Narrative Alignment Score (0–100)

Purpose: Measure how strongly content reinforces agent positioning.

Inputs:
- Post embedding
- Pillar embeddings
- Prohibited topic similarity

Formula (V1):

    alignment_score =
      100 * (
        0.7 * max_similarity_to_pillar +
        0.3 * avg_top3_similarity
      )
      - drift_penalty

Notes:
- Must store alignment_model_version.
- Score rounded to integer.

---

## 2.5 Persona Integrity Score (0–100)

Purpose: Measure identity stability.

Components:
- voice_similarity
- stance_consistency
- style_consistency

Formula:

    integrity_score =
      100 * (
        0.45 * voice_similarity +
        0.35 * stance_consistency +
        0.20 * style_consistency
      )

If boundary violation occurs:

    integrity_score =
      integrity_score * (1 - penalty_factor)

---

## 2.6 Audience Quality Score (0–100)

Purpose: Measure depth of engagement.

Inputs:
- returning_viewer_pct
- saves_per_1k_views
- shares_per_1k_views
- comment_depth_score
- follow_conversion_rate

Formula:

    raw_score =
      w1 * returning_viewer_pct +
      w2 * saves_per_1k_views +
      w3 * shares_per_1k_views +
      w4 * comment_depth_score +
      w5 * follow_conversion_rate

    audience_quality =
      100 * sigmoid(raw_score)

Notes:
- Weights are configurable.
- Store weight profile version.

---

# 3. Advanced Strategic KPIs

---

## 3.1 Compounding Score (0–100)

Purpose: Measure idea evolution and repetition strength.

Inputs:
- idea_recurrence_rate
- idea_evolution_rate
- novelty_rate
- saturation_penalty

Formula:

    compounding =
      100 * (
        0.4 * recurrence +
        0.35 * evolution +
        0.25 * novelty
      )
      * (1 - saturation_penalty)

---

## 3.2 Saturation Index (0–100)

Purpose: Detect content repetition without evolution.

Formula:

    saturation_index =
      duplicate_density_in_cluster * 100

Where:

    duplicate_density =
      posts_with_high_similarity / total_posts_in_cluster

Thresholds:
- > 60 = warning
- > 80 = critical

---

## 3.3 Loyalty Index

Purpose: Measure long-term audience retention.

Formula:

    loyalty_index =
      0.6 * returning_viewer_pct +
      0.4 * repeat_engagement_rate

---

## 3.4 Longevity Index

Purpose: Measure evergreen strength.

Formula:

    longevity_index =
      views_after_30_days / views_first_7_days

Notes:
- Normalize to 0–100 for display.
- Suppress if post age < 30 days.

---

# 4. Experiment KPIs

---

## 4.1 Performance Index

Purpose: Normalize performance across variants.

Formula:

    performance_index =
      log(views + 1) / log(median_views + 1)

---

## 4.2 Experiment Confidence Score

Purpose: Estimate winner reliability.

Formula (V1):

    confidence_score =
      abs(variantA_perf - variantB_perf) / pooled_variance

Display bands:
- Low: < 60%
- Medium: 60–80%
- High: > 80%

---

# 5. Mistake & Risk KPIs

---

## 5.1 Drift Frequency

Formula:

    drift_frequency =
      visual_drift_events / posts_in_range

---

## 5.2 Recurring Failure Rate

Formula:

    recurring_failure_rate =
      repeat_failures_of_same_type / total_failures

---

# 6. Visual Consistency KPIs (Phase 2)

---

## 6.1 Face Similarity Score (0–100)

Formula:

    face_similarity =
      cosine_similarity(
        current_face_embedding,
        baseline_embedding
      )

---

## 6.2 Body Proportion Stability

Concept:
- Compute landmark variance across posts.
- Lower variance = higher stability.

---

# 7. KPI Versioning

Every AI-derived metric must store:
- model_version
- weight_profile_version
- calculation_timestamp

When formulas change:
- Increment version.
- Do not retroactively alter historical values without migration logs.

---

# 8. Threshold Defaults

| Metric           | Warning | Critical |
|------------------|---------|----------|
| Integrity Score  | < 75    | < 60     |
| Alignment Score  | < 70    | < 55     |
| Saturation Index | > 60    | > 80     |
| Drift Frequency  | > 10%   | > 20%    |
| Audience Quality | < 50    | < 35     |

---

# 9. Edge Case Handling

- If insufficient data → show “Low Data” state  
- If new agent (< 7 days) → suppress long-term KPIs  
- Never display NaN  
- All KPIs must have loading + empty states  

---

# 10. UI Alignment (Bento Principle)

- KPIs grouped logically in modular cards  
- Primary KPI: large number + trend arrow  
- Supporting metric: smaller muted text  
- No more than 3 KPIs per card  

---

# Summary

This KPI system ensures:
- Strategy-focused metrics  
- Explainable AI scoring  
- Stable dashboards  
- Consistent cross-agent comparison  
- Versioned and auditable analytics  