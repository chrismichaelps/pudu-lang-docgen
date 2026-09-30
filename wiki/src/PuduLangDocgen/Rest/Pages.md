---
type: module
path: "@root/src/PuduLangDocgen/Rest/Pages.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Rest.Pages

> /** @Docgen.Rest.Pages — HTTP interface reference pages with linked schemas */

## Purpose

Renders HTTP interface reference pages: an overview, operations with parameters, bodies, and
responses, and linked schemas, on one page or split by tag or by operation.

## Interface

### Signatures

```pudu
export fn page(service: &OpenApi.Service, uid: Str, context: &Phrase.Scope) -> (Docgen.Page, Array[Docgen.Reference], Array[Docgen.Diagnostic])
export fn split(service: &OpenApi.Service, uid: Str, context: &Phrase.Scope, byTag: Bool, byOperation: Bool) -> (Array[Docgen.Page], Array[Docgen.Reference], Array[Docgen.Diagnostic])
```

### Linkage

- **Requires:** [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Paths]] · [[src/PuduLangDocgen/Rest/OpenApi]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[test/PuduLangDocgen/RestTest]]

## Algorithm

- `page` — The page of a service and the identities of its operations and schemas. The service's own identity is `uid`; operations are `uid.operationId` and schemas `uid.schemas.Name`.
- `split` — A service spread over several pages: an overview holding servers and schemas, a page per tag when `byTag`, and a page per operation when `byOperation`. Sub-pages live in a folder named after the overview page.

## Negative Logic (Prohibited Paths)

- Do not render descriptions without the Markdown pipeline.

## Edge Cases

- Operation identities are `uid.operationId`; schema identities are `uid.schemas.Name`.
- Split pages sit in a folder named after the overview page.

## Depth

MODERATE. Layout of one service in three shapes.

## Grill Log

- Q: Separate identity scheme for schemas? A: A `schemas` segment, so schema and operation names never collide. Rejected: one flat namespace.

## Referenced by

[[src/PuduLangDocgen/Rest/_MOC]] · [[src/PuduLangDocgen/Build]]
