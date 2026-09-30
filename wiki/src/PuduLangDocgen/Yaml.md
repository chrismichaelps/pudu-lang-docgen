---
type: module
path: "@root/src/PuduLangDocgen/Yaml.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Yaml

> /** @Docgen.Yaml.Module — YAML read into metadata and metadata written as YAML */

## Purpose

YAML read into metadata and metadata written as YAML. Reading handles block scalars and
sequences written at their parent key's indentation, two layouts the standard decoder loses.
Writing quotes only when plain text would read differently and prefers forms without escapes.

## Interface

### Signatures

```pudu
export fn decode(source: Str) -> Result[Docgen.Meta, Str]
export fn encode(value: &Docgen.Meta) -> Str
export fn scalar(written: Str) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Meta]]
- **Consumed by:** [[src/PuduLangDocgen/Api/Export]] · [[src/PuduLangDocgen/Build/Overwrite]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Markdown/FrontMatter]] · [[src/PuduLangDocgen/Navigation]] · [[src/PuduLangDocgen/References]] · [[src/PuduLangDocgen/Scaffold]] · [[test/PuduLangDocgen/ApiTest]] · [[test/PuduLangDocgen/InlineTest]] · [[test/PuduLangDocgen/RestTest]]

## Algorithm

- `decode` — YAML text decoded as metadata. Block scalars are read here, keeping blank lines and working inside list items, and sequences written at their parent key's indentation are indented, two layouts the standard decoder loses.
- `encode` — Metadata written as YAML, keys in their order; nested values indent by two spaces.
- `scalar` — A YAML scalar, quoted when plain text would be read differently. Quoting prefers a form without escape sequences, which every YAML reader agrees on.

## Negative Logic (Prohibited Paths)

- Do not write escape sequences when a quoted form without them exists.

## Edge Cases

- Folded scalars join lines with spaces and keep blank lines as breaks.
- Multi-line text is written as a literal block.

## Depth

MODERATE. A thin layer that makes YAML round trips safe for this package's files.

## Grill Log

- Q: Write every scalar quoted? A: Quote only when needed, so generated files read like hand-written ones. Rejected: noisy output.

## Referenced by

[[src/PuduLangDocgen/_MOC]] · [[src/PuduLangDocgen/Api/Export]] · [[src/PuduLangDocgen/Build/Overwrite]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Markdown/FrontMatter]] · [[src/PuduLangDocgen/Navigation]] · [[src/PuduLangDocgen/References]] · [[src/PuduLangDocgen/Scaffold]]
