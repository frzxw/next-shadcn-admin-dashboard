# Task Index — AI Agent Creator OS Dashboard

## Document Control
- Generated: 2026-02-23
- Source: specs/ (01–20)
- Authority: specs/02-requirements.md

---

# Folder Tree

```
prompts/tasks/
  00-index.md
  CORE/
    T-CORE-001-database-schema-foundation.md
    T-CORE-002-better-auth-integration.md
    T-CORE-003-dashboard-shell-route-structure.md
    T-CORE-004-tiered-navigation-sidebar.md
    T-CORE-005-global-filter-context.md
    T-CORE-006-home-dashboard-bento-layout.md
    T-CORE-007-kpi-strip-component.md
    T-CORE-008-performance-positioning-matrix.md
    T-CORE-009-alert-panel-home.md
    T-CORE-010-spike-ai-provider-selection.md
    T-CORE-011-spike-analytics-ingestion-sources.md
    T-CORE-012-spike-permission-matrix-finalization.md
  AGENT/
    T-AGENT-001-agent-identity-schema.md
    T-AGENT-002-agent-crud-server-actions.md
    T-AGENT-003-agent-listing-creation-ui.md
    T-AGENT-004-identity-file-editor-versioning.md
    T-AGENT-005-content-pillars-crud.md
    T-AGENT-006-agent-overview-dashboard.md
    T-AGENT-007-persona-integrity-tracking.md
    T-AGENT-008-narrative-alignment-tracking.md
    T-AGENT-009-visual-consistency-dashboard.md
    T-AGENT-010-voice-consistency-metrics.md
  CONTENT/
    T-CONTENT-001-content-posts-schema.md
    T-CONTENT-002-post-metrics-analysis-schema.md
    T-CONTENT-003-content-lifecycle-server-actions.md
    T-CONTENT-004-content-library-data-table.md
    T-CONTENT-005-post-drilldown-panel.md
    T-CONTENT-006-idea-theme-clustering.md
    T-CONTENT-007-multi-part-series-grouping.md
  CAL/
    T-CAL-001-calendar-scheduling-schema.md
    T-CAL-002-calendar-server-actions.md
    T-CAL-003-drag-drop-calendar-ui.md
    T-CAL-004-recurring-posting-slots.md
    T-CAL-005-campaign-grouping.md
    T-CAL-006-cadence-health-indicators.md
  INSIGHT/
    T-INSIGHT-001-kpi-snapshot-aggregation.md
    T-INSIGHT-002-insights-bento-layout.md
    T-INSIGHT-003-retention-overlay-chart.md
    T-INSIGHT-004-hook-score-trend-chart.md
    T-INSIGHT-005-audience-funnel-visualization.md
    T-INSIGHT-006-idea-cluster-bubble-chart.md
    T-INSIGHT-007-longevity-curve-chart.md
    T-INSIGHT-008-export-insight-reports.md
  AUD/
    T-AUD-001-audience-segments-schema.md
    T-AUD-002-loyalty-index-service.md
    T-AUD-003-comment-depth-scoring.md
    T-AUD-004-feedback-theme-detection.md
    T-AUD-005-ai-complaint-detection.md
    T-AUD-006-audience-dashboard-ui.md
  ASSET/
    T-ASSET-001-assets-tags-schema.md
    T-ASSET-002-asset-upload-storage-service.md
    T-ASSET-003-asset-library-ui.md
    T-ASSET-004-visual-similarity-grouping.md
    T-ASSET-005-reference-image-sets.md
    T-ASSET-006-prompt-history-tracking.md
    T-ASSET-007-asset-post-performance-linking.md
  EXP/
    T-EXP-001-experiment-schema.md
    T-EXP-002-experiment-crud-server-actions.md
    T-EXP-003-experiment-creation-ui.md
    T-EXP-004-confidence-score-computation.md
    T-EXP-005-experiment-results-dashboard.md
    T-EXP-006-promote-learning-to-memory.md
  MEMORY/
    T-MEMORY-001-memory-mistakes-schema.md
    T-MEMORY-002-supermemory-adapter.md
    T-MEMORY-003-memory-write-services.md
    T-MEMORY-004-promotion-workflow.md
    T-MEMORY-005-mistakes-failure-taxonomy.md
    T-MEMORY-006-prevention-rule-management.md
    T-MEMORY-007-error-post-insight-linking.md
    T-MEMORY-008-memory-dashboard-ui.md
  AI/
    T-AI-001-orchestrator-provider-adapter.md
    T-AI-002-hook-generation-contract.md
    T-AI-003-hook-generation-server-action.md
    T-AI-004-hook-generation-ui.md
    T-AI-005-outline-generation-contract.md
    T-AI-006-outline-generation-server-action.md
    T-AI-007-outline-generation-ui.md
    T-AI-008-repurposing-suggestions-contract.md
    T-AI-009-repurposing-suggestions-server-action.md
    T-AI-010-repurposing-suggestions-ui.md
    T-AI-011-scoring-contracts.md
    T-AI-012-narrative-alignment-scoring-action.md
    T-AI-013-persona-integrity-scoring-action.md
    T-AI-014-audience-quality-scoring-action.md
    T-AI-015-strategic-summary-contract.md
    T-AI-016-strategic-summary-server-action.md
    T-AI-017-strategic-copilot-panel-ui.md
    T-AI-018-accept-edit-regenerate-ui.md
    T-AI-019-visual-drift-detection-shell.md
    T-AI-020-retention-drop-detection.md
  COLLAB/
    T-COLLAB-001-rbac-policy-helpers.md
    T-COLLAB-002-server-permission-enforcement.md
    T-COLLAB-003-role-gated-ui-components.md
    T-COLLAB-004-member-management-actions.md
    T-COLLAB-005-member-management-ui.md
  AUDIT/
    T-AUDIT-001-audit-log-service.md
    T-AUDIT-002-hash-chaining-tamper-evidence.md
    T-AUDIT-003-ai-action-logging.md
    T-AUDIT-004-identity-edit-logging.md
    T-AUDIT-005-memory-promotion-logging.md
    T-AUDIT-006-experiment-change-logging.md
    T-AUDIT-007-content-mutation-logging.md
  SEC/
    T-SEC-001-platform-token-storage.md
    T-SEC-002-ai-rate-limiting.md
    T-SEC-003-session-validation-middleware.md
  NFR/
    T-NFR-001-responsive-layout-system.md
    T-NFR-002-skeleton-loader-system.md
    T-NFR-003-kpi-snapshot-caching.md
    T-NFR-004-server-component-optimization.md
    T-NFR-005-feature-module-colocation.md
    T-NFR-006-ai-model-versioning-framework.md
    T-NFR-007-idempotent-post-ingestion.md
    T-NFR-008-memory-self-modification-guards.md
```

