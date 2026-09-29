# Contributing

Read the [vault](wiki/00-INDEX.md) and complete module specifications before writing code.
Work from a ready issue on `feature/<issue>-<slug>` branched from `dev`. Commits use
`type(scope): imperative summary refs #<issue>`. PRs target `dev`, link their issue, and keep
code, tests, and mirrors together. Independent implementation, public API, and parity reviews
are required. `main` holds releases only.

```sh
pudu check $(find src test tools examples -name '*.pudu')
pudu fmt --check src test tools examples
pudu lint src test tools examples
pudu test test
pudu run examples/BuildSite.pudu
pudu run tools/Mutate.pudu --domain --threshold 100
```

All shipped modules live beneath `PuduLangDocgen`. Source files remain below 500 lines.
Public declarations document accepted input, output, and failures. File/type headers use
one-line namespace anchors. Comments state contracts rather than narrating code.
Private governance inputs remain ignored and never appear in history or public artifacts.
Release promotion requires the capability ledger, mutation report, integration tests,
independent reviews, and public API wiki to agree with the delivered package.
