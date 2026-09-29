---
type: grammar
language: Pudu
version: "0.1.2"
tags: [grammar]
aliases: [Grammar — Pudu, Pudu Grammar]
---

# Grammar — Pudu

The Pudu surface this repository is written against, pinned to compiler `0.1.2` as published in
its release archive. Where this page and the compiler disagree, the compiler wins and this page is
corrected in the same change.

## SDK Discovery Map

| Need | Module | Entry points |
| --- | --- | --- |
| Console output | `Std.Io` | `writeLine`, `writeErrorLine` |
| Files | `Std.Io` | `append`, `read`, `write`, `exists`, `remove`, `list`, `makeDirectory`, `move`, `directoryOf`, `nameOf`, `join` |
| Threads | `Std.Concurrent` | `start`, `join`, `sleep` |
| Shared state | `Std.Sync` | `mutex`, `withLock`, `cell`, `get`, `set`, `swap` |
| Queues | `Std.Channel` | `channel`, `send`, `receive`, `pending`, `close` |
| Time | `Std.Time` | `currentInstant`, `localOffsetMinutes`, `elapsed` |
| Calendar arithmetic | `Std.Time.Format` | `partsOf`, `millisOf`, `weekdayOf`, `daysFromCivil` |
| Exact numbers | `Std.Decimal` | `fromInt`, `round`, `rescale`, `toText`, `scale` |
| JSON documents | `Std.Json` | `decode`, `field`, `asText`, `asInt`, `asBool`, `asList`, `asObject` |
| RFC 3339 moments | `Std.Time.Format` | `fromRfc3339` |
| Regular expressions | `Std.Regex` | `compile`, `find`, `replaceAll`, `explain` |
| Secure random bytes | `Std.Random` | `secureBytes` |
| Standard library logging | `Std.Log`, `Std.Out` | `Logger`, `Line`, `Level`; `Out.bare` |
| Environment | `Std.Env` | `variable`, `variableOr`, `at` |
| Processes | `Std.Process` | `output` |
| HTTP | `Std.Http`, `Std.Http.Client`, `Std.Http.Server.Route` | `Request`, `Response`, `send`, `Middleware` |
| Collections | `Std.List`, `Std.Map` | `List.get`, `List.first`, `List.find`; `Map.get`, `Map.insert` |
| Tests | `Std.Test` | `suite`, `equals`, `that`, `run`, `failuresOf`, `report` |

## Imports / Namespaces

- One module per file; the module name is the path under its source root with `/` as `.`:
  `src/PuduLangDocgen/Paths.pudu` is `module PuduLangDocgen.Paths`.
- Every import is qualified and aliased: `import Std.Sync as Sync`. Nothing is imported implicitly.
- A trait's methods are callable on a value wherever its module is imported; the trait itself is
  not imported.
- Suites under `test/` and programs under `examples/` import package modules through the
  manifest's source root.

## Core Primitives

- Records: `export type Property = { name: Str, value: Value }`, built as
  `Property{name: "Id", value: v}`, updated as `Property{..p, name: "Other"}`.
- Sum types may be recursive through arrays and records: `Value` holds `Array[Value]` and
  `Structure`, whose `Property` holds a `Value` again.
- A variant may share its name with a type: `Scalar(Scalar)` is the `Value` variant holding a
  `Scalar`.
- A function stored in a record field is called as `(record.field)(argument)`.
- A trait may be implemented for built-in types (`impl Capturable for Int`), and a generic
  function may require it: `fn of[T: Capturable](held: T) -> Value`.
- `show(value)` and `==` work on values of any type.
- `Option[T]` and `Result[T, E]` helpers are module functions (`Option.unwrapOr(value, fallback)`).
- Module scope holds only `const`. Lookup tables are `const` arrays or maps built with
  `mapOf([...])`. A `const` cannot call a function, so shared state is created by a function and
  passed on.
- Closures: `fn(x: Int) -> Int { x + 1 }`, or the short form `|x: Int| x + 1`. A closure captures
  a copy of every binding it names; state that later calls must observe lives in a `Sync.Cell`.
- Borrowing: `&T` parameters are read-only views; `*view` copies a borrowed value into an owned one.

## Numbers

- `Int` arithmetic is checked: an addition or multiplication past the 64-bit range stops the
  program. Hashes reduce every intermediate result with `%` so it stays in range.
- There is no built-in conversion between `Int` and `Float64`. A float is read as a `Decimal`
  through its text: `show(f).toDecimal()`.
- `show` renders a float in the shortest form that reads back, switching to an exponent for large
  and small magnitudes (`1.0e30`, `1.0e-7`); display formatting goes through `Decimal` instead.
- Infinity and NaN have no `Decimal`; their text is `Infinity` and `NaN`.

## Text

- String indices and lengths count characters, not bytes: `"héllo".length()` is 5.
- `slice`, `take`, `drop`, `indexOf`, `split`, `replace`, `chars`, `toUpper`, `toLower`, `trim`,
  `startsWith`, `endsWith`, `contains` are methods on `Str`.
- Text is assembled as an array of pieces joined once at the end, not by repeated `+` in a loop.

## Architectural laws

Pure modules produce values; `Docset` and `Command` alone perform effects. Every shipped module
is rooted at `PuduLangDocgen`. All output paths and browser destinations are checked before use.
Namespace anchors on files/types; concise `///` contracts on every function and constant.
Pudu formatter owns whitespace. No ambient global mutation or ignored effect failures.

## Referenced by

[[00-INDEX]] · [[src/_MOC]]
