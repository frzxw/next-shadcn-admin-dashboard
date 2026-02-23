# Architecture Spec — AI Agent Creator OS Dashboard (Draft)

## Document Control
- Version: 0.2 (Draft)
- Status: Proposed
- Last Updated: 2026-02-23

---

# 1) Current Baseline

- Framework: Next.js App Router + TypeScript
- Shared UI primitives: `src/components/ui`
- Route groups: `src/app/(external)`, `src/app/(main)`
- Preferences + state: `src/lib/preferences`, `src/stores/preferences`
- Spec-driven development: `.github/copilot-instructions.md`

---

# 2) Architectural Goals

1) Support tiered navigation for creator operations (Home/Agents/Content/Calendar/Insights/etc.)
2) Keep server-side boundaries strict for auth, permissions, and AI/memory calls
3) Enable AI agent identity/memory structure (OpenClaw-style files) + Supermemory integration
4) Support rich KPI dashboards and charts with low perceived latency
5) Keep modules colocated by route group and feature domain

---

# 3) Target Additions (MVP)

## 3.1 App Routes (Feature Domains)

Create a creator OS workspace under:

- `src/app/(main)/dashboard/creator/` (root shell + tier-1 nav)

Tier-1 route groups (suggested):
- `src/app/(main)/dashboard/creator/(home)/page.tsx`
- `src/app/(main)/dashboard/creator/agents/`
- `src/app/(main)/dashboard/creator/content/`
- `src/app/(main)/dashboard/creator/calendar/`
- `src/app/(main)/dashboard/creator/insights/`
- `src/app/(main)/dashboard/creator/audience/`
- `src/app/(main)/dashboard/creator/assets/`
- `src/app/(main)/dashboard/creator/experiments/`
- `src/app/(main)/dashboard/creator/memory/`
- `src/app/(main)/dashboard/creator/settings/`

Feature-local components per domain:
- `src/app/(main)/dashboard/creator/<domain>/_components/`

## 3.2 Server Boundaries

- `src/server/actions/` (server actions per domain)
  - `agents.actions.ts`
  - `content.actions.ts`
  - `calendar.actions.ts`
  - `insights.actions.ts`
  - `memory.actions.ts`
  - `experiments.actions.ts`
  - `assets.actions.ts`

- `src/server/services/` (integration/adapters; no UI imports)
  - `auth/` (Better Auth adapter)
  - `db/` (ORM client, repositories)
  - `ai/` (AI provider adapters + scoring)
  - `supermemory/` (memory adapter)
  - `storage/` (asset store adapter)
  - `analytics/` (metrics aggregation adapter)
  - `audit/` (immutable audit trail)
  - `queue/` (optional; background jobs)

## 3.3 Libraries (Client/Shared)

- `src/lib/ai/`
  - request contracts, prompt builders, output normalizers
  - schemas for AI outputs + trace metadata
- `src/lib/permissions/`
  - role checks, policy helpers, RBAC matrix
- `src/lib/kpis/`
  - KPI definitions, normalization helpers (UI-safe)
- `src/lib/agent-brain/`
  - OpenClaw-style file schema definitions + parsing helpers
- `src/lib/charts/`
  - chart models (not components) so server can precompute series

---

# 4) Authentication & Authorization

## 4.1 Auth Provider
Adopt **Better Auth** to handle:
- Session management
- OAuth providers
- Email/password (optional)
- Server-side session validation in App Router

Integration boundary:
- `src/server/services/auth/betterAuth.ts`

## 4.2 Permissions Model (RBAC)
Roles:
- Creator/Operator
- Editor
- Analyst
- Viewer

Enforcement points:
- Server Actions (mandatory)
- Route-level guards (optional)
- UI gating (never the only gate)

Policy helpers:
- `src/lib/permissions/policies.ts`
- `src/lib/permissions/can.ts`

---

# 5) Data Layer

## 5.1 Database (MVP)
Use an ORM (Prisma/Drizzle) with a relational DB (Postgres preferred).

Core tables (MVP):
- workspaces
- users
- workspace_members (role)
- agents
- agent_files (SOUL/IDENTITY/USER/MEMORY) + versions
- content_items (idea/draft/review/scheduled/published/reviewed)
- posts (published artifacts)
- post_metrics (aggregates + snapshots)
- assets + asset_tags
- experiments + variants + results
- mistakes (ERRORS) + prevention_rules
- memory_items (durable/candidate/ephemeral)
- audit_log (append-only)

## 5.2 Storage
Assets stored in object storage (S3-compatible).
- `src/server/services/storage/storage.ts`
- Keep metadata in DB.

---

# 6) Supermemory Integration (Memory Layer)

## 6.1 Purpose
Supermemory stores:
- retrieved memories for agent recall
- embeddings / semantic search
- error-prevention rules and linked learnings
- durable knowledge separate from DB records

**DB remains system-of-record** for product state.
Supermemory is a **recall substrate**.

## 6.2 Namespacing Strategy
Store memories with tags:
- `workspace:<id>`
- `agent:<id>`
- `domain:<content|identity|errors|insights>`
- `platform:<ig|tiktok|yt|x>` (optional)

## 6.3 Memory Policy (3-tier)
- Ephemeral: daily logs + transient notes
- Candidate: auto-saved insights pending approval
- Durable: approved memory + canonical agent brain updates

