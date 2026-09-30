---
type: module
path: "@root/src/PuduLangDocgen/Site/Redirect.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Site.Redirect

> /** @Docgen.Site.Redirect — pages that send readers to a moved article */

## Purpose

Standalone pages that forward the browser to a moved article at once and link to it for
readers without automatic redirects.

## Interface

### Signatures

```pudu
export fn page(title: Str, destination: Str) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Build/Site]] · [[test/PuduLangDocgen/ThemeTest]]

## Algorithm

- `page` — A standalone page that forwards the browser to a destination at once and links to it.

## Negative Logic (Prohibited Paths)

- Do not put an unescaped destination in the refresh tag.

## Edge Cases

- Query strings keep their ampersands escaped in markup.

## Depth

SHALLOW. One template.

## Grill Log

- Q: Script-based redirects? A: A meta refresh plus a link. Rejected: pages that need scripts to move.

## Referenced by

[[src/PuduLangDocgen/Site/_MOC]] · [[src/PuduLangDocgen/Build/Site]]
