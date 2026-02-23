# Task ID: T-ASSET-006

## Title
Prompt History Tracking

## Area
ASSET

## Requirement IDs
- REQ-ASSET-004

## Depends On
- T-ASSET-001
- T-AI-001

## Description
Implement prompt history tracking: store AI generation prompts along with their outputs and associate them with assets. Enables comparing prompt variations, output quality, and performance correlation.

Reference: specs/01-product-spec.md §5.7 Prompt History.

## Acceptance Criteria
- `prompt_history` table: id, agent_id, prompt_text, prompt_hash, output_summary, asset_id (nullable), model, model_version, created_at
- Prompt history tab in Assets page
- View prompts with their outputs
- Filter by agent, date, model
- Compare outputs from similar prompts
- Link to asset if output generated an asset

## Technical Notes
- Prompt hash for deduplication (matches audit log pattern)
- Do NOT store raw prompts in audit log (hash only) — prompt_history is separate
- This is a first-party feature table, not audit
- Performance correlation deferred until post linking

## Definition of Done
- Requirement satisfied: REQ-ASSET-004
- Type-safe
- No console errors
