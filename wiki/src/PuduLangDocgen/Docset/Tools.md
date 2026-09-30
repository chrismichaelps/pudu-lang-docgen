---
type: module
path: "@root/src/PuduLangDocgen/Docset/Tools.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Docset.Tools

> /** @Docgen.Docset.Tools — git history, diagram rendering, remote reference maps, and reference services */

## Purpose

External tools and services a build may use: git history and repository settings, PlantUML
through Java, remote cross-reference maps, and cross-reference services queried per identity.

## Interface

### Signatures

```pudu
export fn history(base: Str) -> Map[Str, Str]
export fn repository(base: Str, configured: &Configuration.Contribution) -> Configuration.Contribution
export fn diagrams(sources: &Array[Str], settings: &Configuration.Diagrams) -> (Map[Str, Str], Array[Docgen.Diagnostic])
export fn references(base: Str, sources: &Array[Str]) -> (Array[Docgen.Reference], Array[Docgen.Diagnostic])
export fn consult(services: &Array[Str], wanted: &Array[Str]) -> (Array[Docgen.Reference], Array[Docgen.Diagnostic])
export fn fetch(address: Str) -> Result[Str, Str]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Docset/Walk]] · [[src/PuduLangDocgen/Paths]] · [[src/PuduLangDocgen/References]] · [[src/PuduLangDocgen/Repository]]
- **Consumed by:** [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[test/PuduLangDocgen/DocsetTest]]

## Algorithm

- `history` — The latest change date of every file git tracks under a folder, or none without git.
- `repository` — The repository behind edit links: configured values first, then environment variables of the running build service, then the local clone's `origin` remote and current branch.
- `diagrams` — PlantUML sources drawn by a local renderer as SVG data addresses; failures are reported and leave the remote server to draw that diagram.
- `references` — References from cross-reference maps named by web address or project path.
- `consult` — References that reference services know for identities a build left unresolved. Services are asked in order; the first to answer for an identity is kept, and a service that fails is reported once and not asked again.
- `fetch` — The body of a web address fetched within the deadline.

## Negative Logic (Prohibited Paths)

- Do not fail a build because a tool is missing; missing tools become warnings or nothing.
- Do not ask a failing service again during the same build.

## Edge Cases

- Environment variables of common build services override the local clone.
- A service answer that lists other identities is ignored for the one asked about.

## Depth

MODERATE. Thin wrappers that turn tool failures into diagnostics.

## Grill Log

- Q: Stop at the first service failure? A: Skip that service for the rest of the build and keep asking the others. Rejected: one outage hiding every answer.

## Referenced by

[[src/PuduLangDocgen/Docset/_MOC]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Tasks]]
