---
type: module
path: "@root/src/PuduLangDocgen/Theme/Layout.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Theme.Layout

> /** @Docgen.Theme.Layout — the default page layout and its overridable partials */

## Purpose

The default page layout and the partials a template folder may override: head, header,
navigation, table of contents, breadcrumb, affix, actions, pager, and footer.

## Interface

### Signatures

```pudu
export fn templates() -> Array[(Str, Str)]
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[src/PuduLangDocgen/Docset/Tasks]] · [[src/PuduLangDocgen/Theme]]

## Algorithm

- `templates` — Template names and texts: `layout` and `partials/<name>`, each replaceable by a file of the same name in a template folder.

## Negative Logic (Prohibited Paths)

- Do not put logic in the layout; every decision arrives as view metadata.

## Edge Cases

- The footer shows unless `showFooter` is false.
- Below 1024 pixels the navbar folds behind a toggle button beside the search box.

## Depth

SHALLOW. Template text.

## Grill Log

- Q: One large layout? A: Partials, so a site can replace one part. Rejected: all-or-nothing customization.

## Referenced by

[[src/PuduLangDocgen/Theme/_MOC]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[src/PuduLangDocgen/Theme]]
