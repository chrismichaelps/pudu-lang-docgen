---
type: module
path: "@root/src/PuduLangDocgen/Theme.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Theme

> /** @Docgen.Theme.Module — the default site look combined with template folder overrides */

## Purpose

The default site look combined with template folder overrides: parses the layout and partials,
reports any that do not parse, renders pages, and publishes the stylesheet and script.

## Interface

### Signatures

```pudu
export type Look = { layout: Array[Template.Node], partials: Map[Str, Array[Template.Node]] }
export fn assets() -> Array[Docgen.Artifact]
export fn load(overrides: &Array[(Str, Str)]) -> Result[Look, Array[Docgen.Diagnostic]]
export fn page(look: &Look, view: &Docgen.Meta) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Template]] · [[src/PuduLangDocgen/Theme/Layout]] · [[src/PuduLangDocgen/Theme/Script]] · [[src/PuduLangDocgen/Theme/Style]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[test/PuduLangDocgen/ThemeTest]]

## Algorithm

- `assets` — The stylesheet and script every site publishes.
- `load` — The default templates with overrides applied. An override named `layout.html` replaces the layout and `partials/<name>.html` replaces or adds a partial; other files are ignored. Every template is parsed, and each one that does not parse is reported.
- `page` — A page rendered through the layout with its view metadata.

## Negative Logic (Prohibited Paths)

- Do not accept a template that does not parse.

## Edge Cases

- A template folder may replace the layout, any partial, or add partials of its own.

## Depth

MODERATE. Assembly of the look from defaults and overrides.

## Grill Log

- Q: Copy the whole theme into projects? A: Override only the files a project changes. Rejected: forks of the default look.

## Referenced by

[[src/PuduLangDocgen/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Docset/Tasks]]