---

# Epics

----------------------------------------------------
EPIC-ID: EPIC-CORE-001
Title: Foundation & App Shell
Summary: Establish database foundation, auth integration, route structure, tiered navigation, and global filter system for the creator workspace.
Requirements Covered: REQ-CORE-002, REQ-CORE-003 (partial)
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-CORE-002
Title: Home Dashboard
Summary: Build the Home strategic command center with KPI strip, alert panel, performance matrix, and copilot integration point.
Requirements Covered: REQ-CORE-001, REQ-CORE-003, REQ-CORE-004, REQ-CORE-005
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-CORE-003
Title: Spike Investigations
Summary: Resolve open questions around AI provider routing, analytics ingestion sources, and permission matrix before dependent work begins.
Requirements Covered: OQ-001, OQ-002, OQ-003
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-AGENT-001
Title: Agent Entity & Identity Management
Summary: Agent CRUD, structured identity files (SOUL/IDENTITY/USER/MEMORY), versioning, and content pillar definitions.
Requirements Covered: REQ-AGENT-001, REQ-AGENT-002, REQ-AGENT-007, REQ-AGENT-008
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-AGENT-002
Title: Agent Consistency & Scoring Display
Summary: Agent overview dashboard, persona integrity tracking, narrative alignment display, visual consistency shell, and voice consistency metrics.
Requirements Covered: REQ-AGENT-003, REQ-AGENT-004, REQ-AGENT-005, REQ-AGENT-006
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-CONTENT-001
Title: Content Production Pipeline
Summary: Content lifecycle management, content library, post drill-down with retention analysis, idea clustering, and series grouping.
Requirements Covered: REQ-CONTENT-001, REQ-CONTENT-002, REQ-CONTENT-003, REQ-CONTENT-004, REQ-CONTENT-005, REQ-CONTENT-006, REQ-CONTENT-007
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-CAL-001
Title: Calendar & Scheduling
Summary: Drag-and-drop content calendar with weekly/monthly views, recurring slots, campaign grouping, and cadence health indicators.
Requirements Covered: REQ-CAL-001, REQ-CAL-002, REQ-CAL-003, REQ-CAL-004, REQ-CAL-005
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-INSIGHT-001
Title: Analytics & Visualization
Summary: KPI snapshot system, insights bento dashboard with retention overlay, hook score trend, audience funnel, idea clusters, longevity curve, and export functionality.
Requirements Covered: REQ-INSIGHT-001, REQ-INSIGHT-002, REQ-INSIGHT-003, REQ-INSIGHT-004, REQ-INSIGHT-005, REQ-INSIGHT-006, REQ-INSIGHT-007
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-AUD-001
Title: Audience Intelligence
Summary: Audience segmentation, loyalty index, comment depth scoring, feedback theme detection, and AI-complaint pattern detection.
Requirements Covered: REQ-AUD-001, REQ-AUD-002, REQ-AUD-003, REQ-AUD-004, REQ-AUD-005
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-ASSET-001
Title: Media & Brand Asset Management
Summary: Asset library with tags/search, visual similarity grouping, reference image sets, prompt history, and asset-post performance linking.
Requirements Covered: REQ-ASSET-001, REQ-ASSET-002, REQ-ASSET-003, REQ-ASSET-004, REQ-ASSET-005
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-EXP-001
Title: Experimentation Engine
Summary: A/B experiment creation, hypothesis tracking, confidence scoring, results dashboard, and learning promotion to memory.
Requirements Covered: REQ-EXP-001, REQ-EXP-002, REQ-EXP-003, REQ-EXP-004, REQ-EXP-005
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-MEMORY-001
Title: Memory & Learning System
Summary: Memory tier system (ephemeral/candidate/durable), Supermemory integration, promotion workflow, mistakes tracking, failure taxonomy, prevention rules, and memory dashboard.
Requirements Covered: REQ-MEMORY-001, REQ-MEMORY-002, REQ-MEMORY-003, REQ-MEMORY-004, REQ-MEMORY-005, REQ-MEMORY-006, REQ-MEMORY-007
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-AI-001
Title: AI Generation Layer
Summary: AI orchestration infrastructure, hook/outline/repurposing generation with contracts, server actions, and UI integration including accept/edit/regenerate workflow.
Requirements Covered: REQ-AI-001, REQ-AI-002, REQ-AI-003, REQ-AI-007, REQ-AI-008
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-AI-002
Title: AI Scoring Layer
Summary: Scoring contracts and server actions for narrative alignment, persona integrity, audience quality, structural retention drop detection, and Phase 2 visual drift shell.
Requirements Covered: REQ-AI-004, REQ-AI-005, REQ-AI-006, REQ-AI-009, REQ-AI-010
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-COLLAB-001
Title: RBAC & Permissions
Summary: Role-based access control with policy helpers, server enforcement, UI gating, and workspace member management.
Requirements Covered: REQ-COLLAB-001, REQ-COLLAB-002, REQ-COLLAB-003, REQ-COLLAB-004, REQ-COLLAB-005
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-AUDIT-001
Title: Audit & Traceability
Summary: Append-only audit log system with hash-chaining, specialized logging for AI actions, identity edits, memory, experiments, and content mutations.
Requirements Covered: REQ-AUDIT-001, REQ-AUDIT-002, REQ-AUDIT-003, REQ-AUDIT-004
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-SEC-001
Title: Security Infrastructure
Summary: Secure platform token storage, AI rate limiting, and session validation middleware.
Requirements Covered: REQ-NFR-003, REQ-NFR-009
----------------------------------------------------

