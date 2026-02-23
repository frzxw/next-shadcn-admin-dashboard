# Task ID: T-CONTENT-006

## Title
Idea/Theme Clustering Service & UI

## Area
CONTENT

## Requirement IDs
- REQ-CONTENT-005

## Depends On
- T-CONTENT-001
- T-CONTENT-002

## Description
Implement post clustering by idea/theme groups. Create an idea_clusters table, a service that assigns content items to clusters (via embedding similarity or manual tagging), and a UI to display cluster memberships. Cluster tags shown in content library and bubble chart (T-INSIGHT-006).

Reference: specs/01-product-spec.md §5.3, specs/05-data-model.md §6.4 (idea_cluster_id).

## Acceptance Criteria
- `idea_clusters` table: id, agent_id, label, description, created_at
- Content items can be assigned to clusters (manual or AI-assisted)
- Cluster tag displayed in content library table (T-CONTENT-004)
- Cluster management UI: create, rename, delete clusters
- Assign/reassign posts to clusters
- Server action for cluster operations

## Technical Notes
- post_analysis.idea_cluster_id links to clusters
- AI-assisted clustering is Phase 1.5 (manual MVP)
- Clustering feeds into compounding score (specs/06-kpi-definitions.md §3.1)
- Saturation index uses cluster density (specs/06-kpi-definitions.md §3.2)

## Definition of Done
- Requirement satisfied: REQ-CONTENT-005
- Type-safe
- No console errors
- Server-side permission enforcement present
