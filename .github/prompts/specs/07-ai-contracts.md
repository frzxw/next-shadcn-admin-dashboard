# 07 — AI Contracts & Model Integration Spec

## Document Control
- Version: 0.1
- Status: Draft
- Last Updated: 2026-02-23
- Owner: Architecture / AI Systems

---

# 1. Purpose

This document defines:

- AI request contracts (input schemas)
- AI response contracts (output schemas)
- Trace metadata requirements
- Model routing rules
- Prompt versioning policy
- Error handling standards
- Memory + agent context injection rules

This ensures:

- AI layer remains deterministic and auditable
- Prompts do not become unmanageable
- Outputs are safe, typed, and stable
- AI scoring and generation remain versioned

---

# 2. AI System Architecture Overview

All AI calls must pass through:

    UI → Server Action → AI Orchestrator → Provider Adapter → Provider API

No UI component may call provider APIs directly.

---

# 3. AI Feature Categories

## 3.1 Generation

- Title/Hook generation
- Outline generation
- Script expansion
- Repurposing suggestions
- Weekly strategic summary

## 3.2 Scoring

- Narrative alignment
- Persona integrity
- Audience quality
- Structural retention annotation
- Idea clustering

## 3.3 Classification

- Comment depth scoring
- Feedback clustering
- Failure type detection
- Drift classification

---

# 4. AI Request Contract (Generic)

All AI requests must follow this structure:

    {
      feature: string,
      agent_id: string,
      workspace_id: string,
      input_payload: object,
      context: {
        agent_identity_snapshot: string,
        relevant_memory_items: array,
        prevention_rules: array
      },
      model_preferences: {
        temperature: number,
        max_tokens: number
      }
    }

---

# 5. AI Response Contract (Generic)

All AI responses must follow this structure:

    {
      success: boolean,
      output: object,
      trace: {
        provider: string,
        model: string,
        model_version: string,
        prompt_hash: string,
        latency_ms: number,
        timestamp: ISO8601,
        actor_user_id: string
      },
      error: optional string
    }

---

# 6. Feature-Level Contracts

---

## 6.1 Hook Generation

### Request Input

    {
      content_brief: string,
      objective: string,
      platform: string,
      tone_preference: optional string
    }

### Expected Output

    {
      hooks: [
        {
          text: string,
          curiosity_score: number,
          clarity_score: number
        }
      ]
    }

Constraints:
- Minimum 3 hooks
- Max 7 hooks
- Each hook ≤ platform character limit

---

## 6.2 Outline Generation

### Request Input

    {
      topic: string,
      objective: string,
      duration_target: number,
      audience_level: beginner|intermediate|advanced
    }

### Output

    {
      outline: [
        {
          section_title: string,
          description: string,
          estimated_seconds: number
        }
      ]
    }

---

## 6.3 Narrative Alignment Scoring

### Input

    {
      post_text: string,
      pillar_embeddings: array,
      prohibited_topics: array
    }

### Output

    {
      alignment_score: number,
      matched_pillar: string,
      drift_detected: boolean,
      explanation: string
    }

Score must be 0–100.

---

## 6.4 Persona Integrity Scoring

### Input

    {
      post_text: string,
      identity_snapshot: string
    }

### Output

    {
      integrity_score: number,
      voice_similarity: number,
      stance_consistency: number,
      style_consistency: number,
      violation_detected: boolean
    }

---

## 6.5 Audience Comment Depth Scoring

### Input

    {
      comments: [string]
    }

### Output

    {
      comment_depth_score: number,
      themes: [string],
      sentiment_summary: string
    }

---

## 6.6 Strategic Copilot Summary

### Input

    {
      agent_kpi_snapshot: object,
      recent_posts_summary: array,
      active_experiments: array
    }

### Output

    {
      double_down: [string],
      stop_doing: [string],
      experiment_next: [string],
      risk_alerts: [string]
    }

---

# 7. Model Routing Policy

## 7.1 Generation Models

- Use high-capability model for:
  - Hook generation
  - Outline
  - Strategy summary

- Use lower-latency model for:
  - Comment classification
  - Drift detection
  - Clustering

---

## 7.2 Scoring Models

Scoring must prioritize:
- Determinism
- Low temperature
- Stable output

Default:
    temperature = 0.1

---

# 8. Prompt Versioning

Each AI feature must have:

    PROMPT_VERSION = "feature-name:v1"

Stored in:
- trace metadata
- audit log
- post_analysis table

When prompt changes:
- Increment version
- Do not silently replace behavior

---

# 9. Memory Context Injection Rules

Before generation:

1. Load agent SOUL + IDENTITY
2. Inject active prevention rules
3. Inject top 3 relevant memory items
4. Do NOT inject entire memory store
5. Limit context size to token threshold

Context priority order:
1. Prevention rules
2. Durable memory
3. Recent memory
4. Pillars

---

# 10. Error Handling

If provider fails:

    success = false
    error = provider_error_message

UI must:
- Show safe fallback
- Allow retry
- Not expose provider internals

All failures logged to audit_log.

---

# 11. Safety & Guardrails

AI must not:

- Modify agent identity files without approval
- Promote memory without explicit promotion action
- Override prevention rules
- Generate content violating workspace policy

---

# 12. Audit Requirements

Every AI call must log:

- prompt_hash
- model
- model_version
- latency
- actor_user_id
- feature_name

Stored in:
- audit_log
- ai_usage table (optional)

---

# 13. Rate Limiting

Per workspace:
- Generation calls capped per minute
- Scoring calls batched where possible

Future:
- Tier-based limits (Free / Pro / Agency)

---

# 14. Streaming Support

For long-form generation:
- Stream partial output
- UI progressively renders
- Final trace metadata appended at end

---

# 15. Anti-Patterns

Avoid:

- Direct client AI calls
- Unversioned prompts
- Free-form unstructured outputs
- Memory writes without validation
- Silent scoring recalculations

---

# Summary

This AI contract layer ensures:

- Deterministic structure
- Safe integration
- Memory-aware generation
- Scalable model routing
- Full traceability
- Alignment with AI Agent Creator OS architecture