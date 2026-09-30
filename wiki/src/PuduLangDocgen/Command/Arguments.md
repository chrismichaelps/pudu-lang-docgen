---
type: module
path: "@root/src/PuduLangDocgen/Command/Arguments.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Command.Arguments

> /** @Docgen.Command.Arguments — command lines read into commands, paths, and options */

## Purpose

Reads a command line into a command, positional arguments, flags, and valued options, and
holds the help text.

## Interface

### Signatures

```pudu
export type Parsed = { command: Str, positional: Array[Str], flags: Array[Str], values: Array[(Str, Str)] }
export fn parse(arguments: &Array[Str]) -> Result[Parsed, Str]
export fn usage() -> Str
export fn has(parsed: &Parsed, flag: Str) -> Bool
export fn valueOf(parsed: &Parsed, name: Str, fallback: Str) -> Str
export fn valuesOf(parsed: &Parsed, name: Str) -> Array[Str]
export fn configPath(written: Str) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Package]]
- **Consumed by:** [[src/PuduLangDocgen/Command]] · [[src/PuduLangDocgen/Command/Actions]] · [[test/PuduLangDocgen/DocsetTest]]

## Algorithm

- `parse` — Command-line arguments read into a command, positional arguments, and options.
- `usage` — Help text listing commands and options.
- `has` — Whether a flag was given.
- `valueOf` — The last value given for an option, or the fallback.
- `valuesOf` — Every value given for an option, in order.
- `configPath` — A configuration path; a folder names its `docgen.json`.

## Negative Logic (Prohibited Paths)

- Do not accept an option that is not in the tables.
- Do not accept a valued option without its value.

## Edge Cases

- `--opt=value` and `--opt value` read the same.
- Repeated options keep every value in order; `valueOf` answers the last.

## Depth

MODERATE. A table-driven reader kept apart so the command logic receives clean values.

## Grill Log

- Q: Short aliases? A: Only for the common ones listed in help. Rejected: an alias for every option.

## Referenced by

[[src/PuduLangDocgen/Command/_MOC]] · [[src/PuduLangDocgen/Command]] · [[src/PuduLangDocgen/Command/Actions]]
