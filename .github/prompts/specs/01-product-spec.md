# Product Spec — AI Agent Creator OS

## Document Control
- Version: 0.2 (Expanded Architecture Draft)
- Status: Proposed
- Last Updated: 2026-02-23
- Owner: Product / Architecture

---

# 1. Product Intent

Build a centralized **AI Agent Creator Operating System** where operators manage:

- AI avatars (agents)
- Identity consistency (visual + tonal)
- Content production pipeline
- Strategic performance insights
- Learning loops (mistakes → memory → prevention)
- Cross-agent portfolio intelligence

This is not just a creator dashboard.

It is:

> Strategic Intelligence Layer for Autonomous Content Agents.

---

# 2. Problem Statement

AI-native creators face unique challenges:

## 2.1 Visual Identity Drift
AI influencers suffer from:
- Facial inconsistency
- Body proportion drift
- Lighting / realism instability

Breaks immersion → damages trust.

## 2.2 AI Video Uncanny Effects
Educational agents suffer from:
- Lip-sync issues
- Motion artifacts
- Robotic tone
- Structural retention drops

Audience trust erodes fast.

## 2.3 High Output, Low Strategy
AI enables scale:
- 3–10 posts/day
- Multiple avatars
- No compounding structure

Leads to:
- Saturation
- Drift
- Low audience loyalty

## 2.4 Lack of Strategic Insight
Most dashboards show:
- Views
- Engagement
- Followers

They do NOT show:
- Persona integrity
- Narrative alignment
- Idea compounding
- Audience depth

---

# 3. Vision Scope

Deliver a system that:

- Manages AI agents as structured entities
- Tracks visual + identity consistency
- Measures positioning vs performance
- Detects recurring mistakes
- Creates durable learning memory
- Enables strategic scheduling and experimentation
- Supports multi-agent portfolio management

---

# 4. Information Architecture (Tiered Navigation)

## Tier 1 Navigation (Primary Sidebar)

1. Home
2. Agents
3. Content
4. Calendar
5. Insights
6. Audience
7. Assets
8. Experiments
9. Memory
10. Settings

---

# 5. Module Specifications

---

# 5.1 HOME

## Purpose
Strategic command center.

## Features
- KPI Strip per agent:
  - Growth Rate
  - Avg Retention
  - Returning Viewer %
  - Narrative Alignment
  - Persona Integrity
  - Audience Quality
- Performance vs Positioning Matrix
- Critical Alerts:
  - Visual Drift
  - Tone Drift
  - Saturation
  - Uncanny Risk
- Strategic Copilot Panel
- Weekly Focus Summary

---

# 5.2 AGENTS

## Tier 2 Structure
- Overview
- Identity
- Consistency
- Performance
- Mistakes
- Evolution

---

## Identity
(OpenClaw-style agent brain UI)

Editable:
- SOUL.md
- IDENTITY.md
- USER.md
- Pillars definition

Preview:
- Public persona voice
- Tone calibration
- Positioning summary

---

## Consistency

### Visual Consistency Engine (Influencer Agents)

Metrics:
- Face similarity score (embedding-based)
- Body proportion stability
- Style coherence (lighting/background consistency)
- Drift alerts

Reference Image Set Manager included.

---

### Voice Consistency Engine (Educator Agents)

Metrics:
- Tone stability
- Formality drift
- Vocabulary deviation
- Claim contradiction detection

---

## Performance
- Retention overlays
- Hook score trend
- Format performance breakdown
- Platform comparison

---

## Mistakes
(ERRORS.md interface)

- Failure type breakdown
- Recurrence rate
- Impact on performance
- Prevention rule library
- Resolved vs Active flags

Failure Taxonomy:
- VISUAL_IDENTITY_DRIFT
- LIP_SYNC_UNCANNY
- STYLE_INCONSISTENCY
- OFF_BRAND_TOPIC
- STRUCTURAL_RETENTION_DROP
- FACTUAL_ERROR

---

## Evolution
- Narrative timeline
- Idea compounding map
- Persona shift history
- Major pivot tracking

---

# 5.3 CONTENT

## Tier 2
- Library
- Drafts
- Post Analysis
- Series
- Templates

---

## Library
Post table with:
- Performance metrics
- Alignment score
- Integrity score
- Audience Quality score
- Cluster tag
- Status

