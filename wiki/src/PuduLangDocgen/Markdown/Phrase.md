---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Phrase.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Markdown.Phrase

> /** @Docgen.Markdown.Phrase — inline HTML with checked links, images, and cross references */

## Purpose

Renders inline nodes as HTML while checking every destination: local links resolve to published
pages and record fragments for site-wide checks, images resolve to resources, unsafe schemes
are refused, and cross references link through the registry or are reported as unresolved.

## Interface

### Signatures

```pudu
export type Rendering = { newTab: Bool, plantUml: Str, diagrams: Map[Str, Str], alertClasses: Map[Str, Str], alertTitles: Map[Str, Str] }
export type Scope = { page: Str, source: Str, outputs: Map[Str, Str], references: Map[Str, Docgen.Reference], settings: Rendering }
export type Out = {
  pieces: Array[Str],
  headings: Array[Docgen.Heading],
  ids: Array[Str],
  links: Array[Docgen.Link],
  diagnostics: Array[Docgen.Diagnostic],
  features: Array[Str],
  groups: Int,
  notes: Array[Str]
}
export fn rendering() -> Rendering
export fn start() -> Out
export fn emit(out: Out, text: Str) -> Out
export fn report(out: Out, found: Docgen.Diagnostic) -> Out
export fn need(out: Out, feature: Str) -> Out
export fn inlines(out: Out, nodes: &Array[Syntax.Inline], context: &Scope, origin: Str) -> Out
export fn destination(out: Out, target: &Syntax.Target, context: &Scope, origin: Str, image: Bool) -> (Out, Str)
export fn referenceHref(reference: &Docgen.Reference, context: &Scope) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Markdown/Syntax]] · [[src/PuduLangDocgen/Paths]] · [[src/PuduLangDocgen/References]]
- **Consumed by:** [[src/PuduLangDocgen/Api/Pages]] · [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Render]] · [[src/PuduLangDocgen/Rest/Pages]] · [[src/PuduLangDocgen/Site/Gallery]] · [[src/PuduLangDocgen/Site/Landing]] · [[test/PuduLangDocgen/ApiTest]] · [[test/PuduLangDocgen/MarkdownTest]] · [[test/PuduLangDocgen/RestTest]] · [[test/PuduLangDocgen/SiteLandingTest]] · [[test/PuduLangDocgen/ThemeTest]]

## Algorithm

- `rendering` — Rendering choices used when a site configures none.
- `start` — An empty accumulator.
- `emit` — The accumulator with text appended.
- `report` — The accumulator with a diagnostic recorded.
- `need` — The accumulator noting that a page needs a client feature such as `math` or `mermaid`.
- `inlines` — Inline nodes appended as HTML; `origin` is the file the nodes were written in.
- `destination` — The browser destination of a written link, recording local targets for validation. Unsafe and unknown destinations produce diagnostics and answer the empty text.
- `referenceHref` — A browser destination to a reference, relative to the page unless remote.

## Negative Logic (Prohibited Paths)

- Do not link an unsafe destination.
- Do not emit author text without escaping.

## Edge Cases

- Images pointing at video hosts or video files become embeds.
- Remote links open in a new tab when the site asks for it.
- An unresolved `@uid` shorthand is shown with its `@` and still reported.

## Depth

DEEP. The single place inline output and link policy meet.

## Grill Log

- Q: Warn or fail on broken links? A: Warn with a stable code; rules or strict mode can raise it. Rejected: failing drafts outright.
- Q: Report unresolved references as free text? A: A fixed prefix constant followed by the identity, which reference services read back. Rejected: a second channel for the same fact.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Api/Pages]] · [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Render]] · [[src/PuduLangDocgen/Rest/Pages]] · [[src/PuduLangDocgen/Site/Gallery]] · [[src/PuduLangDocgen/Site/Landing]]
