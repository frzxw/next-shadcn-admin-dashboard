# 19 — Alerting System Specification

## Document Control
- Version: 0.1
- Status: Draft
- Last Updated: 2026-02-23
- Owner: Product / Architecture

---

# 1. Purpose

This document defines:

- Alert categories
- Trigger logic
- Severity levels
- Deduplication rules
- Notification surfaces
- Alert lifecycle

The alerting system must:

- Surface meaningful risks
- Avoid alert fatigue
- Prioritize strategic signals
- Integrate with memory + experiments
- Support scalable monitoring

Alerts are strategic nudges, not noise.

---

# 2. Alert Design Principles

1. Alerts must be actionable.
2. Each alert must include a recommended action.
3. Alerts must have severity tiers.
4. Duplicate alerts must be suppressed.
5. Alerts must expire or resolve.
6. Critical alerts must be visible immediately.

---

# 3. Alert Categories

Alerts are grouped into domains:

- Identity & Drift
- Performance Anomalies
- Experiment Events
- Memory & Learning
- Platform & Ingestion
- Security & Permissions
- System Health

---

# 4. Severity Levels

## 4.1 Info

- Non-critical insights
- Experiment completed
- KPI milestone achieved

UI:
- Subtle badge
- No persistent banner

---

## 4.2 Warning

- Declining retention
- Minor drift detected
- Saturation risk rising

UI:
- Yellow badge
- Appears on Home dashboard

---

## 4.3 Critical

- Severe identity drift
- Integrity collapse
- API connection failure
- Role escalation anomaly

UI:
- Red highlight
- Sticky on Home
- Requires acknowledgment

---

# 5. Identity & Drift Alerts

## 5.1 Integrity Drop Alert

Trigger:

    integrity_score drops > 20% 
    compared to rolling average

Severity:
- Warning if single post
- Critical if 3 consecutive posts

Action:
- Review recent identity changes
- Check prevention rules

---

## 5.2 Visual Drift Alert

Trigger:

    visual_integrity_score < 55

Severity:
- Critical

Action:
- Compare to baseline
- Use reference image set

---

## 5.3 Alignment Drift Alert

Trigger:

    alignment_score < threshold 
    for 3 consecutive posts

Severity:
- Warning

Action:
- Review content pillars

---

# 6. Performance Alerts

## 6.1 Retention Collapse

Trigger:

    avg_retention drops > 25%
    within 7-day window

Severity:
- Warning

Action:
- Analyze drop-off points
- Review hook structure

---

## 6.2 Saturation Risk

Trigger:

    saturation_index > 60

Severity:
- Warning

Action:
- Introduce idea variation
- Launch structural experiment

---

## 6.3 Growth Stagnation

Trigger:

    growth_rate ≤ 0
    for 30-day period

Severity:
- Info → escalate to Warning if prolonged

Action:
- Run experiment
- Review positioning

---

# 7. Experiment Alerts

## 7.1 Minimum Sample Reached

Trigger:

    All variants exceed threshold impressions

Severity:
- Info

Action:
- Review experiment result

---

## 7.2 High Confidence Winner

Trigger:

    confidence_score > 80%

Severity:
- Info

Action:
- Promote to memory

---

## 7.3 Variant Underperformance

Trigger:

    variant performance_index 
    30% below baseline

Severity:
- Warning

Action:
- Pause variant

---

# 8. Memory Alerts

## 8.1 Candidate Memory Ready

Trigger:

    confidence_score > threshold

Severity:
- Info

Action:
- Review & promote

---

## 8.2 Memory Conflict

Trigger:

    durable memories contradict

Severity:
- Critical

Action:
- Resolve conflict manually

---

## 8.3 Repeated Failure Pattern

Trigger:

    same failure_type occurs ≥ 3 times

Severity:
- Warning

Action:
- Create prevention rule

---

# 9. Ingestion Alerts

## 9.1 API Disconnected

Trigger:

    platform token expired

Severity:
- Critical

Action:
- Reconnect integration

---

## 9.2 Sync Failure

Trigger:

    ingestion fails ≥ 3 attempts

Severity:
- Warning

Action:
- Review logs

---

# 10. Security Alerts

## 10.1 Unauthorized Role Change

Trigger:

    unexpected role modification

Severity:
- Critical

Action:
- Audit role history

---

## 10.2 Excessive AI Usage

Trigger:

    usage exceeds 90% plan quota

Severity:
- Warning

Action:
- Upgrade plan or reduce usage

---

# 11. Alert Lifecycle

States:

    New → Acknowledged → Resolved → Archived

Rules:

- Critical alerts require acknowledgment.
- Alerts auto-resolve if condition clears.
- Expired alerts move to archive.

---

# 12. Deduplication Rules

Prevent spam:

- Same alert type within 24h → collapse
- Group alerts by agent
- Suppress repeated identical conditions

Example:

Instead of:
    3 separate drift alerts

Show:
    "Visual drift detected in 3 recent posts"

---

# 13. Notification Surfaces

Alerts appear in:

- Home dashboard (primary)
- Agent-specific tab
- Notification panel
- Optional email (Phase 2)

Never:

- Use disruptive modal for non-critical alerts

---

# 14. Alert Data Model

Fields:

- id
- workspace_id
- agent_id (optional)
- category
- severity
- message
- recommended_action
- status
- created_at
- resolved_at

Index:
- (workspace_id, severity)
- (agent_id, created_at)

---

# 15. Performance Strategy

Alert evaluation must:

- Run in background jobs
- Not block UI
- Batch anomaly checks

Do not:
- Evaluate alerts synchronously on every dashboard load

---

# 16. Plan-Based Gating

Free:
- Basic performance alerts

Pro:
- Identity + experiment alerts

Pro+:
- Visual drift alerts

Agency:
- Cross-agent alerts
- Portfolio saturation alerts

---

# 17. Anti-Patterns

Avoid:

- Too many warning-level alerts
- Alerts without action guidance
- Permanent alerts that never resolve
- Ambiguous alert language

---

# 18. Future Enhancements

- Smart alert ranking by impact
- AI-generated remediation suggestions
- Alert correlation engine
- Portfolio-level alert summary
- Alert snoozing

---

# Summary

The alerting system ensures:

- Strategic signal surfacing
- Identity protection
- Performance awareness
- Experiment visibility
- Memory reinforcement
- Minimal alert fatigue