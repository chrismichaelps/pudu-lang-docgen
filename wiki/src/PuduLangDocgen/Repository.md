---
type: module
path: "@root/src/PuduLangDocgen/Repository.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Repository

> /** @Docgen.Repository.Module — source repository identity and file history from their raw forms */

## Purpose

Source repository identity and file history from raw forms: remote addresses normalized to
browsable HTTPS, repository and branch from build service environment variables, and last change
dates from git log text.

## Interface

### Signatures

```pudu
export fn normalize(remote: Str) -> Str
export fn fromEnvironment(variables: &Array[(Str, Str)]) -> (Str, Str)
export fn history(log: Str) -> Map[Str, Str]
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[src/PuduLangDocgen/Docset/Tools]] · [[test/PuduLangDocgen/InlineTest]]

## Algorithm

- `normalize` — A remote address as a browsable HTTPS address without credentials or `.git`. `git@host:owner/repo.git` and `ssh://git@host/owner/repo` both become `https://host/owner/repo`.
- `fromEnvironment` — The repository address and branch environment variables name, when they name them. `DOCGEN_SOURCE_REPOSITORY_URL` and `DOCGEN_SOURCE_BRANCH_NAME` override every service.
- `history` — The latest change date of each file from log text that lists `@YYYY-MM-DD` lines followed by the files each change touched, newest first.

## Negative Logic (Prohibited Paths)

- Do not keep credentials from a remote address in edit links.

## Edge Cases

- `DOCGEN_SOURCE_REPOSITORY_URL` and `DOCGEN_SOURCE_BRANCH_NAME` override every build service.
- SSH and scp-style remotes become HTTPS addresses without `.git`.

## Depth

MODERATE. Pure parsing kept apart from the git calls in [[src/PuduLangDocgen/Docset/Tools]].

## Grill Log

- Q: Parse git output inside the tool wrapper? A: Pure functions here, testable without git. Rejected: tests that need a repository.

## Referenced by

[[src/PuduLangDocgen/_MOC]] · [[src/PuduLangDocgen/Docset/Tools]]
