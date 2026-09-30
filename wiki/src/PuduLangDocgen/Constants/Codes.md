---
type: module
path: "@root/src/PuduLangDocgen/Constants/Codes.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Constants.Codes

> /** @Docgen.Constants.Codes — stable diagnostic codes reported by every phase */

## Purpose

Every diagnostic code the package reports, one documented constant each. Codes are stable so
rules in configuration keep working across releases.

## Interface

### Signatures

```pudu
export const UNCLOSED_BLOCK: Str = "DG101"
export const INCLUDE_MISSING: Str = "DG102"
export const INCLUDE_CYCLE: Str = "DG103"
export const NESTING_TOO_DEEP: Str = "DG104"
export const EXCERPT_MISSING: Str = "DG105"
export const EXCERPT_INVALID: Str = "DG106"
export const UNKNOWN_ALERT: Str = "DG107"
export const DIRECTIVE_INVALID: Str = "DG108"
export const FRONT_MATTER_INVALID: Str = "DG109"
export const DIRECTIVE_UNCLOSED: Str = "DG110"
export const PATH_INVALID: Str = "DG111"
export const UNSAFE_DESTINATION: Str = "DG121"
export const DESTINATION_ESCAPES: Str = "DG122"
export const LINK_BROKEN: Str = "DG123"
export const XREF_UNRESOLVED: Str = "DG124"
export const FRAGMENT_MISSING: Str = "DG127"
export const IMAGE_MISSING: Str = "DG125"
export const VIDEO_INSECURE: Str = "DG126"
export const TOC_SYNTAX: Str = "DG201"
export const TOC_SHAPE: Str = "DG202"
export const TOC_HEADING_EMPTY: Str = "DG203"
export const TOC_UNSAFE: Str = "DG204"
export const TOC_TOO_DEEP: Str = "DG205"
export const TOC_UNKNOWN_FIELD: Str = "DG206"
export const TOC_NAMELESS: Str = "DG207"
export const TOC_UID_UNKNOWN: Str = "DG210"
export const TOC_TARGET_MISSING: Str = "DG211"
export const TOC_CYCLE: Str = "DG212"
export const UID_DUPLICATE: Str = "DG301"
export const TEMPLATE_INVALID: Str = "DG401"
export const CONFIG_INVALID: Str = "DG501"
export const CONFIG_UNREADABLE: Str = "DG502"
export const CONTENT_UNREADABLE: Str = "DG601"
export const CONTENT_INVALID: Str = "DG602"
export const CONTENT_UNSUPPORTED: Str = "DG603"
export const OVERWRITE_INVALID: Str = "DG701"
export const OUTPUT_INVALID: Str = "DG801"
export const OUTPUT_COLLISION: Str = "DG802"
export const NOTHING_TO_BUILD: Str = "DG901"
export const FILE_UNREADABLE: Str = "DG902"
export const PUBLISH_FAILED: Str = "DG903"
export const XREF_UNAVAILABLE: Str = "DG904"
export const TOOL_FAILED: Str = "DG905"
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Checks]] · [[src/PuduLangDocgen/Build/Overwrite]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Configuration/Fields]] · [[src/PuduLangDocgen/Configuration/Rules]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Publish]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[src/PuduLangDocgen/Docset/Tools]] · [[src/PuduLangDocgen/Docset/Walk]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Leaves]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Markdown/Render]] · [[src/PuduLangDocgen/Navigation]] · [[src/PuduLangDocgen/Navigation/Resolve]] · [[src/PuduLangDocgen/References]] · [[src/PuduLangDocgen/Theme]] · [[test/PuduLangDocgen/BuildTest]] · [[test/PuduLangDocgen/DocsetTest]] · [[test/PuduLangDocgen/InlineTest]] · [[test/PuduLangDocgen/MarkdownTest]] · [[test/PuduLangDocgen/NavigationTest]] · [[test/PuduLangDocgen/ReferencesTest]] · [[test/PuduLangDocgen/ThemeTest]]

## Algorithm

## Negative Logic (Prohibited Paths)

- Do not reuse a retired code for a different meaning.
- Do not write a code literal outside this module.

## Edge Cases

- Codes group by phase in hundreds: 1xx articles and links, 2xx configuration and build, higher hundreds for navigation, reference, template, and tool phases.

## Depth

SHALLOW. A named table.

## Grill Log

- Q: Numbers or names? A: Short `DG` numbers that rules can name. Rejected: long identifiers in configuration.

## Referenced by

[[src/PuduLangDocgen/Constants/_MOC]] · [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Checks]] · [[src/PuduLangDocgen/Build/Overwrite]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Configuration/Fields]] · [[src/PuduLangDocgen/Configuration/Rules]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Publish]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[src/PuduLangDocgen/Docset/Tools]] · [[src/PuduLangDocgen/Docset/Walk]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Leaves]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Markdown/Render]] · [[src/PuduLangDocgen/Navigation]] · [[src/PuduLangDocgen/Navigation/Resolve]] · [[src/PuduLangDocgen/References]] · [[src/PuduLangDocgen/Theme]]
