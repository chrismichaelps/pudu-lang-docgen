---
type: module
path: "@root/src/PuduLangDocgen/Theme/Script.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Theme.Script

> /** @Docgen.Theme.Script — the default site behavior: navigation, tabs, search, and theme */

## Purpose

The default site behavior: theme switching, mobile navigation, the table of contents filter,
tabs with synchronized selection, copy buttons, search with keyboard use, and affix
highlighting.

## Interface

### Signatures

```pudu
export fn script() -> Str
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[src/PuduLangDocgen/Theme]]

## Algorithm

- `script` — The script text published as `_assets/site.js`.

## Negative Logic (Prohibited Paths)

- Do not build DOM from strings with `innerHTML`.
- Do not load scripts or data from another origin; search reads the site's own index.

## Edge Cases

- Storage and clipboard may be unavailable; features degrade without errors.
- Search needs the site to be served over HTTP.

## Depth

MODERATE. Plain script with no build step.

## Grill Log

- Q: A framework? A: Plain script, a single file. Rejected: a bundler for a documentation site.

## Referenced by

[[src/PuduLangDocgen/Theme/_MOC]] · [[src/PuduLangDocgen/Theme]]
