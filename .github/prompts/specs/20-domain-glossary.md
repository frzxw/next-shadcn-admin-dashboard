# 20 — Domain Glossary

## Document Control
- Version: 0.1
- Status: Draft
- Last Updated: 2026-02-23
- Owner: Product / Architecture

---

# 1. Purpose

This glossary defines core terminology used across:

- Product specifications
- Architecture documents
- KPI definitions
- Memory system
- AI contracts
- Visual consistency engine
- Experimentation framework

This document prevents semantic drift and ensures shared understanding across engineering, product, and design.

---

# 2. Core System Concepts

## Agent

An AI-managed creator persona with:

- Identity files (SOUL, IDENTITY, USER, MEMORY)
- Content pipeline
- Metrics
- Experiments
- Memory system
- Visual profile (if influencer-type)

An Agent is the primary strategic unit of the system.

---

## Workspace

A container for:

- Users
- Agents
- Analytics
- Experiments
- Memory
- Audit logs

All entities are scoped to a workspace.

---

## Persona

The externally visible personality of an agent, expressed through:

- Tone
- Visual identity
- Content pillars
- Behavioral constraints

Persona stability is measured by Integrity Score.

---

## SOUL.md

The behavioral rule file defining:

- Non-negotiable constraints
- Tone principles
- Ethical boundaries
- Brand posture

Only editable by Creator role.

---

## IDENTITY.md

The structured persona description including:

- Positioning
- Target audience
- Voice style
- Content focus

---

## USER.md

Operational preferences for the human operator, including:

- Workflow preferences
- Default content formats
- Platform priorities

---

## MEMORY.md

Curated durable memory file containing:

- Reinforced strategic learnings
- Prevention rules
- Core patterns

Versioned and auditable.

---

# 3. KPI & Strategy Terms

## Narrative Alignment Score

A 0–100 score measuring how closely a post aligns with defined content pillars and positioning.

Low score = content drift.

---

## Persona Integrity Score

A 0–100 score measuring identity consistency across tone, stance, and style.

Low score = identity instability.

---

## Audience Quality Score

A 0–100 score reflecting depth of engagement, not raw reach.

Based on:
- Loyalty
- Saves
- Shares
- Comment depth

---

## Compounding Score

A 0–100 metric measuring idea evolution and reinforcement over time.

Indicates strategic content layering.

---

## Saturation Index

A 0–100 metric measuring repetition without meaningful evolution.

High score = content redundancy risk.

---

## Loyalty Index

Composite metric measuring repeat engagement and returning viewers.

---

## Longevity Index

Metric measuring evergreen strength of content over time.

---

# 4. Memory System Terms

## Ephemeral Memory

Short-term memory entries that:

- Expire automatically
- Are not injected permanently
- Represent transient insights

---

## Candidate Memory

Proposed durable memory entries requiring approval or confidence threshold.

---

## Durable Memory

Approved, stable memory integrated into MEMORY.md and injected into AI context.

---

## Memory Promotion

The process of moving a candidate memory to durable tier.

Requires Creator approval (MVP).

---

## Prevention Rule

A structured rule derived from repeated failures or experiments, designed to prevent recurring mistakes.

---

## Memory Conflict

A contradiction between two durable memory entries requiring manual resolution.

---

# 5. Experimentation Terms

## Hypothesis

A structured statement defining:

- Variable being tested
- Expected outcome
- Success metric

---

## Variant

A content variation within an experiment.

---

## Performance Index

Normalized metric comparing variant performance relative to baseline.

---

## Confidence Score

Measure of reliability of experiment result.

---

## Experiment Lifecycle

Stages:

- Proposed
- Active
- Completed
- Archived

---

# 6. Visual Consistency Terms

## Baseline Reference

Approved visual representation used as standard for comparison.

---

## Face Similarity Score

Similarity metric comparing current face embedding to baseline.

---

## Body Stability Score

Variance-based measure of body landmark consistency.

---

## Style Similarity

Similarity of lighting, color palette, and background signature.

---

## Visual Integrity Score

Composite score measuring overall visual stability.

---

## Drift Event

A detected deviation beyond acceptable threshold.

---

# 7. Alerting Terms

## Severity

Level of urgency:

- Info
- Warning
- Critical

---

## Alert Lifecycle

States:

- New
- Acknowledged
- Resolved
- Archived

---

## Alert Fatigue

Overexposure to alerts leading to user desensitization.

System must actively prevent this.

---

# 8. AI System Terms

## AI Orchestrator

Server-side layer responsible for:

- Model routing
- Context injection
- Trace logging
- Output normalization

---

## Prompt Version

Identifier tracking evolution of AI instructions.

---

## Trace Metadata

Structured data attached to every AI response:

- Model
- Provider
- Latency
- Prompt hash
- Actor

---

## Context Injection

Process of injecting:

- Identity files
- Prevention rules
- Memory
- Relevant insights

Into AI prompt.

---

# 9. Analytics Terms

## Ingestion

Process of importing platform metrics into normalized schema.

---

## Snapshot

Precomputed KPI summary stored per day per agent.

---

## Backfill

Historical ingestion of older data after connection.

---

# 10. Risk & Governance Terms

## Identity Corruption

Unauthorized or unstable mutation of persona rules.

---

## Over-Automation

Excessive system autonomy leading to loss of operator control.

---

## Drift Accumulation

Gradual identity or visual deviation over time.

---

## Audit Log

Append-only record of system mutations and AI actions.

---

# 11. Product Strategy Terms

## Agent OS

The system acting as an operating layer for AI-managed creator identities.

---

## Portfolio Intelligence

Cross-agent strategic optimization and analytics.

---

## Strategic Copilot

AI-generated summary suggesting:

- Double-down actions
- Risk mitigation
- Experiments
- Strategic shifts

---

# 12. Reserved Terms (Future Expansion)

- Cross-Agent Cannibalization
- Memory Decay Model
- Autonomous Suggestion Engine
- Strategic Health Index
- Portfolio Drift

These terms may be defined in future versions.

---

# Summary

This glossary ensures:

- Shared vocabulary
- Reduced ambiguity
- Clear system semantics
- Stable cross-team communication
- Long-term domain integrity