----------------------------------------------------
EPIC-ID: EPIC-NFR-001
Title: Performance, Quality & Scalability
Summary: Responsive layout system, skeleton loaders, caching, server component optimization, module colocation, AI versioning, idempotent ingestion, and memory safety guards.
Requirements Covered: REQ-NFR-001, REQ-NFR-002, REQ-NFR-004, REQ-NFR-005, REQ-NFR-006, REQ-NFR-007, REQ-NFR-008, REQ-NFR-010
----------------------------------------------------

---

# Task Summary by Area

| Area | Count | Task IDs |
|------|-------|----------|
| CORE | 12 | T-CORE-001 – T-CORE-012 |
| AGENT | 10 | T-AGENT-001 – T-AGENT-010 |
| CONTENT | 7 | T-CONTENT-001 – T-CONTENT-007 |
| CAL | 6 | T-CAL-001 – T-CAL-006 |
| INSIGHT | 8 | T-INSIGHT-001 – T-INSIGHT-008 |
| AUD | 6 | T-AUD-001 – T-AUD-006 |
| ASSET | 7 | T-ASSET-001 – T-ASSET-007 |
| EXP | 6 | T-EXP-001 – T-EXP-006 |
| MEMORY | 8 | T-MEMORY-001 – T-MEMORY-008 |
| AI | 20 | T-AI-001 – T-AI-020 |
| COLLAB | 5 | T-COLLAB-001 – T-COLLAB-005 |
| AUDIT | 7 | T-AUDIT-001 – T-AUDIT-007 |
| SEC | 3 | T-SEC-001 – T-SEC-003 |
| NFR | 8 | T-NFR-001 – T-NFR-008 |
| **Total** | **113** | |