Promotion workflow:
- Candidate → Durable requires Creator approval OR confidence threshold

## 6.4 Adapter Boundary
- `src/server/services/supermemory/supermemoryClient.ts`
Responsibilities:
- `remember()` create memory item (with tags + confidence)
- `recall()` search memory for context (with filters)
- `forget()` delete/disable item (admin gated)
- `summarize()` optional rollups for dashboards

---

# 7) OpenClaw-Style Agent Brain (Files + UI)

## 7.1 File Types (per agent)
- SOUL.md (behavior rules)
- IDENTITY.md (persona surface)
- USER.md (operator preferences)
- MEMORY.md (curated durable memory)
- ERRORS.md (mistakes + prevention rules; stored as structured entries)

## 7.2 Storage Strategy
- Store canonical contents in DB (`agent_files`).
- Keep a version history (diff-friendly).
- Mirror structured extracts to Supermemory for recall.

Parsing helpers:
- `src/lib/agent-brain/schema.ts`
- `src/lib/agent-brain/parse.ts`

---

# 8) AI Layer (Generation + Scoring)

## 8.1 AI Responsibilities (MVP)
Generation:
- Title/hook variants
- Outline generation
- Repurposing suggestions

Scoring (fast, deterministic where possible):
- Narrative alignment score
- Persona integrity score (V1: text-based; Phase 2: visual embeddings)
- Audience quality score (if metrics available)
- Retention annotations (if retention curve exists)

## 8.2 AI Provider Adapter
- `src/server/services/ai/provider.ts` (interface)
- `src/server/services/ai/providers/<vendor>.ts`
- `src/server/services/ai/aiOrchestrator.ts` (routing + tracing)

All AI calls must return:
- normalized output
- `trace` metadata: model, provider, prompt hash, timestamp, actor, latency

Client contracts:
- `src/lib/ai/contracts.ts`
- `src/lib/ai/mappers.ts`

---

# 9) Audit Logging

## 9.1 What to Audit (MVP)
- AI actions (prompt hash, model, timestamp, actor, result summary)
- Agent brain edits (file type, diff, editor)
- Memory promotions/rejections
- Experiments changes and results
- Publishing/scheduling changes

## 9.2 Implementation
- `src/server/services/audit/audit.ts`
- Append-only table `audit_log`
- Optional tamper-evidence: hash-chaining per workspace

---

# 10) Data/Control Flow (Primary)

## 10.1 Example: AI Hook Generation
1) User clicks "Generate hooks" in Draft.
2) UI calls server action `content.generateHooks()`.
3) Server action:
   - validates session (Better Auth)
   - validates permissions
   - validates input schema (zod)
   - loads agent SOUL/IDENTITY + relevant recall from Supermemory
4) AI orchestrator generates hooks.
5) Server returns:
   - hooks array
   - trace metadata (AUDIT)
6) UI renders hooks with accept/edit/regenerate.
7) Accept action persists selected hook to draft + logs event.

## 10.2 Example: Mistake → Learning Loop
1) Post performance ingested/updated.
2) Insights worker detects threshold breach (e.g., integrity drop).
3) System creates `mistakes` entry + prevention rule suggestion.
4) Entry appears in Agents → Mistakes.
5) Creator approves prevention rule.
6) Rule is promoted to durable memory:
   - DB: prevention_rules active
   - Supermemory: durable memory item tagged `domain:errors`

---

# 11) Background Jobs (Optional, Strongly Recommended)

If the MVP needs near-real-time scoring without blocking UI:
- Use a queue (BullMQ/Cloud Task/SQS).

Workers (Phase 1.5):
- metrics rollups
- daily KPI snapshots
- memory summarization
- experiment confidence updates

Boundary:
- `src/server/services/queue/`

---

# 12) Performance Considerations

- Prefer server components for dashboard shells; hydrate only interactive widgets.
- Precompute KPI series server-side and cache by (workspace, agent, range).
- Stream AI generation responses where beneficial.
- Avoid client-side heavy chart transforms; return ready-to-plot series from server.
- Use route-level loading skeletons to reduce perceived latency.

Targets:
- Home dashboard initial paint: <2s (cached)
- Drill-down post view: <1.5s (precomputed analysis)

---

# 13) Security Boundaries

- Provider keys and Supermemory keys must remain server-side only.
- Validate role checks before:
  - AI generation
  - memory writes/promotions
  - agent brain edits
- Token encryption for integrations (KMS or env-based secrets for MVP).
- Rate-limit AI endpoints per workspace/user.

---

# 14) Phase Plan

## MVP (V1)
- Tiered nav shell + routes
- Better Auth integration + RBAC policies
- Content pipeline + calendar + assets
- AI generation (hook/title/outline/repurpose) + audit logs
- Agent brain UI (SOUL/IDENTITY/USER/MEMORY) + version history
- Supermemory recall (read) integrated into AI generation context
- Mistakes module (manual + system-created)

## Phase 2
- Visual consistency engine (embeddings) for influencer agents
- Automated drift alerts based on visuals
- Supermemory write-back automation (candidate→durable workflow)
- Multi-platform metrics ingestion + retention curves
- Advanced experiment engine (A/B + confidence)
- Cross-agent cannibalization detection

---