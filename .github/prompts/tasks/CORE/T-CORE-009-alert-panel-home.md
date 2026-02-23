# Task ID: T-CORE-009

## Title
Alert Panel — Home Dashboard

## Area
CORE

## Requirement IDs
- REQ-CORE-001
- REQ-CORE-005

## Depends On
- T-CORE-006

## Description
Build the alert panel component for the Home dashboard. Display high-priority alerts for drift, saturation, uncanny risk, and other strategic signals. Alerts have severity tiers (Info, Warning, Critical) with appropriate color coding and states. Critical alerts are sticky and require acknowledgment.

Reference: specs/19-alerting-system.md §2–§9, specs/04-information-architecture.md §3.2 Row 2.

## Acceptance Criteria
- Alert panel renders in 6-col card on Home dashboard
- Supports Info (subtle badge), Warning (yellow), Critical (red highlight)
- Each alert has: category, message, recommended action, timestamp
- Critical alerts sticky at top, require acknowledgment
- Duplicate alerts suppressed (specs/19-alerting-system.md §2)
- Alert categories: Identity/Drift, Performance, Experiment, Memory, Ingestion
- Alerts expire or resolve (lifecycle)

## Technical Notes
- Red reserved for drift/critical, yellow for warning/saturation (specs/16-design-system-alignment.md §6.1)
- No color-only encoding for severity (accessibility) (specs/04-information-architecture.md §7)
- Use high contrast for alert cards
- Server-side data fetching — load alerts for workspace
- Alert data model may need a lightweight `alerts` table or computed from existing data

## Definition of Done
- Requirement satisfied: REQ-CORE-001, REQ-CORE-005
- Type-safe alert types
- No console errors
- Accessibility: color not sole indicator
- UI follows shared UI primitives rules