---

# Dependency Graph (High-Level)

```
Phase 0 — Foundation:
  T-CORE-001 (DB schema)
    → T-CORE-002 (Auth)
    → T-COLLAB-001 (RBAC helpers)
      → T-COLLAB-002 (Server enforcement)
    → T-AUDIT-001 (Audit service)
      → T-AUDIT-002 (Hash chaining)
    → T-SEC-003 (Session middleware)
    → T-CORE-003 (Dashboard shell)
      → T-CORE-004 (Sidebar nav)

Phase 0.5 — Entity Schemas:
  T-AGENT-001 (Agent schema)
  T-CONTENT-001, T-CONTENT-002 (Content schemas)
  T-MEMORY-001 (Memory schema)
  T-EXP-001 (Experiment schema)
  T-ASSET-001 (Asset schema)

Phase 1 — Services:
  T-AGENT-002 (Agent CRUD) → T-AGENT-003 (UI)
  T-CONTENT-003 (Content actions) → T-CONTENT-004 (UI)
  T-AI-001 (Orchestrator) → T-AI-002..020 (AI features)
  T-MEMORY-002 (Supermemory) → T-MEMORY-003..007 (Memory services)
  T-INSIGHT-001 (KPI snapshots) → T-INSIGHT-002..008 (Insight UI)

Phase 2 — UI & Integration:
  All UI tasks depend on their respective schemas + services
  AI UI tasks depend on corresponding server actions
  Dashboard tasks depend on KPI + filter infrastructure
```

---

# Recommended Execution Order

1. **Spikes**: T-CORE-010, T-CORE-011, T-CORE-012
2. **Foundation**: T-CORE-001, T-CORE-002, T-SEC-003, T-COLLAB-001, T-COLLAB-002, T-AUDIT-001, T-AUDIT-002
3. **Shell**: T-CORE-003, T-CORE-004, T-CORE-005, T-NFR-001, T-NFR-002
4. **Entity Schemas**: T-AGENT-001, T-CONTENT-001, T-CONTENT-002, T-MEMORY-001, T-EXP-001, T-ASSET-001, T-CAL-001, T-AUD-001, T-INSIGHT-001
5. **RBAC + Audit Integrations**: T-COLLAB-003, T-COLLAB-004, T-COLLAB-005, T-AUDIT-003..007
6. **Core Services**: T-AGENT-002, T-CONTENT-003, T-AI-001, T-MEMORY-002, T-MEMORY-003..007, T-EXP-002, T-CAL-002, T-AUD-002..005, T-ASSET-002
7. **AI Contracts + Actions**: T-AI-002..020
8. **UI Build**: All remaining UI tasks
9. **NFR Hardening**: T-NFR-003..008, T-SEC-001, T-SEC-002

---

# Requirement Coverage Table

