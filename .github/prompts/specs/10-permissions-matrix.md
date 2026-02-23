# 10 — Permissions Matrix & Access Control Specification

## Document Control
- Version: 0.1
- Status: Draft
- Last Updated: 2026-02-23
- Owner: Architecture / Security

---

# 1. Purpose

This document defines:

- Role-based access control (RBAC)
- Action-level permissions
- Domain-level restrictions
- Memory and identity protection rules
- Enforcement boundaries (UI vs Server)

The system must:

- Protect agent identity integrity
- Prevent unauthorized memory modification
- Restrict AI misuse
- Maintain auditability

---

# 2. Role Definitions

## 2.1 Creator (Operator)

Primary owner of workspace.

Can:
- Create/edit agents
- Modify identity files
- Promote memory
- Approve prevention rules
- Launch experiments
- View and edit all content
- Manage workspace members

Highest authority role.

---

## 2.2 Editor

Execution-focused role.

Can:
- Create/edit drafts
- Schedule content
- View analytics
- Propose experiments
- Create candidate memory

Cannot:
- Modify SOUL.md
- Modify IDENTITY.md
- Promote durable memory
- Change prevention rule status
- Delete agents

---

## 2.3 Analyst

Insight-focused role.

Can:
- View all analytics
- View experiments
- View memory
- Export reports

Cannot:
- Modify content
- Run AI generation
- Modify identity
- Promote memory

---

## 2.4 Viewer

Read-only role.

Can:
- View dashboards
- View insights
- View content status

Cannot:
- Run AI
- Modify any entity
- View memory promotion controls

---

# 3. Permission Domains

Permissions are enforced per domain:

- Agents
- Identity Files
- Content
- Calendar
- Insights
- Experiments
- Memory
- Assets
- Settings

---

# 4. Action-Level Matrix

Legend:
✔ = Allowed  
✖ = Not Allowed  
△ = Conditional / Limited  

---

## 4.1 Agents Domain

| Action                    | Creator | Editor | Analyst | Viewer |
|---------------------------|----------|--------|---------|--------|
| Create Agent              | ✔        | ✖      | ✖       | ✖      |
| Edit Agent Metadata       | ✔        | △      | ✖       | ✖      |
| Archive Agent             | ✔        | ✖      | ✖       | ✖      |
| View Agent                | ✔        | ✔      | ✔       | ✔      |

Editor conditional:
- Cannot change agent type
- Cannot archive

---

## 4.2 Identity Files (SOUL / IDENTITY / USER / MEMORY.md)

| Action                    | Creator | Editor | Analyst | Viewer |
|---------------------------|----------|--------|---------|--------|
| View Identity Files       | ✔        | ✔      | ✔       | ✔      |
| Edit SOUL.md              | ✔        | ✖      | ✖       | ✖      |
| Edit IDENTITY.md          | ✔        | ✖      | ✖       | ✖      |
| Edit USER.md              | ✔        | △      | ✖       | ✖      |
| Edit Durable MEMORY.md    | ✔        | ✖      | ✖       | ✖      |

USER.md conditional:
- Editor may update workflow preferences only

---

## 4.3 Content Domain

| Action                    | Creator | Editor | Analyst | Viewer |
|---------------------------|----------|--------|---------|--------|
| Create Draft              | ✔        | ✔      | ✖       | ✖      |
| Edit Draft                | ✔        | ✔      | ✖       | ✖      |
| Publish Content           | ✔        | ✔      | ✖       | ✖      |
| Archive Content           | ✔        | ✔      | ✖       | ✖      |
| View Content              | ✔        | ✔      | ✔       | ✔      |

---

## 4.4 AI Actions

| Action                        | Creator | Editor | Analyst | Viewer |
|-------------------------------|----------|--------|---------|--------|
| Generate Hooks                | ✔        | ✔      | ✖       | ✖      |
| Generate Outline              | ✔        | ✔      | ✖       | ✖      |
| Run Strategic Copilot         | ✔        | △      | ✖       | ✖      |
| Trigger Scoring               | ✔        | ✔      | ✖       | ✖      |

Editor limitation:
- Cannot override prevention rules
- Cannot alter agent identity context

---

## 4.5 Experiments

| Action                    | Creator | Editor | Analyst | Viewer |
|---------------------------|----------|--------|---------|--------|
| Propose Experiment        | ✔        | ✔      | ✖       | ✖      |
| Activate Experiment       | ✔        | ✖      | ✖       | ✖      |
| Complete Experiment       | ✔        | ✖      | ✖       | ✖      |
| View Experiment Results   | ✔        | ✔      | ✔       | ✔      |
| Promote Result to Memory  | ✔        | ✖      | ✖       | ✖      |

---

## 4.6 Memory System

| Action                    | Creator | Editor | Analyst | Viewer |
|---------------------------|----------|--------|---------|--------|
| View Ephemeral Memory     | ✔        | ✔      | ✔       | ✔      |
| Create Candidate Memory   | ✔        | ✔      | ✖       | ✖      |
| Promote to Durable        | ✔        | ✖      | ✖       | ✖      |
| Reject Candidate          | ✔        | ✖      | ✖       | ✖      |
| Edit Durable Memory       | ✔        | ✖      | ✖       | ✖      |

---

## 4.7 Prevention Rules

| Action                    | Creator | Editor | Analyst | Viewer |
|---------------------------|----------|--------|---------|--------|
| View Rules                | ✔        | ✔      | ✔       | ✔      |
| Create Rule               | ✔        | ✔      | ✖       | ✖      |
| Activate/Deactivate Rule  | ✔        | ✖      | ✖       | ✖      |

---

## 4.8 Settings

| Action                    | Creator | Editor | Analyst | Viewer |
|---------------------------|----------|--------|---------|--------|
| Manage Members            | ✔        | ✖      | ✖       | ✖      |
| Change Plan Tier          | ✔        | ✖      | ✖       | ✖      |
| Update Integrations       | ✔        | △      | ✖       | ✖      |

Editor conditional:
- Can connect analytics sources
- Cannot change billing

---

# 5. Enforcement Strategy

## 5.1 Server-Side Enforcement (Mandatory)

All sensitive actions must validate:

- Session
- Workspace membership
- Role
- Domain permission

Never rely solely on UI gating.

---

## 5.2 Client-Side Gating (UX Layer)

- Hide unauthorized buttons
- Disable restricted actions
- Show tooltips explaining restrictions

---

# 6. Memory Protection Rules

AI must never:

- Promote memory automatically
- Modify durable memory
- Edit identity files
- Override prevention rules

Promotion must require:

- Creator role
- Audit log entry

---

# 7. Audit Requirements

Every restricted action must log:

- actor_user_id
- role
- action_type
- entity_id
- timestamp

Identity and memory edits require diff snapshot.

---

# 8. Plan-Based Restrictions (Future)

Free Tier:
- 1 agent
- Limited AI generations
- No visual consistency engine

Pro Tier:
- Multiple agents
- Full experiment engine
- Memory promotion allowed

Agency Tier:
- Cross-agent analytics
- Role delegation
- Advanced visual detection

---

# 9. Anti-Patterns

Avoid:

- Implicit permission inheritance
- Silent privilege escalation
- Editable identity by non-creator
- Memory promotion via AI-only triggers

---

# 10. Security Goals

This permission model ensures:

- Identity stability
- Controlled evolution
- AI misuse prevention
- Clear authority boundaries
- Audit traceability
- Scalable enterprise readiness