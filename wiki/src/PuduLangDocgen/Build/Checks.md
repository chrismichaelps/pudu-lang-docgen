---
type: module
path: "@root/src/PuduLangDocgen/Build/Checks.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Build.Checks

> /** @Docgen.Build.Checks — whole-site validation of fragments, outputs, and diagnostic levels */

## Purpose

Whole-site checks that need every page at once: links to missing fragments, output paths that
collide or are not portable, and the diagnostic rules that raise, lower, or silence codes.

## Interface

### Signatures

```pudu
export fn fragments(pages: &Array[Docgen.Page]) -> Array[Docgen.Diagnostic]
export fn anchors(html: Str) -> Array[Str]
export fn outputs(paths: &Array[Str]) -> Array[Docgen.Diagnostic]
export fn ruled(diagnostics: &Array[Docgen.Diagnostic], rules: &Array[(Str, Str)], strict: Bool) -> Array[Docgen.Diagnostic]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[test/PuduLangDocgen/InlineTest]]

## Algorithm

- `fragments` — Fragment links that name no element of their target page. Links to files other than pages are not checked for fragments; links to missing files were reported while rendering.
- `anchors` — Every `id` attribute value in HTML.
- `outputs` — Output paths that are not portable, collide ignoring case, or put a file where a folder is.
- `ruled` — Diagnostics with configured levels applied: `off` drops a code, `info`, `warning`, and `error` set its severity, and with `strict` every remaining warning becomes an error.

## Negative Logic (Prohibited Paths)

- Do not check fragments of remote links or of files that are not pages.
- Do not let two outputs differ only by letter case.

## Edge Cases

- A file where another output needs a folder is refused.
- `off` removes a diagnostic; `warningsAsErrors` then raises what is left.

## Depth

MODERATE. Three independent checks sharing the site's view.

## Grill Log

- Q: Apply rules before strict mode? A: Rules first, strict after, so an explicit `off` stays off. Rejected: strict mode resurrecting silenced codes.

## Referenced by

[[src/PuduLangDocgen/Build/_MOC]] · [[src/PuduLangDocgen/Build]]
