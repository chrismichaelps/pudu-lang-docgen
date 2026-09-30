---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Sanitize.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Markdown.Sanitize

> /** @Docgen.Markdown.Sanitize — raw HTML reduced to inert allowed elements */

## Purpose

Reduces raw HTML to allowed, inert elements and attributes; scripts, styles, event handlers,
and unknown tags become visible escaped text.

## Interface

### Signatures

```pudu
export fn clean(html: Str) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Markdown/Directives]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Markdown/Render]] · [[src/PuduLangDocgen/Site/View]]

## Algorithm

- `clean` — Raw HTML with allowed elements rebuilt from their allowed attributes. Other tags, scripts, styles, and event handlers are escaped into visible text.

## Negative Logic (Prohibited Paths)

- Do not keep any `on*` attribute.
- Do not keep a `javascript:` or other executable destination.

## Edge Cases

- `href` and `src` on allowed elements must also be safe destinations.
- Allowed elements are rebuilt from their allowed attributes, never copied.

## Depth

MODERATE. One call guarding every raw HTML path.

## Grill Log

- Q: Drop disallowed markup silently? A: Escape it so authors see what was refused. Rejected: content that vanishes.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Markdown/Render]] · [[src/PuduLangDocgen/Site/View]]
