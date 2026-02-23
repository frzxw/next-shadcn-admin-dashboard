# 17 — Monetization Model & Tier Gating Specification

## Document Control
- Version: 0.1
- Status: Draft
- Last Updated: 2026-02-23
- Owner: Product / Strategy

---

# 1. Purpose

This document defines:

- Pricing tiers
- Feature gating rules
- Usage limits
- AI consumption limits
- Agent scaling model
- Upgrade paths

The monetization model must:

- Align with infrastructure cost
- Incentivize deeper usage
- Protect system performance
- Encourage multi-agent adoption
- Preserve premium strategic features

---

# 2. Monetization Principles

1. Core value = Agent intelligence, not storage.
2. AI usage must scale with plan tier.
3. Visual consistency engine is premium.
4. Memory automation increases with tier.
5. Portfolio intelligence reserved for higher tiers.
6. Free tier must demonstrate value without draining resources.

---

# 3. Plan Overview

## 3.1 Free (Starter)

Target:
- Solo creator testing system

Limits:

- 1 agent
- 30 AI generations per month
- Basic alignment score
- No experiment engine
- No visual consistency engine
- No durable memory promotion
- KPI dashboard limited to last 14 days

Purpose:
- Validate workflow
- Experience structured AI

---

## 3.2 Pro

Target:
- Serious creator managing 1–3 agents

Includes:

- Up to 3 agents
- 500 AI generations per month
- Full alignment + integrity scoring
- Experiment engine
- Candidate memory creation
- Manual memory promotion
- KPI history (90 days)
- Drift detection (text-based)

Excludes:
- Visual consistency engine
- Cross-agent intelligence

---

## 3.3 Creator Pro+

Target:
- AI influencer creators

Includes:

- Up to 5 agents
- 1000 AI generations per month
- Visual Consistency Engine
- Drift alerts
- Face similarity scoring
- Prevention rule suggestions
- KPI history (1 year)

---

## 3.4 Agency

Target:
- Multi-agent portfolio operators

Includes:

- 15+ agents
- Cross-agent intelligence
- Portfolio compounding map
- Cannibalization detection
- Advanced experiment confidence
- Full memory automation workflow
- Advanced audit exports
- Role delegation control

AI generation:
- Tier-based scaling
- Higher rate limits

---

# 4. Feature Gating Matrix

| Feature                          | Free | Pro | Pro+ | Agency |
|----------------------------------|------|-----|------|--------|
| Multi-Agent                      | ✖    | ✔   | ✔    | ✔      |
| Experiment Engine                | ✖    | ✔   | ✔    | ✔      |
| Visual Consistency Engine        | ✖    | ✖   | ✔    | ✔      |
| Memory Promotion                 | ✖    | ✔   | ✔    | ✔      |
| Auto Candidate Memory            | ✖    | ✖   | ✔    | ✔      |
| Cross-Agent Analytics            | ✖    | ✖   | ✖    | ✔      |
| Audit Export                     | ✖    | ✖   | ✖    | ✔      |

---

# 5. AI Usage Controls

Each workspace must track:

- generation_count
- scoring_count
- embedding_requests
- memory_recall_calls

Enforce:

- Monthly cap reset
- Hard stop at limit
- Upgrade prompt

Future:
- Soft throttling after 80% usage

---

# 6. Visual Engine Cost Gating

Visual consistency requires:

- Embedding model cost
- Landmark extraction cost
- Storage overhead

Therefore:

- Enabled only in Pro+ and Agency
- Batch processing for lower tiers
- Real-time alerts reserved for Agency

---

# 7. Memory Automation Gating

Free:
- No durable memory

Pro:
- Manual durable memory promotion

Pro+:
- Candidate memory auto-creation

Agency:
- Confidence-based auto-suggestion
- Memory conflict detection

Never:
- Fully autonomous identity rewrite

---

# 8. Upgrade Triggers (UX Strategy)

System should show upgrade prompts when:

- AI generation limit reached
- Attempting to create second agent on Free
- Accessing visual consistency tab
- Trying cross-agent analytics
- Trying export audit logs

Upgrade prompts must:

- Be contextual
- Explain value
- Show difference in capability

---

# 9. Cost Protection Strategy

To protect infrastructure:

- Rate-limit AI per workspace
- Limit memory token injection per tier
- Limit visual embedding frequency
- Prevent abuse via queue monitoring

---

# 10. Enterprise Add-Ons (Future)

Possible add-ons:

- Extra AI generation packs
- Extra agent slots
- Visual processing packs
- Dedicated analytics compute
- SLA priority processing

---

# 11. Pricing Strategy (Conceptual)

Free:
- $0

Pro:
- Monthly recurring

Pro+:
- Premium tier for influencer AI

Agency:
- High-value subscription
- Potential custom pricing

Final pricing determined by:

- AI cost per user
- Visual embedding cost
- Average usage profile
- Market positioning

---

# 12. Anti-Patterns

Avoid:

- Unlimited AI in lower tiers
- Visual engine in Free
- Feature fragmentation
- Hiding core value behind too many paywalls
- Charging per minor metric

---

# 13. Long-Term Monetization Vision

Shift from:

Paying for AI usage

To:

Paying for strategic intelligence infrastructure

The more:

- Agents
- Experiments
- Memory depth
- Portfolio optimization

The higher the value tier.

---

# Summary

This monetization model ensures:

- Sustainable AI cost structure
- Clear feature differentiation
- Scalable pricing
- Incentivized upgrade path
- Alignment with strategic agent evolution