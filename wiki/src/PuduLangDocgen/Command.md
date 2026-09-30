---
type: module
path: "@root/src/PuduLangDocgen/Command.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Command

> /** @Docgen.Command.Seam — the docgen command line and its exit statuses */

## Purpose

The `docgen` command line: build, metadata, serve (with watching and opening a browser), pdf,
init, template, download, merge, version, and help, each answering an exit status of 0 for
success, 1 for failed work, and 2 for invalid usage.

## Interface

### Signatures

```pudu
export fn run(arguments: &Array[Str]) -> Int
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Command/Actions]] · [[src/PuduLangDocgen/Command/Arguments]] · [[src/PuduLangDocgen/Constants/Package]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Serve]]
- **Consumed by:** [[examples/Cli]] · [[test/PuduLangDocgen/DocsetTest]]

## Algorithm

- `run` — Runs a command line and answers its exit status: 0 success, 1 failed work, 2 invalid usage.

Arguments are parsed first; usage errors print help and answer 2. Options map onto
`Docset.Options`. `build --serve` publishes, starts the preview server, and, with `--watch`,
rebuilds whenever the source fingerprint changes.

## Negative Logic (Prohibited Paths)

- Do not exit with a status other than 0, 1, or 2.
- Do not print diagnostics except through the logger, so `--logLevel` and `--log` apply to all of them.

## Edge Cases

- A folder argument names its `docgen.json`.
- No browser opener available leaves the server running and says where it is.

## Depth

MODERATE. A dispatcher over Docset and Serve; the work lives in those modules.

## Grill Log

- Q: Watch the file system for events? A: Poll a fingerprint of the sources once a second. Rejected: platform-specific watchers.

## Referenced by

[[src/PuduLangDocgen/_MOC]]
