# 18 — Analytics Ingestion Specification

## Document Control
- Version: 0.1
- Status: Draft
- Last Updated: 2026-02-23
- Owner: Data / Architecture

---

# 1. Purpose

This document defines:

- How external platform analytics are ingested
- Normalization strategy across platforms
- Retention curve modeling
- Idempotency rules
- Backfill policy
- Data freshness targets

The ingestion system must:

- Provide reliable KPI inputs
- Support multi-platform agents
- Prevent duplicate data
- Be scalable and fault-tolerant
- Preserve historical integrity

---

# 2. Supported Data Sources (MVP)

Phase 1:

- Manual metric entry (fallback)
- CSV upload
- Basic API ingestion (if available)

Phase 2:

- Instagram Graph API
- TikTok Analytics API
- YouTube Analytics API
- X (Twitter) API

All connectors must be modular.

---

# 3. Ingestion Architecture Overview

Flow:

    External API / Upload
        → Connector Adapter
            → Normalization Layer
                → Validation
                    → Idempotency Check
                        → Storage (DB)
                            → KPI Snapshot Refresh
                                → Audit Log

All ingestion must pass through normalization layer.

---

# 4. Normalized Metrics Schema

Platform metrics must be mapped to internal schema:

## 4.1 Core Metrics

- views
- impressions
- likes
- comments
- shares
- saves
- watch_time
- average_watch_time
- completion_rate
- followers
- returning_viewers (if available)

---

## 4.2 Derived Metrics

Computed after ingestion:

- saves_per_1k_views
- shares_per_1k_views
- engagement_rate
- repeat_engagement_rate
- follow_conversion_rate

---

# 5. Post Metrics Ingestion Rules

## 5.1 Idempotency

Each ingestion batch must:

- Include external_post_id
- Include snapshot_date

Before insert:

Check if:

    (post_id, snapshot_date) exists

If exists:
- Update if newer snapshot
- Log update in audit_log

---

## 5.2 Partial Updates

If only subset of metrics available:

- Update available fields
- Preserve existing non-null values

---

# 6. Retention Curve Modeling

If platform provides retention graph:

Store:

- retention_timestamps (array)
- retention_percentages (array)
- video_duration

Must support:

- Structural drop detection
- Drop-off annotation
- Overlay comparison

If no retention curve:
- Fallback to completion_rate

---

# 7. KPI Snapshot Refresh Strategy

After ingestion:

1. Trigger agent_kpi_snapshot recompute
2. Update rolling averages
3. Recalculate:
   - Growth rate
   - Loyalty index
   - Audience quality
4. Log recompute event

Snapshots should:

- Be stored daily
- Not recompute entire history unless backfill

---

# 8. Backfill Strategy

Backfill required when:

- New workspace connected
- API reconnected
- Data correction required

Rules:

- Process oldest to newest
- Recompute snapshots incrementally
- Rate-limit API calls
- Log backfill range

Backfill must not:

- Block dashboard
- Overwrite historical audit records

---

# 9. Multi-Platform Normalization

Agents may publish on:

- Instagram
- TikTok
- YouTube
- X

Normalize:

- engagement_rate formula
- watch_time scale
- retention percentage interpretation

Example:

If platform does not support saves:
- saves_per_1k_views = null
- Adjust Audience Quality weighting

---

# 10. Data Freshness Targets

MVP:

- Manual ingestion: immediate
- API ingestion: daily sync

Pro+ / Agency:

- 4-hour sync window
- Optional near-real-time (future)

Freshness indicator displayed in UI:

    "Last updated: <timestamp>"

---

# 11. Error Handling

If ingestion fails:

- Log connector error
- Retry with exponential backoff
- Notify Creator if persistent failure

Do not:

- Delete previous valid metrics
- Block dashboard display

---

# 12. Data Validation Rules

Reject records if:

- views < 0
- completion_rate > 100%
- watch_time negative
- snapshot_date in future

Log validation failures.

---

# 13. Drift Detection Dependency

Analytics ingestion must support:

- Detect sudden retention drop
- Detect engagement anomalies
- Trigger mistake entry creation

Example:

If retention drops > 20% vs baseline:
- Flag candidate drift event

---

# 14. Storage Tables Used

- posts
- post_metrics
- post_analysis
- agent_kpi_snapshots
- audit_log

Optional:

- ingestion_jobs
- ingestion_errors

---

# 15. Performance Strategy

- Batch inserts
- Index (post_id, snapshot_date)
- Avoid full-table scans
- Use incremental recompute
- Offload heavy recompute to queue worker

---

# 16. Security Considerations

- Store platform tokens encrypted
- Do not expose API keys client-side
- Rotate tokens periodically
- Allow disconnect per workspace

---

# 17. Plan-Based Gating

Free:
- Manual entry only
- 14-day data history

Pro:
- Daily API sync
- 90-day retention

Pro+:
- Extended retention
- Retention curves

Agency:
- High-frequency sync
- Multi-agent analytics comparison

---

# 18. Monitoring & Alerts

Alert if:

- API connection expired
- Sync failed > 3 times
- Data anomaly detected
- Snapshot recompute failed

---

# 19. Anti-Patterns

Avoid:

- Mixing raw and normalized metrics
- Overwriting historical data silently
- Client-side metric calculation
- Running full history recompute on every ingestion

---

# Summary

This analytics ingestion system ensures:

- Reliable KPI foundation
- Cross-platform normalization
- Scalable ingestion pipeline
- Clean separation of raw vs derived data
- Strong integration with memory and drift systems
- Accurate long-term strategic insights