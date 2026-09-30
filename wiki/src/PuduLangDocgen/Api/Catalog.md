---
type: module
path: "@root/src/PuduLangDocgen/Api/Catalog.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Api.Catalog

> /** @Docgen.Api.Catalog — selected declarations, their pages, identities, and navigation */

## Purpose

Decides which declarations are published and where: filter rules, private members, the
module and member layouts, categories in the navigation, page paths, identities for cross
references, and links to source lines.

## Interface

### Signatures

```pudu
export type Rule = { include: Bool, pattern: Regex.Regex, kind: Str }
export type Options = {
  dest: Str,
  includePrivate: Bool,
  include: Array[Str],
  exclude: Array[Str],
  rules: Array[Rule],
  sourceUrl: Str,
  sourceExclude: Array[Str],
  nested: Bool,
  separate: Bool,
  skipMarkup: Bool,
  alphabetic: Bool,
  categories: Str
}
export fn defaults() -> Options
export fn rules(value: &Docgen.Meta) -> Result[Array[Rule], Str]
export fn select(units: &Array[Model.Unit], options: &Options) -> Array[Model.Unit]
export fn pageOf(options: &Options, uid: Str) -> Str
export fn references(units: &Array[Model.Unit], options: &Options) -> Array[Docgen.Reference]
export fn toc(units: &Array[Model.Unit], options: &Options) -> Array[Docgen.TocItem]
export fn sourceLink(options: &Options, path: Str, line: Int) -> Str
export fn lastName(uid: Str) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Api/Model]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Meta]]
- **Consumed by:** [[src/PuduLangDocgen/Api/Export]] · [[src/PuduLangDocgen/Api/Pages]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Docset]] · [[test/PuduLangDocgen/ApiTest]]

## Algorithm

- `defaults` — Options that show exported declarations under `api` with default layouts.
- `rules` — Rules of a filter file: `apiRules` listing `include` or `exclude` entries, each with a `uidRegex` and an optional `type` of `Module`, `Type`, `Function`, `Constant`, or `Member`.
- `select` — Declarations kept for publication: exported ones unless private ones are asked for, whose identity matches an include pattern when any is given and no exclude pattern.
- `pageOf` — The published path of a module or type page.
- `references` — Identities of every module, declaration, field, variant, and method with its destination. Modules and types have pages; functions and constants are sections of their module page, and fields, variants, and methods sections of their type page.
- `toc` — Navigation of modules, each listing its types and traits, and its functions and constants when they have pages of their own. Items carry the identity they link to. Nested navigation groups modules under the modules their names extend.
- `sourceLink` — A browser link to a declaration's source line, or the empty text without a pattern. The pattern names `{path}` and `{line}`.
- `lastName` — The last dotted segment of an identity.

Modules are visited in identity order. A declaration survives when it is exported (or private
members are asked for), its identity matches an include pattern when any exists and no exclude
pattern, and the first filter rule that fits its kind includes it. A module with no surviving
members and no documentation is dropped. With `nested`, navigation folds dotted module names
into a tree; with `separate`, members get pages and navigation entries of their own.

## Negative Logic (Prohibited Paths)

- Do not publish a private member unless `includePrivateMembers` is set.
- Do not let a later filter rule override the first rule that matched.
- Do not order navigation by declaration order; readers scan names alphabetically.

## Edge Cases

- A filter rule with no `type` applies to every kind.
- `member` rules skip modules and types.
- A source link pattern without `{line}` still links the file.
- A module prefix with no module of its own becomes a group without a page.

## Depth

DEEP. One options record controls selection, layout, navigation, and identities, hiding the
rules every page and table of contents depend on.

## Grill Log

- Q: Evaluate every filter rule and combine? A: First match wins, the reading order of the filter file. Rejected: last-match and union semantics that surprise authors.
- Q: Drop empty modules? A: Keep a module with documentation even without members; it still explains the package. Rejected: hiding documented namespaces.

## Referenced by

[[src/PuduLangDocgen/Api/_MOC]] · [[src/PuduLangDocgen/Api/Export]] · [[src/PuduLangDocgen/Api/Pages]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Docset]]
