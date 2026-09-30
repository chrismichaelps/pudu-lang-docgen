---
type: module
path: "@root/src/PuduLangDocgen/Build/Overwrite.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Build.Overwrite

> /** @Docgen.Build.Overwrite — sections that amend documented identities from separate files */

## Purpose

Reads overwrite files: Markdown sections headed by YAML with a `uid` that replace or extend
the summary, remarks, or any property of that identity, with `*content` marking where the
section's own Markdown goes.

## Interface

### Signatures

```pudu
export type Section = { uid: Str, meta: Array[(Str, Docgen.Meta)], content: Str, target: Str, source: Str, line: Int }
export fn parse(path: Str, text: Str) -> (Array[Section], Array[Docgen.Diagnostic])
export fn metaFor(sections: &Array[Section], uid: Str) -> Array[(Str, Docgen.Meta)]
export fn units(all: &Array[Model.Unit], sections: &Array[Section]) -> Array[Model.Unit]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Api/Model]] · [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Yaml]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[test/PuduLangDocgen/InlineTest]]

## Algorithm

- `parse` — The sections of an overwrite file. A header is a `---` block whose YAML is a mapping with a `uid`; a later block whose YAML is not a mapping stays Markdown. A key whose value is `*content` receives the section's Markdown instead of the body.
- `metaFor` — Metadata the sections give an identity, later sections winning.
- `units` — Modules with their declarations' documentation amended: content aimed at `summary` or `remarks` replaces that part, content aimed at `example` adds an example section, and content aimed at nothing is added after the existing documentation.

## Negative Logic (Prohibited Paths)

- Do not overwrite an identity that does not exist without saying so.
- Do not merge sections in any order other than file order; later sections win.

## Edge Cases

- A section without `uid` is reported.
- Content aimed at no property is appended after the existing documentation.

## Depth

MODERATE. A small file format and two ways to apply it.

## Grill Log

- Q: Replace whole pages? A: Property-level amendments, so generated reference stays current. Rejected: copies of generated pages.

## Referenced by

[[src/PuduLangDocgen/Build/_MOC]] · [[src/PuduLangDocgen/Build]]
