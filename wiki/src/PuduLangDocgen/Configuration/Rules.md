---
type: module
path: "@root/src/PuduLangDocgen/Configuration/Rules.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Configuration.Rules

> /** @Docgen.Configuration.Rules — cross-field rules a read configuration must satisfy */

## Purpose

Cross-field rules a read configuration must satisfy, expressed with the validator package:
an output folder, an absolute sitemap address with a valid priority and change frequency,
reference maps that are web addresses or project paths, reference services that hold `{uid}`,
distinct API destinations, a web repository for edit links, and a PDF renderer naming
`{output}`.

## Interface

### Signatures

```pudu
export type Settings = {
  output: Str,
  sitemap: Bool,
  baseUrl: Str,
  priority: Str,
  changefreq: Str,
  xref: Array[Str],
  services: Array[Str],
  destinations: Array[Str],
  repository: Str,
  renderer: Array[Str]
}
export const FREQUENCIES: Array[Str] = ["always", "hourly", "daily", "weekly", "monthly", "yearly", "never"]
export fn check(file: Str, settings: &Settings) -> Array[Docgen.Diagnostic]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Paths]] · [[src/PuduLangDocgen/References]]
- **Consumed by:** [[src/PuduLangDocgen/Configuration]]

## Algorithm

- `check` — Failures of the rules as configuration diagnostics located by property path.

## Negative Logic (Prohibited Paths)

- Do not stop at the first failing rule; every failure is reported.

## Edge Cases

- Sitemap rules apply only when a sitemap is configured.
- Priority accepts `0`, `1`, and decimals between.

## Depth

MODERATE. Declarative rules, each with its own message and property path.

## Grill Log

- Q: Hand-written checks? A: Rules through the validator package, which reports every failure with a path. Rejected: one if-chain per field.

## Referenced by

[[src/PuduLangDocgen/Configuration/_MOC]] · [[src/PuduLangDocgen/Configuration]]
