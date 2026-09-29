---
type: module
path: "@root/src/PuduLangDocgen/Paths.pudu"
---
# Paths

## Purpose

Pure path and browser-destination validation for [[architecture/LANGUAGE|Artifact]] publication.

## Interface

```pudu
export fn relative(path: Str) -> Bool
export fn href(destination: Str) -> Bool
export fn slug(text: Str) -> Str
export fn output(source: Str) -> Str
export fn resolve(source: Str, destination: Str) -> Result[Str, Str]
export fn escape(text: Str) -> Str
```

## Algorithm

Relative paths require nonempty slash-separated segments, forbid `.`/`..`, leading slash,
backslashes, controls, colon, percent encoding, query/fragment, and platform-reserved separators.
Browser href validation accepts relative paths, fragments, and explicit HTTP/HTTPS/mailto URLs;
refuses controls, backslashes, protocol-relative URLs and other schemes case-insensitively.
Slug lowercases text and retains Unicode alphanumerics, joining other runs with one dash;
empty becomes `section`. Markdown output replaces case-insensitive `.md`/`.markdown` with `.html`; other inputs retain
their original path. This mapping alone does not validate; Build rejects invalid paths and
collisions, including distinct sources mapping to the same output.
Resolve local links against the source directory, collapse dot segments without escaping root,
preserve query and fragment, and map article extensions. Source links may contain dot segments
and percent-encoded fragment/query data; publication destinations may not. Resolve rejects
percent encoding in the local path itself, preventing encoded separators/traversal. Query-only
and fragment-only destinations refer to the current article. Escape ampersand before HTML
metacharacters. href only validates scheme/controls; resolve performs local containment.

## Negative Logic

Never normalize traversal into an accepted publication path. Never allow executable URI schemes.
Never interpolate unescaped source text into attributes or markup.

## Edge cases

Empty href, empty slug, Unicode titles, query-only links, mixed-case schemes, encoded traversal,
UNC/drive paths and empty path segments are explicitly checked. Fragments remain browser data.

## Depth

Deep: one small contract hides consistent path, URL, and escaping policy for every producer.

## Grill Log

- Q: Permit encoded filenames? A: Refuse percent-encoded output paths; URL interpretation cannot
  change filesystem authority. Rejected: decoding after admission.
- Q: Preserve raw HTML? A: Escape unless a separately explicit trusted extension supplies it.
  Rejected: source content becomes executable markup by default.

## Referenced by

[[src/_MOC]] · [[architecture/_MOC]]
