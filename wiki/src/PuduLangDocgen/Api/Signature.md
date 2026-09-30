---
type: module
path: "@root/src/PuduLangDocgen/Api/Signature.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Api.Signature

> /** @Docgen.Api.Signature — declarations shown with keywords marked and types linked */

## Purpose

Shows declarations as highlighted code with keywords marked and every known type name linked
to its page.

## Interface

### Signatures

```pudu
export fn resolve(unit: &Model.Unit, written: Str, references: &Map[Str, Docgen.Reference]) -> Str
export fn html(unit: &Model.Unit, signature: Str, references: &Map[Str, Docgen.Reference], page: Str) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Api/Lexer]] · [[src/PuduLangDocgen/Api/Model]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Api/Pages]] · [[test/PuduLangDocgen/ApiTest]]

## Algorithm

- `resolve` — The identity a written type name refers to inside a module, or the empty text. `Alias.Name` resolves through the module's imports; a bare name resolves inside the module first and then as a full identity.
- `html` — Declaration HTML for a page: keywords marked, resolvable names linked, the rest escaped. Line breaks and leading indentation of the declaration are kept.

## Negative Logic (Prohibited Paths)

- Do not link a name that is not in the registry.
- Do not reflow the declaration; line breaks and indentation stay.

## Edge Cases

- Names are looked up inside the module first, then as full identities.
- Names inside string literals are never linked.

## Depth

MODERATE. Resolution and markup of one line of code.

## Grill Log

- Q: Resolve by short name globally? A: Module first, then full identity, so two modules may reuse a name. Rejected: ambiguous links.

## Referenced by

[[src/PuduLangDocgen/Api/_MOC]] · [[src/PuduLangDocgen/Api/Pages]]
