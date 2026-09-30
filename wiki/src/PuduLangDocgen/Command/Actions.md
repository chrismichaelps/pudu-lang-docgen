---
type: module
path: "@root/src/PuduLangDocgen/Command/Actions.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Command.Actions

> /** @Docgen.Command.Actions — reporting and the commands that create and exchange files */

## Purpose

The pieces of the command line that talk to people and exchange files: the logger built from
`--logLevel`, `--verbose`, and `--log`, diagnostic reporting, and the init, template, download,
and merge commands.

## Interface

### Signatures

```pudu
export fn logger(parsed: &Arguments.Parsed) -> Result[Logger.Logger, Str]
export fn report(log: &Logger.Logger, problems: &Array[Docgen.Diagnostic]) -> ()
export fn say(log: &Logger.Logger, text: Str) -> ()
export fn detail(log: &Logger.Logger, text: Str) -> ()
export fn failed(log: &Logger.Logger, problems: &Array[Docgen.Diagnostic]) -> Int
export fn initialize(log: &Logger.Logger, parsed: &Arguments.Parsed) -> Int
export fn template(log: &Logger.Logger, parsed: &Arguments.Parsed) -> Int
export fn download(log: &Logger.Logger, parsed: &Arguments.Parsed) -> Int
export fn merge(log: &Logger.Logger, parsed: &Arguments.Parsed) -> Int
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Command/Arguments]] · [[src/PuduLangDocgen/Constants/Package]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[src/PuduLangDocgen/Scaffold]]
- **Consumed by:** [[src/PuduLangDocgen/Command]]

## Algorithm

- `logger` — A logger for a command line: messages at or above `--logLevel` (information unless set, debug with `--verbose`) on the console with warnings and errors on standard error, and every event as compact JSON in the `--log` file when one is named.
- `report` — Diagnostics written as events at their severity.
- `say` — A plain message at information level.
- `detail` — A plain message at debug level, shown with `--verbose`.
- `failed` — Reports failures and answers the failed-work status.
- `initialize` — Creates a project, asking for a title and API sources unless `--yes` accepts defaults.
- `template` — Lists built-in templates or exports one, or every one with `--all`, into a folder.
- `download` — Saves a cross-reference map named by `--xref` into a file.
- `merge` — Combines cross-reference maps into the `--output` file.

## Negative Logic (Prohibited Paths)

- Do not ask questions when `--yes` is given or input is not interactive.
- Do not overwrite an existing project on `init`.

## Edge Cases

- `--log` writes each event as compact JSON, one per line.
- `template list` prints the built-in names; `--all` exports every one.

## Depth

MODERATE. Each command is a short path to one Docset task.

## Grill Log

- Q: Write diagnostics as plain lines? A: Structured events through the logging package, so tools can read them. Rejected: ad-hoc formats per command.

## Referenced by

[[src/PuduLangDocgen/Command/_MOC]] · [[src/PuduLangDocgen/Command]]
