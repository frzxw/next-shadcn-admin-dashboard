# 12 — Visual Consistency Engine Specification (AI Influencer Stability System)

## Document Control
- Version: 0.1
- Status: Draft
- Last Updated: 2026-02-23
- Owner: AI Systems / Architecture

---

# 1. Purpose

This document defines the Visual Consistency Engine for AI influencer agents.

The engine must:

- Detect facial drift
- Detect body proportion instability
- Detect lighting/style inconsistencies
- Provide measurable stability scores
- Alert when avatar integrity degrades
- Prevent repeated visual mistakes

This directly addresses the pain point:

"AI influencer appearance changes between posts."

---

# 2. Design Principles

1. Visual identity is part of persona integrity.
2. Baseline reference must be explicitly defined.
3. Drift must be measurable, not subjective.
4. Alerts must be actionable.
5. System must not block publishing (MVP).
6. Scoring must be versioned.

---

# 3. Engine Architecture Overview

Flow:

    Image → Embedding Extraction → Baseline Comparison → Drift Scoring → Alert System

Components:

- Face Embedding Model
- Landmark Detection Model
- Visual Style Classifier
- Drift Threshold Evaluator
- Visual Stability KPI Generator

---

# 4. Baseline Reference System

Each influencer-type agent must define:

- Baseline Face Embedding
- Baseline Body Proportion Profile
- Baseline Style Profile
- Optional: Approved Reference Image Set

Stored in:

- agent_visual_profile table

Fields:

- agent_id
- face_embedding_vector
- landmark_baseline
- style_signature
- created_at
- version

---

# 5. Face Similarity Detection

## 5.1 Face Embedding Extraction

For each new image:

1. Detect face
2. Extract embedding vector
3. Normalize vector

---

## 5.2 Similarity Calculation

    face_similarity =
      cosine_similarity(
        current_face_embedding,
        baseline_face_embedding
      )

Score mapped to 0–100 scale.

---

## 5.3 Thresholds

- > 85 = Stable
- 70–85 = Minor variation
- 55–70 = Warning
- < 55 = Critical drift

---

# 6. Body Proportion Stability

## 6.1 Landmark Detection

Extract keypoints:

- Shoulder width
- Hip width
- Arm length
- Torso ratio
- Head-to-body ratio

---

## 6.2 Stability Score

Compute variance against baseline:

    variance = mean_squared_error(current_landmarks, baseline_landmarks)

Lower variance = higher stability.

Normalize to 0–100:

    body_stability_score = 100 - (normalized_variance * 100)

---

# 7. Style Consistency Detection

Evaluate:

- Lighting brightness distribution
- Color temperature
- Background complexity
- Outfit color palette

Generate style_signature vector.

Compare to baseline:

    style_similarity =
      cosine_similarity(current_style_signature, baseline_style_signature)

---

# 8. Composite Visual Integrity Score

Final visual consistency score:

    visual_integrity_score =
      0.5 * face_similarity +
      0.3 * body_stability_score +
      0.2 * style_similarity

Stored in post_analysis table.

---

# 9. Drift Classification

If visual_integrity_score < threshold:

Create:

- Drift event
- Mistake record
- Candidate prevention rule

Example:

Failure Type:
    "Facial structure inconsistency"

Prevention Rule Suggestion:
    "Use fixed seed and reference image set."

---

# 10. Reference Image Sets

Each agent may define:

- Approved face set
- Approved pose set
- Approved lighting examples

Generation pipeline must:

- Inject reference image embeddings
- Use fixed seed when configured

---

# 11. Alert System

Drift alerts triggered if:

- Single post critical (<55)
- 3 consecutive posts warning (<70)
- Sudden drop >20 points from prior post

Alerts appear in:

- Home dashboard
- Agent → Consistency tab

---

# 12. Data Storage

## 12.1 visual_embeddings

- id
- agent_id
- post_id
- face_embedding_vector
- landmark_vector
- style_signature
- created_at

---

## 12.2 drift_events

- id
- agent_id
- post_id
- face_similarity
- body_stability_score
- style_similarity
- composite_score
- severity
- created_at

---

# 13. Performance Strategy

MVP:

- Run embedding extraction asynchronously
- Queue-based processing
- Store embeddings for reuse

Do not:
- Block content publishing
- Recompute embeddings unnecessarily

---

# 14. UI Design (Bento-Aligned)

## Agent → Consistency Tab Layout

Row 1:
- Visual Integrity Score (large KPI)
- Trend chart (last 10 posts)

Row 2:
- Face Similarity Trend
- Body Stability Trend

Row 3:
- Style Similarity Heatmap
- Drift Events Table

Each card:
- Severity badges
- Drill-down view
- View image overlay comparison

---

# 15. Overlay Comparison Feature

Allow user to:

- Select baseline image
- Compare side-by-side
- Show landmark overlays
- Show similarity percentage

---

# 16. Memory Integration

If drift repeats:

1. Create mistake entry
2. Generate candidate prevention rule
3. Suggest memory promotion

Example durable memory:

    "Always include baseline reference image during generation."

---

# 17. Versioning

Store:

- embedding_model_version
- similarity_algorithm_version
- normalization_profile_version

If model changes:
- Do not retroactively alter past scores
- Version bump required

---

# 18. Anti-Patterns

Avoid:

- Blocking content publishing due to drift
- Auto-modifying identity
- Silent drift suppression
- Over-alerting for minor variance

---

# 19. Phase 2 Enhancements

- Multi-face detection for group shots
- Video frame sampling consistency scoring
- Pose clustering
- Cross-agent face collision detection
- Real-time drift warning during generation

---

# Summary

The Visual Consistency Engine ensures:

- Stable AI influencer identity
- Measurable visual integrity
- Actionable drift alerts
- Structured prevention learning
- Integrated memory reinforcement
- Long-term avatar brand stability