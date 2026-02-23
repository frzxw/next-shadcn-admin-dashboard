# Requirements Baseline — AI Agent Creator OS Dashboard

## Requirement Format
Use IDs for traceability: `REQ-<AREA>-<NUMBER>`.

Areas:
- CORE
- AGENT
- CONTENT
- CAL
- INSIGHT
- AUD
- ASSET
- EXP
- MEMORY
- AI
- COLLAB
- AUDIT
- SEC
- NFR

---

# Functional Requirements

---

## CORE (Global System)

- REQ-CORE-001: System must provide a Home dashboard displaying prioritized alerts, agent KPIs, and strategic recommendations.
- REQ-CORE-002: System must support multi-agent management within a single workspace.
- REQ-CORE-003: System must allow filtering dashboard views by agent, platform, and date range.
- REQ-CORE-004: System must display a Performance vs Positioning matrix visualization.
- REQ-CORE-005: System must surface high-priority alerts (e.g., drift, saturation, uncanny risk).

---

## AGENT (AI Avatar Management)

- REQ-AGENT-001: System must allow creation, editing, and deletion of AI agents.
- REQ-AGENT-002: System must support structured agent identity files (SOUL, IDENTITY, USER, MEMORY).
- REQ-AGENT-003: System must track Persona Integrity score per agent over time.
- REQ-AGENT-004: System must detect and display narrative alignment score per agent and per post.
- REQ-AGENT-005: System must provide Visual Consistency metrics for influencer-type agents.
- REQ-AGENT-006: System must provide Voice Consistency metrics for educator/commentary agents.
- REQ-AGENT-007: System must log agent identity modifications with version history.
- REQ-AGENT-008: System must allow defining content pillars per agent.

---

## CONTENT (Production Pipeline)

- REQ-CONTENT-001: System must support content lifecycle states:
  idea → draft → review → scheduled → published → reviewed.
- REQ-CONTENT-002: System must provide a content library with sortable performance metrics.
- REQ-CONTENT-003: System must allow post drill-down view with retention graph and AI annotations.
- REQ-CONTENT-004: System must associate posts with agents and platforms.
- REQ-CONTENT-005: System must cluster posts into idea/theme groups.
- REQ-CONTENT-006: System must support multi-part series grouping.
- REQ-CONTENT-007: System must detect structural retention drop points.

---

## CAL (Calendar & Planning)

- REQ-CAL-001: System must provide drag-and-drop content calendar (weekly & monthly views).
- REQ-CAL-002: System must allow assignment of agent and platform to scheduled content.
- REQ-CAL-003: System must support recurring posting slots.
- REQ-CAL-004: System must display posting cadence health indicators.
- REQ-CAL-005: System must support campaign grouping of calendar items.

---

## INSIGHT (Analytics & Visualization)

- REQ-INSIGHT-001: System must provide KPI strip including:
  Growth, Retention, Returning %, Alignment, Integrity, Audience Quality.
- REQ-INSIGHT-002: System must provide retention overlay chart.
- REQ-INSIGHT-003: System must provide hook score trend visualization.
- REQ-INSIGHT-004: System must provide audience funnel visualization.
- REQ-INSIGHT-005: System must provide idea cluster bubble chart.
- REQ-INSIGHT-006: System must provide longevity curve (7/14/30 day tail).
- REQ-INSIGHT-007: System must allow exporting insight reports.

---

## AUD (Audience Intelligence)

- REQ-AUD-001: System must segment audience into new vs returning viewers.
- REQ-AUD-002: System must compute audience loyalty index.
- REQ-AUD-003: System must compute comment depth score.
- REQ-AUD-004: System must detect repeated audience feedback themes.
- REQ-AUD-005: System must detect “AI-looking” complaint patterns in comments.

---

## ASSET (Media & Brand Management)

