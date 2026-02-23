# 08 — Memory System Specification (Agent Memory + Supermemory Integration)

## Document Control
- Version: 0.1
- Status: Draft
- Last Updated: 2026-02-23
- Owner: Architecture / AI Systems

---

# 1. Purpose

This document defines:

- The agent memory model
- The relationship between database memory and Supermemory
- Memory tiers and lifecycle
- Promotion workflows
- Mistake → prevention → durable knowledge loop
- Memory safety constraints

The memory system must:

- Improve agent consistency over time
- Prevent repeated mistakes
- Support explainable evolution
- Avoid uncontrolled self-modification

---

# 2. Memory Design Principles

1. Agent memory is structured, not freeform.
2. Database is the system of record.
3. Supermemory is the semantic recall layer.
4. Memory must be tiered and gated.
5. Promotion to durable memory must be controlled.
6. Agent identity must not be auto-mutated.

---

# 3. Memory Tiers

The system has 3 tiers of memory.

---

## 3.1 Tier 1 — Ephemeral Memory

Purpose:
- Short-term context
- Session-level logs
- Daily reflections

Examples:
- “Post about skincare performed poorly today.”
- “Retention dropped at 6s.”

Storage:
- memory_items table (tier = ephemeral)
- Supermemory (optional, tagged ephemeral)

Retention:
- Auto-expire after configurable window (e.g., 30 days)

Cannot:
- Modify agent identity
- Modify durable memory

---

## 3.2 Tier 2 — Candidate Memory

Purpose:
- Proposed durable knowledge
- Derived insights from experiments
- Proposed prevention rules

Examples:
- “Hooks framed as questions increase retention.”
- “Avoid bright background for this influencer.”

Storage:
- memory_items table (tier = candidate)
- Supermemory with confidence score

Promotion requires:
- Creator approval OR
- Confidence threshold exceeded

---

## 3.3 Tier 3 — Durable Memory

Purpose:
- Stable, curated knowledge
- Prevention rules
- Core frameworks

Examples:
- “This agent uses calm authority tone.”
- “Never use exaggerated claims.”

Storage:
- agent_files (MEMORY.md)
- memory_items (tier = durable)
- Supermemory (tagged durable)

Durable memory must:
- Be versioned
- Be auditable
- Be human-readable

---

# 4. Agent Brain Structure

Each agent maintains structured memory files:

- SOUL.md
- IDENTITY.md
- USER.md
- MEMORY.md
- ERRORS (structured table)

These files are:

- Editable by Creator role only
- Versioned
- Stored in DB
- Snapshotted during AI context injection

---

# 5. Memory Write Flow

## 5.1 Automatic Write (Ephemeral)

Triggered by:
- KPI anomaly detection
- Experiment completion
- AI strategic summary

Process:
1. Insight generated
2. Stored as ephemeral memory
3. Logged in audit_log

---

## 5.2 Candidate Memory Creation

Triggered by:
- Repeated signal across posts
- Experiment confidence > threshold
- Recurring failure detection

Process:
1. Create candidate memory entry
2. Assign confidence_score
3. Notify Creator for review

---

## 5.3 Promotion to Durable

Triggered by:
- Manual approval
- Confidence threshold rule

Process:
1. Update memory_items tier → durable
2. Append summary to MEMORY.md (new version)
3. Push to Supermemory with durable tag
4. Log promotion in audit_log

---

# 6. Supermemory Integration

## 6.1 Purpose

Supermemory handles:
- Semantic recall
- Embedding storage
- Context retrieval
- Cross-session continuity

Database handles:
- Tier state
- Version control
- Promotion authority

---

## 6.2 Namespacing Strategy

Each memory item must include tags:

- workspace:<id>
- agent:<id>
- tier:<ephemeral|candidate|durable>
- domain:<identity|content|errors|insight>
- platform:<optional>

---

## 6.3 Retrieval Rules

Before AI generation:

1. Load SOUL.md + IDENTITY.md
2. Load active prevention_rules
3. Query Supermemory for:
   - Top 3 relevant durable memories
   - Top 2 relevant candidate memories (if high confidence)
4. Inject only selected memory items

Never:
- Inject entire memory store
- Inject raw error logs
- Inject low-confidence candidates

---

# 7. Mistake → Prevention → Memory Loop

## Step 1: Failure Detection

System detects:
- Visual drift
- Structural drop
- Off-brand topic
- Recurring complaint

Creates:
- mistakes record
- optional candidate prevention_rule

---

## Step 2: Prevention Rule Creation

Prevention rule fields:

- rule_text
- failure_type
- confidence_score
- linked_post_id
- is_active

---

## Step 3: Promotion

If prevention rule effective across posts:

- Promote to durable memory
- Append to MEMORY.md
- Tag in Supermemory

---

# 8. Memory Safety Constraints

The memory system must prevent:

- Self-editing of SOUL.md by AI
- Automatic promotion to durable without validation
- Memory bloat (excessive context injection)
- Contradictory durable memory without review

---

# 9. Conflict Resolution

If two durable memories conflict:

1. Flag inconsistency
2. Notify Creator
3. Require manual resolution
4. Version bump MEMORY.md

---

# 10. Memory Size Limits

To prevent context explosion:

- Durable memory injection max: 1,000 tokens
- Candidate memory injection max: 500 tokens
- Prevention rules injection max: 500 tokens

Supermemory recall must respect token budget.

---

# 11. Memory Versioning

Each durable memory change must:

- Increment version
- Store diff snapshot
- Log in audit_log

Never:
- Mutate previous versions
- Overwrite without record

---

# 12. Audit Logging Requirements

Log:

- Memory creation
- Promotion
- Rejection
- Conflict resolution
- AI context recall

Fields:

- actor_user_id
- memory_id
- action_type
- timestamp
- hash

---

# 13. Expiration & Cleanup

Ephemeral memory:
- Auto-expire after configurable period

Candidate memory:
- Expire if unreviewed after threshold (e.g., 60 days)

Durable memory:
- Never auto-expire
- Must be manually deprecated

---

# 14. UI Alignment (Bento Design)

Memory UI must include:

- Tier filter tabs
- Confidence badges
- Promotion action buttons
- Diff viewer for durable memory
- Prevention rule grouping

Cards should group:

- Recent insights
- Pending promotions
- Active durable rules

---

# 15. Future Extensions

Phase 2:
- Memory embedding quality scoring
- Automatic contradiction detection
- Cross-agent memory comparison
- Memory decay model for outdated insights

---

# Summary

This memory system ensures:

- Structured learning
- Controlled evolution
- Prevented repetition of mistakes
- Durable identity stability
- Safe AI context injection
- Auditable and scalable agent memory