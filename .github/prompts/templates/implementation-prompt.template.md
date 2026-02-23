# Implementation Prompt Template

## Context
Implement only what is defined in the approved feature spec.

## Inputs
- Spec file:
- Requirement IDs:
- Design references:

## Execution Constraints
- Follow `.github/copilot-instructions.md` strictly.
- No implementation beyond listed requirement IDs.
- Keep traceability: Requirement → Design → Code → Test.
- Preserve existing architecture conventions and route colocation.

## Tasks
1. Validate spec and requirement completeness.
2. Implement minimal code changes for approved scope.
3. Verify with project commands and manual checks.
4. Produce change summary mapped by requirement ID.

## Required Output Format
- Context
- Requirement Mapping
- Design Decision
- Implementation Delta
- Verification
- Risks
