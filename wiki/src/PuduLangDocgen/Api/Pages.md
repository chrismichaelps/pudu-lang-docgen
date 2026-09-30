---
type: module
path: "@root/src/PuduLangDocgen/Api/Pages.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Api.Pages

> /** @Docgen.Api.Pages — reference pages for modules and the types they declare */

## Purpose

Renders the module page and one page per type: signatures with linked types, summaries,
remarks rendered as Markdown, parameters, fields, variants, methods, implementations, and source
links, laid out according to the member layout.

## Interface

### Signatures

```pudu
export type Context = { options: Catalog.Options, references: Map[Str, Docgen.Reference], outputs: Map[Str, Str], settings: Phrase.Rendering, units: Array[Model.Unit] }
export fn pages(unit: &Model.Unit, context: &Context) -> (Array[Docgen.Page], Array[Docgen.Diagnostic])
export fn kindName(kind: Str) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Api/Catalog]] · [[src/PuduLangDocgen/Api/Model]] · [[src/PuduLangDocgen/Api/Signature]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[test/PuduLangDocgen/ApiTest]]

## Algorithm

- `pages` — The module page and one page per type the module declares.
- `kindName` — The display name of a member kind.

## Negative Logic (Prohibited Paths)

- Do not render documentation text as raw HTML; it goes through the Markdown pipeline and sanitizer.
- Do not invent identities; every heading anchor comes from the catalog.

## Edge Cases

- Members on separate pages leave a summary table on the parent page.
- Documentation with `skipMarkup` is escaped text.
- A signature naming an unknown type keeps it as text.

## Depth

DEEP. Takes a unit and a context and hides every layout choice of the reference section.

## Grill Log

- Q: Link types inside signatures? A: Yes, through the registry, so a signature is navigation too. Rejected: plain code blocks.

## Referenced by

[[src/PuduLangDocgen/Api/_MOC]] · [[src/PuduLangDocgen/Build]]
