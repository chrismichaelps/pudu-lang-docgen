---
type: module
path: "@root/src/PuduLangDocgen/Configuration/Fields.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Configuration.Fields

> /** @Docgen.Configuration.Fields — typed reads of configuration values with exact failures */

## Purpose

Typed reads of configuration values that fail with the dotted location of the value: text,
flags, lists, objects, folders inside the project, and source folders that may climb with `../`.

## Interface

### Signatures

```pudu
export type Reader = { file: Str, at: Str, fields: Array[(Str, Docgen.Meta)] }
export fn failure(reader: &Reader, key: Str, message: Str) -> Docgen.Diagnostic
export fn only(reader: &Reader, allowed: &Array[Str]) -> Result[(), Docgen.Diagnostic]
export fn nested(reader: &Reader, key: Str) -> Result[Reader, Docgen.Diagnostic]
export fn text(reader: &Reader, key: Str, fallback: Str) -> Result[Str, Docgen.Diagnostic]
export fn flag(reader: &Reader, key: Str, fallback: Bool) -> Result[Bool, Docgen.Diagnostic]
export fn texts(reader: &Reader, key: Str) -> Result[Array[Str], Docgen.Diagnostic]
export fn objects(reader: &Reader, key: Str) -> Result[Array[Reader], Docgen.Diagnostic]
export fn directory(reader: &Reader, key: Str, fallback: Str) -> Result[Str, Docgen.Diagnostic]
export fn sourceFolder(reader: &Reader, key: Str, fallback: Str) -> Result[Str, Docgen.Diagnostic]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Configuration]]

## Algorithm

- `failure` — A configuration failure naming the dotted location of the value.
- `only` — Every key of an object is one of the allowed names.
- `nested` — A reader for the object stored under a key; a missing key reads as empty.
- `text` — Text under a key, or the fallback when it is missing.
- `flag` — A flag under a key, or the fallback when it is missing.
- `texts` — A list of text under a key; a single text counts as a list of one.
- `objects` — Readers for each object of a list under a key; a single object counts as a list of one.
- `directory` — A relative directory under a key: empty for the configuration folder, never leaving it.
- `sourceFolder` — A relative folder under a key that may start above the configuration folder with `../` segments; the rest must be a portable relative path.

## Negative Logic (Prohibited Paths)

- Do not let a folder escape the project, except source folders by at most eight `../` steps.

## Edge Cases

- A number where text is expected reads as its written form.
- `null` reads as missing.

## Depth

MODERATE. The one place configuration shapes are enforced.

## Grill Log

- Q: Allow absolute folders? A: Relative only, so a project moves as a unit. Rejected: machine-specific configuration.

## Referenced by

[[src/PuduLangDocgen/Configuration/_MOC]] · [[src/PuduLangDocgen/Configuration]]