---

## Drafts
- Script editor
- Versioning
- AI hook generator
- Outline generator
- Repurposing suggestions
- Risk flags

---

## Post Analysis
- Retention graph + annotations
- Drop-off explanations
- Audience depth breakdown
- Visual drift indicator
- Mistake auto-detection

---

## Series
- Multi-part arc builder
- Framework tracker
- Completion progress
- Calendar integration

---

# 5.4 CALENDAR

## Tier 2
- Monthly View
- Weekly View
- Campaigns
- Cadence Health

---

## Core Features
- Drag & drop scheduling
- Agent assignment
- Platform selection
- Status lanes:
  Idea → Draft → Review → Scheduled → Published → Reviewed
- Recurring slots

---

## Campaign Management
- Themed arcs
- Product launches
- Seasonal planning

---

## Cadence Health
- Posting consistency score
- Overposting alerts
- Burnout detection
- Strategic gap detection

---

# 5.5 INSIGHTS

## Tier 2
- Performance
- Positioning
- Audience Quality
- Compounding
- Longevity
- Matrix

---

## Core Charts
- Retention overlay
- Hook score trend
- Narrative alignment trend
- Persona integrity trend
- Audience funnel
- Loyalty growth chart
- Idea cluster bubble chart
- Longevity curve
- Performance vs Alignment matrix

---

# 5.6 AUDIENCE

## Tier 2
- Segments
- Loyalty
- Behavior
- Feedback

---

## Segments
- New vs Returning
- High-depth commenters
- Trend traffic vs core audience

---

## Feedback
- Comment clustering
- Sentiment trends
- “AI-looking” complaint detector

---

# 5.7 ASSETS

## Tier 2
- Media Vault
- Brand Kit
- Reference Library
- Prompt History

---

## Media Vault
- Image/video storage
- Visual similarity grouping
- Face reference sets

---

## Prompt History
- Prompt version tracking
- Output comparison
- Performance correlation

---

# 5.8 EXPERIMENTS

## Tier 2
- A/B Tests
- Hypotheses
- Results
- Learnings

---

## Features
- Variant comparison
- Statistical confidence score
- Auto-write insights to ERRORS.md
- Promote learning to memory queue

---

# 5.9 MEMORY

Supermemory integration UI.

## Tier 2
- Durable Memory
- Daily Logs
- Pending Promotions
- Error Memory
- Decision Log

---

## Memory Policy

3-tier system:

1. Ephemeral (daily logs)
2. Candidate Durable
3. Approved Durable (MEMORY.md)

Promotion requires:
- Repetition signal OR
- Operator approval

---

# 6. MVP Scope

## Must Ship (V1)
- Tiered nav
- Home dashboard
- Agents (Identity + Consistency + Performance)
- Content library + Post analysis
- Calendar (basic drag & drop)
- Core Insights (6 charts)
- Mistakes tracking
- Memory UI (read-only)

---

## Phase 2
- Visual embedding-based drift detection
- Advanced experiment engine
- Cross-agent cannibalization detection
- Supermemory write-back automation
- Multi-platform ingestion

---

# 7. User Roles

- Creator / Operator (Full Control)
- Editor (Content + Calendar access)
- Analyst (Insights read-only)
- Viewer (Snapshot only)

---

# 8. Core User Flows

## Influencer Drift Detection
1. Post published
2. Visual consistency score drops
3. Alert appears on Home
4. Mistake auto-created
5. Prevention rule added
6. Future generation references prevention rule

## Educator Retention Optimization
1. Retention drop detected
2. Structural shift flagged
3. Hook rewrite suggested
4. Variant tested
5. Experiment recorded
6. Insight promoted to memory

## Multi-Agent Strategy
1. Operator compares agents
2. Alignment vs Performance evaluated
3. Copilot suggests experiment
4. Calendar updated with test plan

---

# 9. Success Metrics

- Persona Integrity Stability (rolling 30d)
- Audience Loyalty Growth %
- Compounding Score growth
- Error recurrence reduction
- Experiment learning velocity
- Time-to-insight reduction

---

# 10. Technical Constraints

- Preserve Next.js App Router + TypeScript architecture
- Reuse `src/components/ui`
- Modular feature-based folder structure
- Analytics precomputed server-side
- Future vector store integration
- Strict Spec-Driven Development compliance