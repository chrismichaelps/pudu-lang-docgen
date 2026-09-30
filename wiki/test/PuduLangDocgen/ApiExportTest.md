---
type: test
path: "@root/test/PuduLangDocgen/ApiExportTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# ApiExportTest

> /** @Docgen.Api.ExportTests — extracted declarations round out as model, Markdown, and API pages */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/Api/Export]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- json paths
- json model decodes
- json toc links json files
- markdown paths
- formats
- markdown M.md
- markdown M.R.md
- markdown M.U.md
- markdown M.T.md
- markdown N.md
- markdown N.E.md
- markdown toc.yml
- apiPage M.yml
- apiPage M.R.yml
- apiPage M.U.yml
- apiPage M.T.yml
- apiPage N.yml
- apiPage N.E.yml

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/Api/Export]]
