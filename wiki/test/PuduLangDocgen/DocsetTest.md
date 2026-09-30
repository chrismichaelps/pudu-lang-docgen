---
type: test
path: "@root/test/PuduLangDocgen/DocsetTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# DocsetTest

> /** @Docgen.Docset.Tests — projects load from disk and publish incrementally */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/Docset]], [[src/PuduLangDocgen/Docset/Publish]], [[src/PuduLangDocgen/Docset/Tasks]], [[src/PuduLangDocgen/Docset/Tools]], [[src/PuduLangDocgen/Docset/Walk]], [[src/PuduLangDocgen/Command]], [[src/PuduLangDocgen/Command/Arguments]], [[src/PuduLangDocgen/Command/Actions]], [[src/PuduLangDocgen/Scaffold]], [[src/PuduLangDocgen/Serve]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- project written
- first build writes everything
- second build writes nothing
- force rewrites
- stale outputs removed
- include resolved from disk
- resource copied
- hidden files skipped
- dry run writes nothing
- missing configuration
- state kept beside the configuration
- command parsing
- command refusals
- help and version
- request targets
- served pages
- not found page served
- request lines
- media types
- response head
- unreachable service answers nothing and is asked once
- no services asked without identities
- scaffold files
- existing project refused
- scaffold builds without warnings
- template export
- merge keeps each identity once
- published files readable
- no staging files left
- options with long names
- bad log level
- new commands parse

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Publish]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[src/PuduLangDocgen/Docset/Tools]] · [[src/PuduLangDocgen/Docset/Walk]] · [[src/PuduLangDocgen/Command]] · [[src/PuduLangDocgen/Command/Arguments]] · [[src/PuduLangDocgen/Command/Actions]] · [[src/PuduLangDocgen/Scaffold]] · [[src/PuduLangDocgen/Serve]]
