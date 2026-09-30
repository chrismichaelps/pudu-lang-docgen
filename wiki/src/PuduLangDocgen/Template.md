---
type: module
path: "@root/src/PuduLangDocgen/Template.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Template

> /** @Docgen.Template.Module — logic-less page templates filled from metadata */

## Purpose

Logic-less templates: escaped and raw values, sections that repeat or show, inverted sections,
partials, comments, and dotted names looked up through a context stack.

## Interface

### Signatures

```pudu
export type Node = Literal(Str) | Value(Str, Bool) | Section(Str, Bool, Array[Node]) | Partial(Str)
export fn parse(text: Str) -> Result[Array[Node], Str]
export fn render(nodes: &Array[Node], context: &Docgen.Meta, partials: &Map[Str, Array[Node]]) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Theme]] · [[test/PuduLangDocgen/TemplateTest]]

## Algorithm

- `parse` — A template parsed into nodes; an unclosed or mismatched section is an error. `{{name}}` escapes, `{{{name}}}` and `{{& name}}` do not, `{{#name}}…{{/name}}` repeats or shows, `{{^name}}` shows when empty, `{{>name}}` includes, `{{! …}}` is ignored.
- `render` — A template rendered against metadata; `partials` are parsed templates by name.

## Negative Logic (Prohibited Paths)

- Do not run code inside templates.
- Do not expand partials past the depth bound.

## Edge Cases

- Empty text, empty lists, `false`, zero, and missing values hide a section.
- `.` names the innermost value.

## Depth

MODERATE. A parser and a renderer for a small, fixed language.

## Grill Log

- Q: A richer template language? A: Logic-less templates; the view does the thinking. Rejected: templates that need testing of their own.

## Referenced by

[[src/PuduLangDocgen/_MOC]] · [[src/PuduLangDocgen/Theme]]
