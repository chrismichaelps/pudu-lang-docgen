---
type: module
path: "@root/src/PuduLangDocgen/Paths.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Paths

> /** @Docgen.Paths.Module — publication paths and browser destinations share one policy */

## Purpose

One policy for publication paths and browser destinations: portable relative outputs, safe
hrefs, slugs, joining without escaping the root, relative links between pages, and escaping for
HTML.

## Interface

### Signatures

```pudu
export fn relative(path: Str) -> Bool
export fn remote(destination: Str) -> Bool
export fn href(destination: Str) -> Bool
export fn pathOf(destination: Str) -> Str
export fn suffixOf(destination: Str) -> Str
export fn slug(text: Str) -> Str
export fn output(source: Str) -> Str
export fn resolve(source: Str, destination: Str) -> Result[Str, Str]
export fn directoryOf(path: Str) -> Str
export fn join(directory: Str, path: Str) -> Result[Str, Str]
export fn between(from: Str, to: Str) -> Str
export fn rootOf(page: Str) -> Str
export fn escape(text: Str) -> Str
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[src/PuduLangDocgen/Api/Pages]] · [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Api/Signature]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Checks]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Configuration/Fields]] · [[src/PuduLangDocgen/Configuration/Rules]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[src/PuduLangDocgen/Docset/Tools]] · [[src/PuduLangDocgen/Docset/Walk]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Highlight]] · [[src/PuduLangDocgen/Markdown/Layout]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Markdown/Render]] · [[src/PuduLangDocgen/Markdown/Sanitize]] · [[src/PuduLangDocgen/Navigation]] · [[src/PuduLangDocgen/Navigation/Resolve]] · [[src/PuduLangDocgen/References]] · [[src/PuduLangDocgen/Rest/Pages]] · [[src/PuduLangDocgen/Serve]] · [[src/PuduLangDocgen/Site/Gallery]] · [[src/PuduLangDocgen/Site/Landing]] · [[src/PuduLangDocgen/Site/Print]] · [[src/PuduLangDocgen/Site/Redirect]] · [[src/PuduLangDocgen/Site/View]] · [[src/PuduLangDocgen/Template]] · [[test/PuduLangDocgen/PathsTest]]

## Algorithm

- `relative` — Whether a path names a confined, portable relative output.
- `remote` — Whether a destination leaves the site: HTTP, HTTPS, or mail.
- `href` — Whether a browser destination avoids executable schemes and ambiguous separators.
- `pathOf` — The path of a destination without its query and fragment.
- `suffixOf` — The query and fragment a destination carries after its path, including the separator.
- `slug` — A stable lowercase fragment; text with no letters or digits answers `section`.
- `output` — The published path of a source: Markdown and model files become pages, others keep their path.
- `resolve` — A local destination resolved from a source file to a root-relative published path. Remote destinations pass through; escaping the root or naming an unsafe path is refused.
- `directoryOf` — The directory part of a relative path; a top-level file answers the empty text.
- `join` — A relative path joined under a directory, collapsing dot segments without leaving the root.
- `between` — The browser path from one published page to another root-relative destination.
- `rootOf` — The `../` prefix leading from a published page back to the site root.
- `escape` — Text escaped for HTML content and quoted attributes.

## Negative Logic (Prohibited Paths)

- Do not normalize `..` into an accepted publication path.
- Do not accept executable schemes, protocol-relative addresses, or backslashes in destinations.
- Do not put unescaped text in markup or attributes.

## Edge Cases

- Text with no letters or digits slugs to `section`.
- Query-only and fragment-only destinations refer to the current page.
- Percent-encoded separators in a local path are refused.

## Depth

DEEP. A few small functions carry every path and destination decision in the package.

## Grill Log

- Q: Decode percent escapes in output paths? A: Refuse them; an encoded name cannot change what a path reaches. Rejected: decoding after admission.
- Q: Validate links by escaping only? A: Check the scheme first, then escape. Rejected: escaped but still executable destinations.

## Referenced by

[[src/PuduLangDocgen/_MOC]] · [[src/PuduLangDocgen/Api/Pages]] · [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Api/Signature]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Checks]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Configuration/Fields]] · [[src/PuduLangDocgen/Configuration/Rules]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[src/PuduLangDocgen/Docset/Tools]] · [[src/PuduLangDocgen/Docset/Walk]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Highlight]] · [[src/PuduLangDocgen/Markdown/Layout]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Markdown/Render]] · [[src/PuduLangDocgen/Markdown/Sanitize]] · [[src/PuduLangDocgen/Navigation]] · [[src/PuduLangDocgen/Navigation/Resolve]] · [[src/PuduLangDocgen/References]] · [[src/PuduLangDocgen/Rest/Pages]] · [[src/PuduLangDocgen/Serve]] · [[src/PuduLangDocgen/Site/Gallery]] · [[src/PuduLangDocgen/Site/Landing]] · [[src/PuduLangDocgen/Site/Print]] · [[src/PuduLangDocgen/Site/Redirect]] · [[src/PuduLangDocgen/Site/View]] · [[src/PuduLangDocgen/Template]]
