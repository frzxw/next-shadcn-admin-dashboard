# Task ID: T-AI-001

## Title
AI Orchestrator & Provider Adapter Boundary

## Area
AI

## Requirement IDs
- REQ-AI-001
- REQ-AI-002
- REQ-AI-003

## Depends On
- T-CORE-010
- T-CORE-002

## Description
Implement AI orchestration boundary with provider interface, provider implementations, routing policy, request normalization, response normalization, and trace metadata.

## Acceptance Criteria
- Provider interface defined at `src/server/services/ai/provider.ts`
- Orchestrator implemented at `src/server/services/ai/aiOrchestrator.ts`
- Requests pass only via server action -> orchestrator -> provider
- Unified response includes output + trace metadata
- Failure responses standardized
- Memory/context injection hooks available

## Technical Notes
- No direct client-to-provider calls
- Include prompt hash, model, provider, latency, actor in trace
- Route by feature category (generation/scoring/classification)
- Zod validation at action boundary

## Definition of Done
- Requirement satisfied
- Type-safe
- No console errors
- Audit logging integration ready
