---
type: module
path: "@root/src/PuduLangDocgen/Api/Lexer.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Api.Lexer

> /** @Docgen.Api.Lexer — Pudu source reduced to tokens and documentation comments */

## Purpose

Turns Pudu source into the few token kinds the declaration reader needs: words, symbols,
literals, and documentation comments. Ordinary comments and white space vanish.

## Interface

### Signatures

```pudu
export type Token = { kind: TokenKind, text: Str, line: Int }
export type TokenKind = Word | Symbol | Literal | LineDoc | BlockDoc
export fn tokens(source: Str) -> Array[Token]
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[src/PuduLangDocgen/Api/Parser]] · [[src/PuduLangDocgen/Api/Signature]] · [[test/PuduLangDocgen/ApiLexerTest]] · [[test/PuduLangDocgen/ApiTest]]

## Algorithm

- `tokens` — Tokens of a source file; ordinary comments and white space are dropped.

## Negative Logic (Prohibited Paths)

- Do not attach a `//` comment to a declaration; only `///` and `/** */` document.
- Do not fail on unknown characters; they become one-character symbols.

## Edge Cases

- String literals with escaped quotes stay one token.
- An unterminated block comment ends at the end of the file.
- Line numbers count from one and survive multi-line tokens.

## Depth

MODERATE. A small scanner kept apart so the parser works on tokens, not characters.

## Grill Log

- Q: Use the compiler's parser? A: A reader of declarations only; bodies are skipped, so broken function bodies still document. Rejected: a dependency on the full language front end.

## Referenced by

[[src/PuduLangDocgen/Api/_MOC]] · [[src/PuduLangDocgen/Api/Parser]] · [[src/PuduLangDocgen/Api/Signature]]
