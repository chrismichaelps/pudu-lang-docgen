---
type: module
path: "@root/src/PuduLangDocgen/Docset/Publish.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Docset.Publish

> /** @Docgen.Docset.Publish — confined, incremental writing of a validated plan */

## Purpose

Writes a validated plan into the output folder incrementally: unchanged files are left alone,
changed files are replaced atomically, and outputs the plan no longer has are removed, using a
record of the previous build.

## Interface

### Signatures

```pudu
export fn publish(root: Str, plan: &Docgen.Plan, state: Str, force: Bool) -> Result[Docgen.Report, Array[Docgen.Diagnostic]]
export fn place(path: Str, text: Str) -> Result[(), Array[Docgen.Diagnostic]]
export fn placeBytes(path: Str, content: &Bytes) -> Result[(), Array[Docgen.Diagnostic]]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Meta]]
- **Consumed by:** [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Tasks]]

## Algorithm

- `publish` — Writes a plan under an output folder. Files whose content matches the previous build's record are left untouched unless `force` is set; files the previous build wrote that this plan no longer has are removed. The record is kept in the `state` file.
- `place` — A text file replaced in one step: written beside its target with the usual file mode, then renamed over it, so readers never see a partial file. The folder is created when missing.
- `placeBytes` — A binary file replaced in one step, like `place`.

## Negative Logic (Prohibited Paths)

- Do not remove files the previous build did not write.
- Do not write a file in place; each write goes through a temporary file and a rename.

## Edge Cases

- `force` rewrites everything.
- A missing or unreadable record counts as a first build.

## Depth

MODERATE. Hashing, confined writes, and cleanup behind one call.

## Grill Log

- Q: Delete the output folder before building? A: Remove only what the previous build wrote. Rejected: wiping files people placed there.

## Referenced by

[[src/PuduLangDocgen/Docset/_MOC]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Tasks]]