| Requirement ID | Task IDs Covering It |
|---|---|
| REQ-CORE-001 | T-CORE-006, T-CORE-007, T-CORE-009 |
| REQ-CORE-002 | T-CORE-001, T-CORE-003, T-AGENT-001 |
| REQ-CORE-003 | T-CORE-005 |
| REQ-CORE-004 | T-CORE-008 |
| REQ-CORE-005 | T-CORE-009 |
| REQ-AGENT-001 | T-AGENT-001, T-AGENT-002, T-AGENT-003 |
| REQ-AGENT-002 | T-AGENT-001, T-AGENT-004 |
| REQ-AGENT-003 | T-AGENT-007 |
| REQ-AGENT-004 | T-AGENT-008 |
| REQ-AGENT-005 | T-AGENT-009 |
| REQ-AGENT-006 | T-AGENT-010 |
| REQ-AGENT-007 | T-AGENT-004, T-AUDIT-004 |
| REQ-AGENT-008 | T-AGENT-005 |
| REQ-CONTENT-001 | T-CONTENT-001, T-CONTENT-003 |
| REQ-CONTENT-002 | T-CONTENT-004 |
| REQ-CONTENT-003 | T-CONTENT-005 |
| REQ-CONTENT-004 | T-CONTENT-001, T-CONTENT-003 |
| REQ-CONTENT-005 | T-CONTENT-006 |
| REQ-CONTENT-006 | T-CONTENT-007 |
| REQ-CONTENT-007 | T-AI-020, T-CONTENT-005 |
| REQ-CAL-001 | T-CAL-003 |
| REQ-CAL-002 | T-CAL-002, T-CAL-003 |
| REQ-CAL-003 | T-CAL-004 |
| REQ-CAL-004 | T-CAL-006 |
| REQ-CAL-005 | T-CAL-005 |
| REQ-INSIGHT-001 | T-INSIGHT-001, T-CORE-007 |
| REQ-INSIGHT-002 | T-INSIGHT-003 |
| REQ-INSIGHT-003 | T-INSIGHT-004 |
| REQ-INSIGHT-004 | T-INSIGHT-005 |
| REQ-INSIGHT-005 | T-INSIGHT-006 |
| REQ-INSIGHT-006 | T-INSIGHT-007 |
| REQ-INSIGHT-007 | T-INSIGHT-008 |
| REQ-AUD-001 | T-AUD-001 |
| REQ-AUD-002 | T-AUD-002 |
| REQ-AUD-003 | T-AUD-003 |
| REQ-AUD-004 | T-AUD-004 |
| REQ-AUD-005 | T-AUD-005 |
| REQ-ASSET-001 | T-ASSET-001, T-ASSET-003 |
| REQ-ASSET-002 | T-ASSET-004 |
| REQ-ASSET-003 | T-ASSET-005 |
| REQ-ASSET-004 | T-ASSET-006 |
| REQ-ASSET-005 | T-ASSET-007 |
| REQ-EXP-001 | T-EXP-001, T-EXP-002, T-EXP-003 |
| REQ-EXP-002 | T-EXP-001, T-EXP-003 |
| REQ-EXP-003 | T-EXP-004 |
| REQ-EXP-004 | T-EXP-005 |
| REQ-EXP-005 | T-EXP-006 |
| REQ-MEMORY-001 | T-MEMORY-001, T-MEMORY-008 |
| REQ-MEMORY-002 | T-MEMORY-003 |
| REQ-MEMORY-003 | T-MEMORY-004 |
| REQ-MEMORY-004 | T-MEMORY-005 |
| REQ-MEMORY-005 | T-MEMORY-005 |
| REQ-MEMORY-006 | T-MEMORY-007 |
| REQ-MEMORY-007 | T-MEMORY-006 |
| REQ-AI-001 | T-AI-002, T-AI-003, T-AI-004 |
| REQ-AI-002 | T-AI-005, T-AI-006, T-AI-007 |
| REQ-AI-003 | T-AI-008, T-AI-009, T-AI-010 |
| REQ-AI-004 | T-AI-011, T-AI-012 |
| REQ-AI-005 | T-AI-011, T-AI-013 |
| REQ-AI-006 | T-AI-011, T-AI-014 |
| REQ-AI-007 | T-AI-015, T-AI-016, T-AI-017 |
| REQ-AI-008 | T-AI-018 |
| REQ-AI-009 | T-AI-019 |
| REQ-AI-010 | T-AI-020 |
| REQ-COLLAB-001 | T-COLLAB-001, T-COLLAB-003 |
| REQ-COLLAB-002 | T-COLLAB-002 |
| REQ-COLLAB-003 | T-COLLAB-002, T-COLLAB-003 |
| REQ-COLLAB-004 | T-COLLAB-002 |
| REQ-COLLAB-005 | T-COLLAB-003 |
| REQ-AUDIT-001 | T-AUDIT-001, T-AUDIT-003 |
| REQ-AUDIT-002 | T-AUDIT-004 |
| REQ-AUDIT-003 | T-AUDIT-006 |
| REQ-AUDIT-004 | T-AUDIT-005 |
| REQ-NFR-001 | T-NFR-001 |
| REQ-NFR-002 | T-NFR-002, T-NFR-003, T-NFR-004 |
| REQ-NFR-003 | T-SEC-003, T-COLLAB-002 |
| REQ-NFR-004 | T-NFR-005 |
| REQ-NFR-005 | T-NFR-007 |
| REQ-NFR-006 | T-NFR-006 |
| REQ-NFR-007 | T-AUDIT-002 |
| REQ-NFR-008 | T-CORE-001, T-AGENT-001 |
| REQ-NFR-009 | T-SEC-001 |
| REQ-NFR-010 | T-NFR-008 |

**All requirements covered. No missing coverage.**
