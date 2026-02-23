# 05 — Data Model Specification

## Document Control
- Version: 0.1
- Status: Draft
- Last Updated: 2026-02-23
- Owner: Architecture

---

# 1. Data Modeling Principles

1. **Workspace-Scoped Everything**
   - All primary entities belong to a workspace.
2. **Agent-Centric**
   - Core operational entities reference `agent_id`.
3. **Append-Only Where Strategic**
   - Audit logs
   - Agent brain file versions
   - Memory promotion history
4. **Precompute for Dashboards**
   - KPI snapshots stored separately from raw metrics.
5. **Avoid AI-Dependent Schema**
   - AI outputs are normalized and versioned.

---

# 2. Core Entities Overview

High-Level Entity Map:

Workspace
 ├── Users
 ├── Agents
 │    ├── AgentFiles
 │    ├── MemoryItems
 │    ├── Mistakes
 │    ├── ContentItems
 │    │    ├── Posts
 │    │    ├── PostMetrics
 │    │    ├── PostAnalysis
 │    ├── Experiments
 │    ├── Assets
 │
 ├── AuditLogs

---

# 3. Workspace & Users

## 3.1 workspaces

- id (uuid, pk)
- name
- plan_tier
- created_at
- updated_at

---

## 3.2 users

- id (uuid, pk)
- email
- name
- auth_provider
- created_at

---

## 3.3 workspace_members

- id (uuid, pk)
- workspace_id (fk)
- user_id (fk)
- role (creator | editor | analyst | viewer)
- created_at

---

# 4. Agents

## 4.1 agents

- id (uuid, pk)
- workspace_id (fk)
- name
- type (influencer | educator | commentary | other)
- status (active | archived)
- default_platform
- created_at
- updated_at

Indexes:
- workspace_id
- (workspace_id, status)

---

# 5. Agent Brain (OpenClaw-style)

## 5.1 agent_files

Stores canonical SOUL, IDENTITY, USER, MEMORY.

- id (uuid, pk)
- agent_id (fk)
- file_type (SOUL | IDENTITY | USER | MEMORY)
- content (text)
- version_number
- created_by (user_id)
- created_at

Unique:
- (agent_id, file_type, version_number)

---

## 5.2 agent_file_current

Pointer table for fast access.

- agent_id
- file_type
- current_version_id

---

# 6. Content Domain

## 6.1 content_items

Represents pipeline object (idea → draft → etc.)

- id (uuid, pk)
- agent_id (fk)
- title
- objective
- lifecycle_state
  (idea | draft | review | scheduled | published | reviewed)
- scheduled_at (nullable)
- campaign_id (nullable)
- created_by
- created_at
- updated_at

Indexes:
- agent_id
- lifecycle_state

---

## 6.2 posts

Represents published artifact.

- id (uuid, pk)
- content_item_id (fk)
- agent_id (fk)
- platform
- external_post_id
- published_at
- url
- created_at

Unique:
- (platform, external_post_id)

---

## 6.3 post_metrics

Time-series aggregated.

- id (uuid)
- post_id (fk)
- snapshot_date
- views
- likes
- comments
- shares
- saves
- watch_time
- returning_viewer_pct (nullable)
- created_at

Index:
- (post_id, snapshot_date)

---

## 6.4 post_analysis

AI scoring + structural insight.

- id (uuid)
- post_id (fk)
- alignment_score
- integrity_score
- audience_quality_score
- hook_score
- retention_drop_annotations (jsonb)
- idea_cluster_id (nullable)
- model_version
- created_at

---

# 7. Insights & KPI Snapshots

## 7.1 agent_kpi_snapshots

Precomputed daily rollups.

- id
- agent_id
- snapshot_date
- growth_rate
- avg_retention
- loyalty_index
- compounding_score
- saturation_index
- integrity_avg
- alignment_avg
- created_at

Index:
- (agent_id, snapshot_date)

---

# 8. Audience Domain

## 8.1 audience_segments

- id
- agent_id
- segment_type
  (new | returning | high_depth | trend_traffic)
- size_estimate
- created_at

---

## 8.2 audience_feedback_clusters

- id
- agent_id
- theme_label
- sentiment_score
- occurrence_count
- created_at

---

# 9. Assets

## 9.1 assets

- id
- workspace_id
- agent_id (nullable)
- file_url
- file_type
- metadata (jsonb)
- created_at

---

## 9.2 asset_tags

- id
- asset_id
- tag

---

# 10. Experiments

## 10.1 experiments

- id
- agent_id
- hypothesis
- status (active | completed | archived)
- created_at

---

## 10.2 experiment_variants

- id
- experiment_id
- variant_label
- content_item_id
- performance_index
- created_at

---

## 10.3 experiment_results

- id
- experiment_id
- winning_variant_id
- confidence_score
- summary
- created_at

---

# 11. Mistakes & Prevention Rules

## 11.1 mistakes

Structured ERRORS equivalent.

- id
- agent_id
- failure_type
- context
- root_cause
- correction
- status (active | resolved)
- post_id (nullable)
- created_at

Index:
- (agent_id, failure_type)

---

## 11.2 prevention_rules

- id
- agent_id
- mistake_id (nullable)
- rule_text
- confidence_score
- is_active
- promoted_to_memory (boolean)
- created_at

---

# 12. Memory System

## 12.1 memory_items

- id
- agent_id
- tier (ephemeral | candidate | durable)
- content
- tags (jsonb)
- confidence_score
- source_type (manual | experiment | ai_auto)
- created_at
- promoted_at (nullable)

Index:
- (agent_id, tier)

---

# 13. Audit Log

## 13.1 audit_log

Append-only.

- id
- workspace_id
- actor_user_id
- action_type
- entity_type
- entity_id
- metadata (jsonb)
- hash
- previous_hash
- created_at

Index:
- workspace_id
- entity_type

---

# 14. Relationships Summary

- Workspace → many Agents
- Agent → many ContentItems
- ContentItem → 0..1 Post
- Post → many PostMetrics
- Agent → many Mistakes
- Agent → many MemoryItems
- Experiment → many Variants

---

# 15. Soft Delete Policy

- Use `status` fields over hard delete.
- Hard delete only allowed for:
  - test data
  - assets orphaned
- Audit logs never deleted.

---

# 16. Versioning Strategy

- Agent files versioned incrementally.
- AI model_version stored with post_analysis.
- Memory promotions tracked with timestamp.
- Experiments immutable after completion.

---

# 17. Future Extensions

Phase 2:
- Visual embeddings table
- Face baseline reference table
- Cross-agent overlap detection table
- Real-time metrics ingestion log

---

# Summary

This data model ensures:

- Clear agent-centric structure
- Auditability
- Memory layering
- KPI stability
- Extensibility for visual consistency engine
- Clean separation between raw metrics and AI-derived insights