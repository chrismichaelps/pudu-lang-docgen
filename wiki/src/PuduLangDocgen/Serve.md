---
type: module
path: "@root/src/PuduLangDocgen/Serve.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Serve

> /** @Docgen.Serve.Seam — a local preview server for a published site folder */

## Purpose

A local preview server for a published folder: `GET` and `HEAD` for files and folder indexes,
the site's own not-found page for missing files, and plain refusals for anything else, until
interrupted.

## Interface

### Signatures

```pudu
export type Reply = { status: Int, media: Str, body: Bytes }
export fn target(path: Str) -> Option[Str]
export fn decode(path: Str) -> Option[Str]
export fn serve(root: Str, host: Str, port: Int) -> Result[Int, Str]
export fn reply(root: Str, line: Str) -> Reply
export fn answer(root: Str, path: Str) -> Reply
export fn head(answered: &Reply) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Command]] · [[test/PuduLangDocgen/DocsetTest]]

## Algorithm

- `target` — The site-relative file a request path names: folders name their `index.html`, and paths that are not portable after percent-decoding name nothing.
- `decode` — A request path with `%XX` escapes decoded as UTF-8, or none when an escape is malformed.
- `serve` — Serves a folder until interrupted, answering how many requests were served.
- `reply` — The reply to a request line: files and folder indexes for `GET` and `HEAD`, the site's not-found page for missing files, and plain refusals for malformed or other requests. A `HEAD` reply keeps its body so the head reports its length; only the body is not sent.
- `answer` — The reply for a request path: the file, a folder's index, or the site's not-found page.
- `head` — The response head of a reply.

## Negative Logic (Prohibited Paths)

- Do not serve a file outside the folder, a folder itself, or a symbolic link.
- Do not accept a request path whose percent escapes are malformed.

## Edge Cases

- `HEAD` answers the length of the body it does not send.
- Without a `404.html`, missing files get a plain text reply.

## Depth

MODERATE. Request handling is pure and tested; only `serve` touches the network.

## Grill Log

- Q: Use the HTTP server package? A: A minimal loop over the network module, so the preview handles exactly the two methods it needs. Rejected: a larger dependency for static files.

## Referenced by

[[src/PuduLangDocgen/_MOC]] · [[src/PuduLangDocgen/Command]]
