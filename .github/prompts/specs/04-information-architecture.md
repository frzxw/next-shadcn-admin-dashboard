# 04 — Information Architecture (IA) & UI Layout Spec

## Document Control
- Version: 0.1
- Status: Draft
- Last Updated: 2026-02-23
- Owner: Product / Design / Architecture

---

# 1. IA Principles

The AI Agent Creator OS must follow:

1. **Strategic Hierarchy First**
   - Strategy (Home, Insights) above execution (Content, Calendar).
2. **Agent-Centric Architecture**
   - Every major entity (content, experiments, memory, assets) is scoped to an Agent.
3. **Tiered Navigation**
   - Tier 1: Domain-level (sidebar)
   - Tier 2: Domain sub-navigation (tabs)
   - Tier 3: Contextual tools (panel-level)
4. **Bento Layout Principle**
   - Information grouped in modular, self-contained “cards”
   - Clear visual hierarchy
   - Asymmetrical but structured layout
   - High-density without clutter
5. **Low Cognitive Overhead**
   - No more than 7 primary nav items visible without scrolling
   - Clear priority: alerts > strategy > metrics > supporting detail

---

# 2. Tiered Navigation Structure

## Tier 1 — Primary Sidebar

Persistent vertical navigation:

- Home
- Agents
- Content
- Calendar
- Insights
- Audience
- Assets
- Experiments
- Memory
- Settings

Rules:
- Icons + label
- Active state highlight
- Collapse to icons on smaller screens
- Responsive bottom tab bar on mobile (max 5 primary shortcuts)

---

## Tier 2 — Domain-Level Navigation

Each Tier 1 page contains horizontal tabs.

Example: Agents

- Overview
- Identity
- Consistency
- Performance
- Mistakes
- Evolution

Example: Content

- Library
- Drafts
- Post Analysis
- Series
- Templates

Tier 2 rules:
- Tabs must not exceed 6
- Scrollable if overflow
- Clear active indicator
- Persist selected tab in URL state

---

## Tier 3 — Contextual Tools

Contextual controls inside pages:

Examples:
- Agent selector dropdown
- Date range picker
- Platform filter
- Export button
- “Run Experiment” CTA

Rules:
- Right-aligned in header
- Do not mix global filters with local tools
- Use consistent spacing tokens

---

# 3. Bento Layout Design System

## 3.1 Core Bento Rules

Every dashboard page uses:

- 12-column grid (desktop)
- 8-column grid (tablet)
- 4-column stack (mobile)

Bento card principles:
- Each card solves one problem
- Cards have:
  - Title
  - Optional subtitle
  - Data visualization or primary metric
  - Supporting insight
- No card taller than 2x its width without justification
- Maintain consistent internal padding (24px desktop, 16px mobile)

---

## 3.2 Home Page Bento Layout

Desktop Layout (Example)

Row 1:
- KPI Strip (full width)

Row 2:
- Strategic Copilot (6 cols)
- Alerts (6 cols)

Row 3:
- Performance vs Positioning Matrix (8 cols)
- Agent Snapshot (4 cols)

Row 4:
- Audience Funnel (6 cols)
- Idea Clusters (6 cols)

Design Rules:
- Largest visual element = strategic matrix
- Alerts use high contrast
- No more than 6 bento cards per viewport height

---

## 3.3 Agents Overview Bento

Row 1:
- Agent Header Card (name, status, integrity score)

Row 2:
- Persona Integrity Trend (6 cols)
- Narrative Alignment Trend (6 cols)

Row 3:
- Visual Consistency (6 cols)
- Voice Consistency (6 cols)

Row 4:
- Mistake Recurrence (4 cols)
- Top Prevention Rules (4 cols)
- Audience Loyalty (4 cols)

---

## 3.4 Content Library Layout

Top:
- Filter Bar (sticky)

Body:
- Data table with expandable row

Right Slide Panel (optional):
- Post Analysis Bento
  - Retention graph
  - Hook score
  - Audience depth
  - Drift indicator

Use split-view only on desktop.

---

## 3.5 Insights Page Bento

Use asymmetrical hierarchy:

Row 1:
- KPI Strip

Row 2:
- Retention Overlay (8 cols)
- Hook Trend (4 cols)

Row 3:
- Audience Funnel (6 cols)
- Loyalty Trend (6 cols)

Row 4:
- Idea Clusters (6 cols)
- Longevity Curve (6 cols)

Always keep matrix as standalone large card.

---

# 4. Visual Hierarchy Rules

1. Largest card = highest strategic importance.
2. Use consistent typography scale:
   - Page Title: 24–28px
   - Card Title: 16–18px
   - KPI Number: 28–36px
   - Secondary text: 12–14px
3. Avoid more than 3 colors in one card.
4. Red reserved for:
   - Drift
   - Critical alert
5. Yellow reserved for:
   - Warning
   - Saturation risk
6. Green reserved for:
   - Positive trend

---

# 5. Interaction Best Practices

- All charts must support hover tooltips.
- All bento cards must have:
  - “View Details” action
  - Drill-down capability
- Avoid modals for analysis; use slide-over panels.
- Use skeleton loaders for data fetch.
- Stream AI results progressively where possible.

---

# 6. Responsive Design Rules

## Desktop
- Full 12-column grid
- Side nav expanded
- Split-view allowed

## Tablet
- 8-column grid
- Side nav collapsible
- Reduce multi-column density

## Mobile
- 4-column stacked layout
- KPI strip collapses into swipeable cards
- Matrix converts to vertical list with quadrant badge

---

# 7. Accessibility Requirements

- WCAG AA contrast compliance
- Keyboard navigation for tab switching
- Chart data accessible via table fallback
- No color-only encoding for alerts

---

# 8. Design Tokens Alignment

- Use existing `src/components/ui`
- No custom shadow system outside design tokens
- Use consistent border radius (2xl for main cards)
- Standard card padding system
- Avoid nested shadows

---

# 9. Anti-Patterns to Avoid

- Overcrowded KPI strips
- Infinite scrolling dashboards
- More than 2 nested navigation levels
- Mixing experimental and stable features visually
- Excessive modals

---

# 10. Future-Proofing

- Bento cards must be composable React components
- Each card must accept:
  - loading
  - error
  - empty state
- Support feature flag wrapping for phased rollout

---

# Summary

This IA ensures:

- Clear strategic hierarchy
- Agent-first architecture
- Modular expansion
- High-density but structured insight presentation
- Bento-driven layout consistency
- Scalable multi-agent dashboard UX