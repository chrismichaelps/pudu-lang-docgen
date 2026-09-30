---
type: module
path: "@root/src/PuduLangDocgen/Meta.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Meta

> /** @Docgen.Meta.Module — metadata values from configuration, files, and front matter */

## Purpose

Metadata values from configuration, files, and front matter: conversion from JSON and YAML,
lookup with typed fallbacks, deep merging, and `fileMetadata` rules that assign values to paths
matching glob patterns.

## Interface

### Signatures

```pudu
export type Rule = { pattern: Str, key: Str, value: Docgen.Meta }
export fn fromJson(value: &Json.Json) -> Docgen.Meta
export fn fromYaml(value: &Yaml.Yaml) -> Docgen.Meta
export fn toJson(value: &Docgen.Meta) -> Json.Json
export fn get(fields: &Array[(Str, Docgen.Meta)], key: Str) -> Option[Docgen.Meta]
export fn text(fields: &Array[(Str, Docgen.Meta)], key: Str) -> Option[Str]
export fn textOr(fields: &Array[(Str, Docgen.Meta)], key: Str, fallback: Str) -> Str
export fn flag(fields: &Array[(Str, Docgen.Meta)], key: Str) -> Bool
export fn fieldsOf(fields: &Array[(Str, Docgen.Meta)], key: Str) -> Array[(Str, Docgen.Meta)]
export fn put(fields: &Array[(Str, Docgen.Meta)], key: Str, value: Docgen.Meta) -> Array[(Str, Docgen.Meta)]
export fn merge(base: &Array[(Str, Docgen.Meta)], over: &Array[(Str, Docgen.Meta)]) -> Array[(Str, Docgen.Meta)]
export fn rulesOf(fields: &Array[(Str, Docgen.Meta)]) -> Result[Array[Rule], Str]
export fn forPath(rules: &Array[Rule], path: Str) -> Array[(Str, Docgen.Meta)]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen]]
- **Consumed by:** [[src/PuduLangDocgen/Api/Catalog]] · [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Overwrite]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Configuration/Fields]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Publish]] · [[src/PuduLangDocgen/Navigation]] · [[src/PuduLangDocgen/References]] · [[src/PuduLangDocgen/Rest/OpenApi]] · [[src/PuduLangDocgen/Site/Gallery]] · [[src/PuduLangDocgen/Site/Print]] · [[src/PuduLangDocgen/Site/Search]] · [[src/PuduLangDocgen/Site/Sitemap]] · [[src/PuduLangDocgen/Site/Strings]] · [[src/PuduLangDocgen/Site/View]] · [[src/PuduLangDocgen/Template]] · [[src/PuduLangDocgen/Yaml]] · [[test/PuduLangDocgen/RestTest]]

## Algorithm

- `fromJson` — A JSON value as metadata; fractional numbers keep their written text.
- `fromYaml` — A YAML value as metadata; fractional numbers keep their written text.
- `toJson` — Metadata as JSON, preserving key order.
- `get` — The value stored under a key, if any.
- `text` — The text stored under a key; numbers and flags answer their written form.
- `textOr` — The text under a key, or the fallback when it is missing or not scalar.
- `flag` — Whether a key holds `true`, or the text `true`.
- `fieldsOf` — The fields of a nested object under a key; other values answer no fields.
- `put` — The fields with a key set to a value, replacing an earlier value in place.
- `merge` — Later fields override earlier ones; nested objects merge key by key.
- `rulesOf` — Rules from a `fileMetadata` object: each key maps glob patterns to values.
- `forPath` — The metadata every matching rule assigns to a path; later rules win.

## Negative Logic (Prohibited Paths)

- Do not turn fractional numbers into floats; they keep their written text.
- Do not reorder keys; output keeps the order values were written in.

## Edge Cases

- `true` written as text counts as a flag.
- Merging replaces lists and scalars and merges nested objects key by key.

## Depth

MODERATE. The accessors every phase reads settings through.

## Grill Log

- Q: Store numbers as floats? A: Whole numbers as integers and others as their text. Rejected: `0.10` becoming `0.1` in output.

## Referenced by

[[src/PuduLangDocgen/_MOC]] · [[src/PuduLangDocgen/Api/Catalog]] · [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Overwrite]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Configuration/Fields]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Publish]] · [[src/PuduLangDocgen/Navigation]] · [[src/PuduLangDocgen/References]] · [[src/PuduLangDocgen/Rest/OpenApi]] · [[src/PuduLangDocgen/Site/Gallery]] · [[src/PuduLangDocgen/Site/Print]] · [[src/PuduLangDocgen/Site/Search]] · [[src/PuduLangDocgen/Site/Sitemap]] · [[src/PuduLangDocgen/Site/Strings]] · [[src/PuduLangDocgen/Site/View]] · [[src/PuduLangDocgen/Template]] · [[src/PuduLangDocgen/Yaml]]
