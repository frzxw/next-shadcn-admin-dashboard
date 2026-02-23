# Task ID: T-CORE-010

## Title
SPIKE — AI Provider Selection & Routing Policy

## Area
CORE

## Requirement IDs
- None (resolves OQ-001)

## Depends On
- None

## Description
Research and decide on AI provider(s) and routing policy for the system. Determine which providers handle generation (hook, outline, repurposing, strategy) vs scoring (alignment, integrity, quality, clustering). Document the routing policy, cost implications, and adapter interface. Produce a decision document.

Reference: specs/07-ai-contracts.md §7, specs/02-requirements.md OQ-001.

## Acceptance Criteria
- Decision document produced with: selected provider(s), routing rules, cost model
- Generation model identified (high-capability)
- Scoring model identified (low-latency, deterministic)
- Token budget acknowledgment (specs/13-performance-budget.md §8)
- Adapter interface sketch for `src/server/services/ai/provider.ts`
- Decision unblocks T-AI-001

## Technical Notes
- Scoring: temperature 0.1 default (specs/07-ai-contracts.md §7.2)
- Generation: higher capability model
- Classification: lower-latency model
- Must support streaming for long-form generation (specs/07-ai-contracts.md §14)

## Definition of Done
- Decision document committed to repo
- Provider selection justified
- Routing policy defined
- No implementation required — research only
