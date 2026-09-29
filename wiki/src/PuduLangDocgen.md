---
type: module
path: "@root/src/PuduLangDocgen.pudu"
---
# Shared model

## Purpose

[[architecture/LANGUAGE]] vocabulary shared across parsing, navigation, metadata, rendering,
and build effects. Values carry no capabilities and never perform work during construction.

## Interface

```pudu
export type Severity = Information | Warning | Error
export type Resource = { path: Str, content: Bytes }
export type Plan = { artifacts: Array[Artifact], resources: Array[Resource], diagnostics: Array[Diagnostic] }
export type Source = { path: Str, text: Str }
export type Heading = { id: Str, title: Str, level: Int }
export type Link = { target: Str, line: Int }
export type Page = { path: Str, title: Str, uid: Str, body: Str, headings: Array[Heading], links: Array[Link] }
export type Diagnostic = { code: Str, severity: Severity, path: Str, line: Int, message: Str }
export type Reference = { uid: Str, href: Str, name: Str }
export type TocItem = { title: Str, href: Str, children: Array[TocItem] }
export type Symbol = { uid: Str, name: Str, kind: Str, signature: Str, summary: Str, source: Str, line: Int }
export type Artifact = { path: Str, content: Str }
export type Config = { title: Str, input: Str, output: Str, baseUrl: Str, locale: Str, strict: Bool }
export type Report = { paths: Array[Str], diagnostics: Array[Diagnostic] }
```

## Algorithm

Construct immutable values; source paths identify input, page/artifact paths identify relative
output. Heading IDs remain stable within a page; diagnostics retain one-based line provenance.
References hold checked destinations. Empty UID means the article supplied none.
Severity is explicit. Plans contain text and binary resources; a successful Report names emitted
paths and nonfatal diagnostics. Fatal failures use Result.Err at the build boundary. Config is
the initial static article configuration; future importers define additional typed options.

## Negative Logic

No hidden filesystem handles, shared mutable state, upstream implementation types, or
implicit build execution. No untyped option bags.

## Edge cases

Empty articles and optional linkless TOC groups remain representable. Duplicate identity and
path decisions belong to build validation rather than unchecked record construction.
Symbol is a provisional flat interchange value; structured kind, parameter, relationship, and
documentation models are required before catalog capability can be marked complete.
Publication failure returns diagnostic errors, never a successful Report; failed effects may
leave files already written and must explicitly describe partial output until atomic publication
is implemented and tested. The current shared model makes no atomicity guarantee.

## Depth

Shared vocabulary; deliberately shallow data boundary, no behavioral wrappers.

## Grill Log

- Q: Hide values behind fluent constructors? A: Plain records keep extension points usable.
  Rejected: constructors concealing defaults and validation.
- Q: How represent diagnostics? A: Stable code/path/line/message, not unstructured exceptions.
  Rejected: failures without provenance.

## Referenced by

[[src/_MOC]] · [[architecture/_MOC]]
