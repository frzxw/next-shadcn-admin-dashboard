# Project Prompt

This directory is the source of truth for AI-agent prompts and product specs.

## Goal
Convert the current Next.js admin template into a **centralized creator dashboard** with AI-enabled workflows.

## Folder Layout
- `specs/` — product and engineering specifications (authoritative)
- `templates/` — reusable prompt/spec templates for new features
- `tasks/` — execution prompts generated from approved specs
- `workflows/` — operating playbooks for multi-agent execution

## Operating Rules
- Do not generate implementation prompts before the related spec in `specs/` is approved.
- Every task prompt in `tasks/` must link back to requirement IDs in `specs/`.
- Keep scope incremental: MVP first, then iterative expansions.

## Recommended Workflow
1. Update `specs/01-product-spec.md` when requirements change.
2. Break work into feature specs using `templates/feature-spec.template.md`.
3. Generate implementation prompts with `templates/implementation-prompt.template.md`.
4. Store finalized prompts in `tasks/` and include requirement traceability.

## Multi-Agent Workflow
- Use `workflows/multi-agent-sequential.md` to run coordinator + multiple workers safely.
- Use templates:
	- `templates/coordinator-parallel.template.md`
	- `templates/worker-parallel.template.md`
	- `templates/task-card.template.yaml`
