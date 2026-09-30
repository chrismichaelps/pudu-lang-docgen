---
type: module
path: "@root/src/PuduLangDocgen/Constants/Package.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Constants.Package

> /** @Docgen.Constants.Package — the identity this package reports about itself */

## Purpose

The identity the package reports about itself: name, version, the configuration file name,
the state folder, and the built-in template names.

## Interface

### Signatures

```pudu
export const NAME: Str = "pudu-lang-docgen"
export const VERSION: Str = "0.1.0"
export const CONFIG_FILE: Str = "docgen.json"
export const STATE_FOLDER: Str = ".docgen"
export const BUILT_IN_TEMPLATES: Array[Str] = ["default", "modern", "statictoc", "rest.tagpage", "rest.operationpage"]
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[src/PuduLangDocgen/Command]] · [[src/PuduLangDocgen/Command/Actions]] · [[src/PuduLangDocgen/Command/Arguments]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Tasks]]

## Algorithm

## Negative Logic (Prohibited Paths)

- Do not let the version here differ from `pudu.toml`.

## Edge Cases

- The state folder sits beside the configuration and is never published.

## Depth

SHALLOW. Constants only.

## Grill Log

- Q: Read the version from the manifest at run time? A: A constant checked at release. Rejected: file access to print a version.

## Referenced by

[[src/PuduLangDocgen/Constants/_MOC]] · [[src/PuduLangDocgen/Command]] · [[src/PuduLangDocgen/Command/Actions]] · [[src/PuduLangDocgen/Command/Arguments]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Tasks]]