- REQ-ASSET-001: System must provide asset library browsing with tags and search.
- REQ-ASSET-002: System must support visual similarity grouping for assets.
- REQ-ASSET-003: System must allow defining reference image sets per agent.
- REQ-ASSET-004: System must track prompt history and associated outputs.
- REQ-ASSET-005: System must associate assets with posts and performance.

---

## EXP (Experiments & Optimization)

- REQ-EXP-001: System must support A/B experiment creation.
- REQ-EXP-002: System must track hypothesis statements per experiment.
- REQ-EXP-003: System must compute experiment confidence score.
- REQ-EXP-004: System must store experiment learnings.
- REQ-EXP-005: System must allow promoting experiment learnings to memory queue.

---

## MEMORY (Learning & Recall System)

- REQ-MEMORY-001: System must display structured durable memory per agent.
- REQ-MEMORY-002: System must store daily logs (ephemeral memory).
- REQ-MEMORY-003: System must support candidate memory promotion workflow.
- REQ-MEMORY-004: System must log structured errors (ERRORS.md equivalent).
- REQ-MEMORY-005: System must classify errors by failure taxonomy.
- REQ-MEMORY-006: System must link errors to related posts and insights.
- REQ-MEMORY-007: System must support prevention rule management.

---

## AI (Copilot & Automation)

- REQ-AI-001: System must provide AI-assisted title and hook generation.
- REQ-AI-002: System must provide AI-assisted outline generation.
- REQ-AI-003: System must provide repurposing suggestions across formats.
- REQ-AI-004: System must provide narrative alignment scoring per post.
- REQ-AI-005: System must provide persona integrity scoring per post.
- REQ-AI-006: System must provide audience quality scoring per post.
- REQ-AI-007: System must generate weekly strategic recommendations.
- REQ-AI-008: System must allow accept/edit/regenerate actions on AI outputs.
- REQ-AI-009: System must detect visual identity drift (Phase 2).
- REQ-AI-010: System must detect structural retention drop causes.

---

## COLLAB (Roles & Permissions)

- REQ-COLLAB-001: System must support role-based visibility:
  Creator / Operator, Editor, Analyst, Viewer.
- REQ-COLLAB-002: System must restrict identity editing to Creator role.
- REQ-COLLAB-003: System must allow Editor to manage drafts and calendar.
- REQ-COLLAB-004: System must restrict memory promotion approval to Creator.
- REQ-COLLAB-005: System must support read-only insights access for Viewer.

---

## AUDIT (Traceability)

- REQ-AUDIT-001: System must log key AI actions:
  prompt, model, timestamp, actor, version.
- REQ-AUDIT-002: System must log identity file edits with diff history.
- REQ-AUDIT-003: System must log experiment changes.
- REQ-AUDIT-004: System must log memory promotions and rejections.

---

# Non-Functional Requirements

- REQ-NFR-001: Preserve responsive behavior across desktop/tablet/mobile.
- REQ-NFR-002: Maintain low perceived latency (<2s dashboard load target).
- REQ-NFR-003: Prevent unauthorized access to role-gated content.
- REQ-NFR-004: Keep feature modules modular and colocated by route groups.
- REQ-NFR-005: Ensure idempotent ingestion of post data.
- REQ-NFR-006: Version AI scoring models and store model_version with outputs.
- REQ-NFR-007: Ensure audit logs are tamper-evident.
- REQ-NFR-008: Ensure scalability to support multiple agents per workspace.
- REQ-NFR-009: Protect platform tokens and credentials using secure storage.
- REQ-NFR-010: Ensure memory system prevents uncontrolled self-modification.

---

# Open Questions

- OQ-001: Which AI provider(s) and routing policy will be used for scoring vs generation?
- OQ-002: Which analytics ingestion sources will power retention and engagement metrics?
- OQ-003: What is the exact permission matrix for each role across modules?
- OQ-004: Will visual drift detection be implemented in MVP or Phase 2?
- OQ-005: What is the memory promotion confidence threshold?
- OQ-006: What is the statistical threshold for experiment confidence score?