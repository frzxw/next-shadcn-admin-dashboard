# 16 — Design System & UI Governance Specification

## Document Control
- Version: 0.1
- Status: Draft
- Last Updated: 2026-02-23
- Owner: Design / Frontend Architecture

---

# 1. Purpose

This document defines:

- UI system constraints
- Component usage rules
- Layout governance
- Spacing and typography standards
- Chart consistency rules
- Interaction design standards

The design system must:

- Enforce consistency
- Prevent visual entropy
- Support high-density analytics
- Preserve clarity at scale
- Reuse shared UI primitives strictly

No ad-hoc styling allowed outside defined system.

---

# 2. Core Design Principles

1. Consistency over creativity.
2. Data clarity over decoration.
3. Modular layout blocks.
4. High-density without clutter.
5. Strict reuse of shared UI primitives.
6. No inline custom styling except via tokens.

---

# 3. UI Library Enforcement Rules

The system must:

- Reuse components from `src/components/ui`
- Use existing theme tokens
- Avoid custom one-off components unless added to shared library
- Prevent arbitrary Tailwind or CSS overrides in feature folders
- Keep layout primitives centralized

---

## 3.1 Prohibited Patterns

Do NOT allow:

- Inline style attributes
- Custom color hex values
- Random spacing values
- New shadow systems
- Duplicate button variants
- Local UI copies inside feature folders

All new UI primitives must be added to shared system.

---

# 4. Layout System

## 4.1 Grid Rules

Desktop:
- 12-column grid
- Standard gap: 24px

Tablet:
- 8-column grid
- Gap: 20px

Mobile:
- 4-column stacked
- Gap: 16px

---

## 4.2 Card Rules

All dashboard content must use standardized Card component.

Card must include:

- Title (required)
- Optional subtitle
- Body content
- Optional footer actions

Card constraints:

- No more than 3 KPIs per card
- No nested cards inside cards
- Consistent padding (24px desktop / 16px mobile)
- Rounded corners via token only
- Shadow level from system only

---

# 5. Typography System

## 5.1 Scale

- Page Title: 24–28px
- Section Header: 18–20px
- Card Title: 16–18px
- KPI Primary: 28–36px
- Body Text: 14–16px
- Secondary Text: 12–14px

No arbitrary font sizes allowed.

---

## 5.2 Weight Usage

- Bold: KPI numbers, titles
- Medium: section headers
- Regular: body text
- Muted: supporting text

---

# 6. Color System

Use semantic tokens only.

## 6.1 Status Colors

- Positive (Green): growth, improvement
- Warning (Yellow): risk, saturation
- Critical (Red): drift, failure
- Neutral (Gray): inactive

Never use red for positive context.

---

## 6.2 Background Rules

- Dashboard background: neutral tone
- Cards: elevated background token
- No gradient backgrounds in analytics areas

---

# 7. Chart Standards

Charts must:

- Use consistent color palette
- Use same tooltip style
- Include axis labels
- Use consistent date formatting
- Avoid excessive gridlines

Chart density rules:

- Maximum 6 major charts per page
- Pre-aggregate data server-side
- No large dataset transformation in browser

---

# 8. KPI Presentation Rules

Each KPI block must contain:

- Large numeric value
- Trend arrow (up/down/neutral)
- Percentage delta
- Time range indicator

No decorative icons unrelated to metric.

---

# 9. Navigation Standards

## 9.1 Sidebar

- Fixed width
- Icon + label
- Active highlight
- Collapsible on smaller screens

No nested collapsible levels beyond Tier 2.

---

## 9.2 Tabs

- Horizontal layout
- Clear active underline
- Max 6 visible tabs
- Scrollable if overflow

---

# 10. Interaction Design

## 10.1 Buttons

Button variants limited to:

- Primary
- Secondary
- Ghost
- Destructive

No custom button colors per feature.

---

## 10.2 Modals

Use modals only for:

- Confirmations
- Identity edits
- Memory promotion confirmation

Analytics drill-down must use slide-over panel instead.

---

## 10.3 Loading States

All async areas must include:

- Skeleton loaders
- Disabled button state during submission
- Error fallback UI

No blank states allowed.

---

# 11. Density Management

To prevent clutter:

- No more than 6 cards above fold
- Avoid 3-column KPI grids unless necessary
- Use whitespace intentionally
- Group related metrics in same visual block

---

# 12. Accessibility Standards

- WCAG AA contrast
- Keyboard navigable tabs
- Accessible tooltips
- Charts with accessible data fallback
- Color not sole indicator of severity

---

# 13. Responsive Behavior

Desktop:
- Full grid layout
- Split views allowed

Tablet:
- Reduce columns
- Collapse secondary metrics

Mobile:
- Stack cards
- Collapse KPI strip into swipeable row
- Replace matrix visualizations with simplified list

---

# 14. Feature Flag Compatibility

Each major module must:

- Render cleanly if disabled
- Avoid layout breaking if feature removed
- Maintain consistent spacing when toggled

---

# 15. Anti-Patterns

Avoid:

- Overloaded KPI strips
- Inconsistent chart palettes
- Shadow stacking
- Mixed border radius styles
- Hidden functionality without visible affordance
- UI behavior that differs per agent without visual explanation

---

# 16. Future Enhancements

- Dark mode token expansion
- Theming per workspace (controlled)
- Density mode toggle (compact vs comfortable)
- Dashboard customization slots (enterprise)

---

# Summary

This design system ensures:

- Strict UI consistency
- Scalable analytics presentation
- Predictable component behavior
- Clean, professional interface
- Alignment with high-density creator intelligence workflows