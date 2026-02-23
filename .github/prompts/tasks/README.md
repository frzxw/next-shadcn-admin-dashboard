# Task Cards

Store approved, execution-ready task cards here.

## Canonical Format
- Use YAML task cards matching `../templates/task-card.template.yaml`.
- One task card per file using this naming convention:
	- `T-<AREA>-<NNN>-<slug>.yaml`

## Minimum Content
- `id`, `title`, `type`, `scope`, `goal`
- `requirements`, `depends_on`, `allowed_paths`
- `constraints`, `validation`, `done_when`
- `commit` and `handoff`

## Gate
Do not add a task card unless its source feature spec is in Approved status.
