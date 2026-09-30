---
type: module
path: "@root/src/PuduLangDocgen/Api/Parser.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Api.Parser

> /** @Docgen.Api.Parser — module declarations and their documentation read from tokens */

## Purpose

Reads a module's declarations and their documentation from tokens: modules, records, unions,
aliases, traits, implementations, functions, and constants, with export status and line
numbers.

## Interface

### Signatures

```pudu
export fn parse(path: Str, source: Str) -> Model.Unit
export fn render(tokens: &Array[Lexer.Token], from: Int, to: Int) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Api/Lexer]] · [[src/PuduLangDocgen/Api/Model]]
- **Consumed by:** [[src/PuduLangDocgen/Docset]] · [[test/PuduLangDocgen/ApiExportTest]] · [[test/PuduLangDocgen/ApiTest]] · [[test/PuduLangDocgen/BuildTest]]

## Algorithm

- `parse` — The module declared in a source file at a project-relative path.
- `render` — Tokens joined the way declarations are conventionally written.

## Negative Logic (Prohibited Paths)

- Do not read function bodies; braces are balanced and skipped.
- Do not stop at the first construct it does not know; it skips to the next declaration.

## Edge Cases

- A file without a `module` line is named after its path.
- Generic parameters and bounds are kept in the signature text.
- A header comment `@Name.Role — text` documents the module with only its text.

## Depth

DEEP. One call from text to a complete unit; recovery and signature rendering stay inside.

## Grill Log

- Q: Fail on malformed files? A: Recover and publish what was read; the compiler is the place for syntax errors. Rejected: documentation builds broken by a draft file.

## Referenced by

[[src/PuduLangDocgen/Api/_MOC]] · [[src/PuduLangDocgen/Docset]]
