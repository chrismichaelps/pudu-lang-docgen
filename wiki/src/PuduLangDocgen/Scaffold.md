---
type: module
path: "@root/src/PuduLangDocgen/Scaffold.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Scaffold

> /** @Docgen.Scaffold.Module — the files of a new documentation project */

## Purpose

The files of a new project from a few answers: configuration, home page, tables of contents,
guide pages, an ignore file, and an example module when an API section is wanted.

## Interface

### Signatures

```pudu
export type Answers = { title: Str, api: Bool, sources: Str, output: Str, pdf: Bool }
export fn defaults(title: Str) -> Answers
export fn files(answers: &Answers) -> Array[(Str, Str)]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Yaml]]
- **Consumed by:** [[src/PuduLangDocgen/Command/Actions]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[test/PuduLangDocgen/DocsetTest]]

## Algorithm

- `defaults` — Choices used when nothing is asked: a site titled after its folder with an API section.
- `files` — Every file of a new project by relative path.

## Negative Logic (Prohibited Paths)

- Do not write files; [[src/PuduLangDocgen/Docset/Tasks]] does.

## Edge Cases

- Without an API section, no source folder is created.
- A PDF answer sets `pdf` in global metadata, so every table of contents prints.

## Depth

SHALLOW. Text templates.

## Grill Log

- Q: Ask many questions? A: Title, API, sources, output, and PDF only. Rejected: a long interview.

## Referenced by

[[src/PuduLangDocgen/_MOC]] · [[src/PuduLangDocgen/Command/Actions]] · [[src/PuduLangDocgen/Docset/Tasks]]
