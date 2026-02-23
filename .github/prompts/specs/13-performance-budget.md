# 13 — Performance Budget & Scalability Specification

## Document Control
- Version: 0.1
- Status: Draft
- Last Updated: 2026-02-23
- Owner: Architecture / Platform

---

# 1. Purpose

This document defines performance targets, scalability constraints, and architectural guardrails for the AI Agent Creator OS.

The system must:

- Feel fast under dashboard-heavy workloads
- Scale across multiple agents per workspace
- Handle AI + analytics workloads efficiently
- Avoid UI jitter or blocking
- Support future growth without re-architecture

Performance is a product feature.

---

# 2. Performance Philosophy

1. Perceived speed matters more than raw speed.
2. Precompute whenever possible.
3. Never block UI for background analytics.
4. Stream long-running AI responses.
5. Cache expensive computations.
6. Separate write-heavy and read-heavy paths.

---

# 3. Core Performance Targets (MVP)

## 3.1 Dashboard Load

Home Dashboard:
- First meaningful paint: < 2 seconds
- Fully interactive: < 3 seconds

Agent Overview:
- < 1.5 seconds with cached KPI snapshots

Post Drill-Down:
- < 1.5 seconds if analysis precomputed

---

## 3.2 AI Generation

Hook generation:
- First token: < 1.5 seconds
- Full output: < 5 seconds

Strategic summary:
- < 6 seconds (streamed)

Scoring:
- < 2 seconds per post (async preferred)

---

## 3.3 Visual Consistency Engine

Embedding extraction:
- < 3 seconds per image (async)

Drift scoring:
- < 500ms per comparison

Must not block publishing.

---

# 4. Performance Budget Allocation

## 4.1 Server-Side

- DB query: < 200ms
- AI orchestration overhead: < 100ms
- Aggregation queries: < 400ms

---

## 4.2 Client-Side

- Hydration budget: minimal (server components preferred)
- Chart rendering: < 300ms
- No heavy computation in browser

---

# 5. Caching Strategy

## 5.1 Snapshot Tables

Use precomputed tables:

- agent_kpi_snapshots
- experiment_summary_cache
- retention_curve_cache

Refresh:
- Nightly
- Or event-triggered (new post)

---

## 5.2 Memory Recall Caching

Cache:
- Top durable memory embeddings
- Prevention rules list

Invalidate on:
- Memory promotion
- Identity change

---

## 5.3 API Caching

Cache read-heavy endpoints:
- Insights dashboard
- Agent KPI trend

Use short TTL (e.g., 5–15 min) for active workspaces.

---

# 6. Background Job Strategy

Use job queue for:

- Visual embedding extraction
- Drift detection
- KPI aggregation
- Experiment confidence calculation
- Comment clustering

Queue must:
- Support retry
- Log failure
- Avoid blocking user interaction

---

# 7. Database Scalability

## 7.1 Indexing Requirements

Indexes required for:

- (agent_id, snapshot_date)
- (post_id, snapshot_date)
- (agent_id, tier) for memory
- (workspace_id, created_at) for audit

---

## 7.2 Partition Strategy (Future)

If scale grows:

- Partition post_metrics by date
- Partition audit_log by workspace
- Archive old ephemeral memory

---

# 8. AI Cost & Token Budget

## 8.1 Token Control

Memory injection limits:
- Durable memory ≤ 1000 tokens
- Candidate memory ≤ 500 tokens
- Prevention rules ≤ 500 tokens

Prevent runaway context size.

---

## 8.2 Model Routing

- Use lightweight model for scoring
- Use premium model only for high-value generation
- Avoid overusing large models for classification

---

# 9. Chart Performance (Bento Dashboard)

Rules:

- Limit 6 heavy charts per page
- Pre-aggregate data server-side
- Send pre-shaped series to client
- No client-side large dataset transforms

---

# 10. Rate Limiting

Per workspace:

- AI generation per minute limit
- AI scoring per minute limit
- Visual processing queue limit

Tier-based scaling later.

---

# 11. Failure Tolerance

If:

- AI fails → UI must degrade gracefully
- Drift engine fails → skip visual score but log error
- Snapshot query fails → show fallback state

Never block core dashboard due to optional features.

---

# 12. Monitoring & Observability

Track:

- AI latency
- DB query duration
- Queue backlog depth
- Error rates
- Memory recall latency

Alert if:

- AI latency > threshold
- Queue backlog > X jobs
- DB query spikes

---

# 13. Horizontal Scalability Plan

Future:

- Separate AI service from main app
- Separate analytics worker service
- Use dedicated embedding worker pool
- Use read replicas for analytics queries

---

# 14. Performance Anti-Patterns

Avoid:

- Client-side heavy filtering of large arrays
- On-demand full memory recall
- Real-time recomputation of all KPIs
- Blocking drift detection before publishing
- Large unindexed audit scans

---

# 15. Phase 2 Enhancements

- Real-time dashboard streaming
- Incremental metric updates
- WebSocket notifications
- Edge caching for static assets
- Adaptive model routing based on latency

---

# Summary

This performance strategy ensures:

- Fast dashboard experience
- Scalable AI processing
- Stable multi-agent workloads
- Controlled cost growth
- Predictable system behavior