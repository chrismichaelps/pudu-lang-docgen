---
type: module
path: "@root/src/PuduLangDocgen/References.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.References

> /** @Docgen.References.Module — unique identities and exchanged cross-reference maps */

## Purpose

Unique identities and exchanged cross-reference maps: the registry of page and external
identities, maps read and written as YAML or JSON, the list answers of reference services, the
identities a build left unresolved, and service addresses built from `{uid}` templates.

## Interface

### Signatures

```pudu
export const UNRESOLVED: Str = "unresolved cross reference: "
export const UID_SLOT: Str = "\{uid\}"
export fn registry(own: &Array[Docgen.Reference], external: &Array[Docgen.Reference]) -> (Map[Str, Docgen.Reference], Array[Docgen.Diagnostic])
export fn toYaml(references: &Array[Docgen.Reference], baseUrl: Str) -> Str
export fn toJson(references: &Array[Docgen.Reference], baseUrl: Str) -> Str
export fn parse(origin: Str, text: Str) -> Result[Array[Docgen.Reference], Str]
export fn unresolved(diagnostics: &Array[Docgen.Diagnostic]) -> Array[Str]
export fn serviceAddress(service: Str, uid: Str) -> Str
export fn ofPages(pages: &Array[Docgen.Page]) -> Array[Docgen.Reference]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Paths]] · [[src/PuduLangDocgen/Yaml]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Configuration/Rules]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[src/PuduLangDocgen/Docset/Tools]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[test/PuduLangDocgen/ReferencesTest]]

## Algorithm

- `registry` — References by identity: page identities first, then external maps. A page identity declared twice is an error; an external identity already known is skipped.
- `toYaml` — A cross-reference map as YAML, sorted by identity. Relative destinations are relative to the site root, which `baseUrl` names when it is not empty.
- `toJson` — A cross-reference map as JSON with the same fields as the YAML form.
- `parse` — References read from a YAML or JSON cross-reference map, or from the bare JSON list of references a reference service answers with. Relative destinations resolve against the map's `baseUrl`, or else against the address the map was read from.
- `unresolved` — Identities of the cross references a build reported as unresolved, each once.
- `serviceAddress` — The address a reference service is asked at for one identity: every `{uid}` in the service address replaced by the percent-encoded identity.
- `ofPages` — References of published pages that declare an identity.

## Negative Logic (Prohibited Paths)

- Do not let an external map redefine an identity the site declares.
- Do not accept a reference with an unsafe `href`.
- Do not read a bare list from YAML; only a JSON service answer may be a list.

## Edge Cases

- Relative hrefs resolve against `baseUrl`, or against the folder of the address the map came from.
- Identities in service addresses are percent-encoded.

## Depth

MODERATE. Registry and map formats in one module.

## Grill Log

- Q: Page identity or external identity on conflict? A: The site's own identity wins; a second page declaring it is an error. Rejected: external maps shadowing local pages.

## Referenced by

[[src/PuduLangDocgen/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Configuration/Rules]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[src/PuduLangDocgen/Docset/Tools]] · [[src/PuduLangDocgen/Markdown/Phrase]]
