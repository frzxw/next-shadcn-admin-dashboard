# Project Guidelines

## Core Principles
- The approved specification is the single source of truth for scope, acceptance criteria, and constraints.
- Do not write or modify implementation code until the specification is validated against current repository reality.
- All work must maintain traceability: Requirement → Design → Code → Test.
- Use repository conventions as defaults: Next.js App Router colocation under src/app, shared primitives in src/components, preferences/state in src/lib and src/stores.
- Prefer minimal, reversible changes that satisfy the spec exactly; do not add unrequested features.

## Mandatory Workflow
- Step 1: Validate spec completeness
  - Confirm goals, non-goals, constraints, acceptance criteria, and affected areas.
  - Map each requirement to impacted paths (for example: src/app, src/components, src/server, src/lib/preferences).
- Step 2: Decompose requirements before design
  - Break requirements into atomic, testable units.
  - Define explicit inputs, outputs, and invariants per unit.
- Step 3: Produce explicit design before implementation
  - Define architecture changes, data/control flow, state ownership, and failure modes.
  - Identify integration points (server actions, cookies, Zustand store, route groups).
- Step 4: Implement with traceability
  - For each code change, annotate internal working notes with linked requirement and design decision.
  - Keep changes consistent with existing patterns in src/app/layout.tsx, src/server/server-actions.ts, src/stores/preferences, and src/navigation/sidebar/sidebar-items.ts.
- Step 5: Verify
  - Run install/build/lint checks as applicable:
    - npm install
    - npm run dev
    - npm run build
    - npm run check
    - npm run check:fix
    - npm run lint
  - If a requirement cannot be verified by existing automation, define a deterministic manual verification procedure.

## Global Skills Usage
- Reasoning: apply structured requirement analysis before design and again before merge to confirm full requirement coverage.
- Architecture and design: use route-group colocation patterns in src/app/(external) and src/app/(main); keep shared concerns in src/components, src/lib, src/stores.
- Testing: derive test/verification scenarios directly from each requirement unit; do not invent unrelated test scope.
- Debugging: isolate regressions by tracing requirement unit → changed files → runtime symptom; use minimal reproductions.
- Refactoring: refactor only when required by the specification or to preserve maintainability of touched code paths.
- Security review: validate server/client boundaries for cookie and preference flows (src/server/server-actions.ts, src/lib/cookie.client.ts, src/lib/preferences/preferences-storage.ts).
- Performance analysis: evaluate hydration/render impact for layout/theme and preference flows (src/app/layout.tsx, src/scripts/theme-boot.tsx, preferences provider/store).
- Documentation discipline: update repository docs/instructions only for behavior changed by the implemented specification.

## Ambiguity Protocol
- Stop implementation immediately when encountering ambiguous, conflicting, or missing requirements.
- Record ambiguity as: observed gap, impacted requirement units, risk, and proposed options.
- Provide 2-3 concrete resolution options with tradeoffs and a default recommendation.
- Resume implementation only after ambiguity is resolved and reflected in the specification.

## Anti-Patterns
- Coding before specification validation.
- Skipping requirement decomposition or design steps.
- One-shot implementation without Requirement → Design → Code → Test mapping.
- Silent assumption changes not captured in the spec.
- Broad refactors, dependency churn, or architectural drift outside spec scope.
- Generic fixes that do not map to an explicit requirement.

## Definition of Done
- Every accepted requirement is implemented and verifiably mapped to design, code changes, and test/verification evidence.
- No unapproved scope expansion exists.
- Build/lint commands required for changed areas succeed, or failures are documented as pre-existing and out of scope.
- Security and performance checks for touched flows are completed and recorded.
- Documentation/instructions impacted by behavior changes are updated.

## Communication Protocol
- Use structured status updates: Context, Requirement Mapping, Design Decision, Implementation Delta, Verification, Risks.
- In change summaries, report traceability explicitly using Requirement IDs or requirement bullets.
- When blocked, report only factual blockers, attempted resolution, and next required decision.
- Keep language precise, implementation-focused, and free of motivational or speculative commentary.