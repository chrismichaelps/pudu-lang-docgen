---
type: module
path: "@root/src/PuduLangDocgen/Api/Model.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Api.Model

> /** @Docgen.Api.Model — declarations of Pudu modules as documented reference items */

## Purpose

The declaration records extracted from a module: parameters, members (functions, types,
constants, fields, variants, methods), trait implementations, and units, plus the helpers that
split documentation into summary and remarks.

## Interface

### Signatures

```pudu
export type Parameter = { name: Str, kind: Str }
export type Member = {
  uid: Str,
  name: Str,
  kind: Str,
  signature: Str,
  doc: Str,
  line: Int,
  exported: Bool,
  parameters: Array[Parameter],
  returns: Str,
  members: Array[Member]
}
export type Implementation = { contract: Str, target: Str, line: Int, methods: Array[Member] }
export type Unit = {
  uid: Str,
  path: Str,
  doc: Str,
  line: Int,
  imports: Array[(Str, Str)],
  members: Array[Member],
  implementations: Array[Implementation]
}
export fn isType(kind: Str) -> Bool
export fn summary(doc: Str) -> Str
export fn remarks(doc: Str) -> Str
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[src/PuduLangDocgen/Api/Catalog]] · [[src/PuduLangDocgen/Api/Export]] · [[src/PuduLangDocgen/Api/Pages]] · [[src/PuduLangDocgen/Api/Parser]] · [[src/PuduLangDocgen/Api/Signature]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Overwrite]] · [[src/PuduLangDocgen/Docset]] · [[test/PuduLangDocgen/ApiExportTest]] · [[test/PuduLangDocgen/ApiTest]]

## Algorithm

- `isType` — Whether a member kind names a type-like declaration with a page of its own.
- `summary` — The first paragraph of documentation text.
- `remarks` — Documentation after its first paragraph.

## Negative Logic (Prohibited Paths)

- Do not render anything here; pages come from [[src/PuduLangDocgen/Api/Pages]].

## Edge Cases

- Documentation with no blank line is all summary and no remarks.

## Depth

SHALLOW by design: the shared vocabulary of the Api folder.

## Grill Log

- Q: Separate records per member kind? A: One `Member` with a `kind`, so filters and layouts treat kinds uniformly. Rejected: a union that every consumer must match exhaustively.

## Referenced by

[[src/PuduLangDocgen/Api/_MOC]] · [[src/PuduLangDocgen/Api/Catalog]] · [[src/PuduLangDocgen/Api/Export]] · [[src/PuduLangDocgen/Api/Pages]] · [[src/PuduLangDocgen/Api/Parser]] · [[src/PuduLangDocgen/Api/Signature]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Overwrite]] · [[src/PuduLangDocgen/Docset]]
