---
type: module
path: "@root/src/PuduLangDocgen/Docset/Walk.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Docset.Walk

> /** @Docgen.Docset.Walk — confined reads of a project folder and its files */

## Purpose

Confined reads of a project folder: the sorted list of files, their text, and their bytes,
leaving out hidden entries, ignored folders, and symbolic links.

## Interface

### Signatures

```pudu
export fn files(base: Str, skip: &Array[Str]) -> Result[Array[Str], Array[Docgen.Diagnostic]]
export fn texts(base: Str, paths: &Array[Str]) -> (Map[Str, Str], Array[Docgen.Diagnostic])
export fn text(base: Str, path: Str) -> Result[Str, Docgen.Diagnostic]
export fn bytes(base: Str, path: Str) -> Result[Bytes, Docgen.Diagnostic]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[src/PuduLangDocgen/Docset/Tools]] · [[test/PuduLangDocgen/DocsetTest]]

## Algorithm

- `files` — Every regular file under a folder as a portable relative path, sorted. Hidden entries, ignored folders, the `skip` folders, and symbolic links are left out.
- `texts` — The text of files by relative path; unreadable files are reported and left out.
- `text` — The text of one file inside the folder.
- `bytes` — The bytes of one file inside the folder.

## Negative Logic (Prohibited Paths)

- Do not follow a symbolic link.
- Do not read a path that resolves outside the project.

## Edge Cases

- Unreadable files are reported and skipped, not fatal.

## Depth

MODERATE. The only file reader of project content.

## Grill Log

- Q: Follow links inside the project? A: Never, so a link cannot pull in outside files. Rejected: checking link targets case by case.

## Referenced by

[[src/PuduLangDocgen/Docset/_MOC]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[src/PuduLangDocgen/Docset/Tools]]
