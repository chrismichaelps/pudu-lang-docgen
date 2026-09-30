---
type: module
path: "@root/src/PuduLangDocgen/Theme/Style.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Theme.Style

> /** @Docgen.Theme.Style — the default site stylesheet with light, dark, and print modes */

## Purpose

The default stylesheet with light, dark, and automatic schemes, responsive navigation, readable
articles, code, tables, alerts, tabs, cards, and print rules.

## Interface

### Signatures

```pudu
export fn stylesheet() -> Str
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[src/PuduLangDocgen/Theme]]

## Algorithm

- `stylesheet` — The stylesheet text published as `_assets/site.css`.

## Negative Logic (Prohibited Paths)

- Do not load remote fonts or images.

## Edge Cases

- Print hides navigation and actions and shows every tab panel.

## Depth

SHALLOW. Stylesheet text.

## Grill Log

- Q: A CSS framework? A: Hand-written rules sized to the layout. Rejected: unused framework weight.

## Referenced by

[[src/PuduLangDocgen/Theme/_MOC]] · [[src/PuduLangDocgen/Theme]]
