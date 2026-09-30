---
type: tool
path: "@root/tools/Mutate.pudu"
grammar: "[[grammar/pudu]]"
tags: [tool, testing]
---

# Mutate

> /** @Tools.Mutate.Harness — mutation testing over the source tree */

## Purpose

Measures whether the suites notice small changes to the source: every comparison, boolean
operator, literal flag, off-by-one step, and negation is flipped one at a time, and a change the
suites still pass is a survivor. It runs by hand, not in CI; closing the remaining survivors is
scheduled after the first release.

## Interface

```pudu
fn main() -> Int
```

```bash
pudu run tools/Mutate.pudu --domain --every 8 --offset 0 --threshold 100
```

| Option | Meaning |
| --- | --- |
| `--domain` | Only the pure layer; seams, generated tables, theme text, and constants are left out. |
| `--file <path>` | Only one file. |
| `--every <n>` / `--offset <k>` | Every n-th mutant starting at k, for sharding. |
| `--threshold <n>` | Answer 1 when the score is below n percent. |
| `--dry-run` | List the mutants without running anything. |

`PUDU_BIN` names the compiler; `pudu` by default.

## Algorithm

1. Collect mutants: at each code position outside strings, character literals, and comments,
   try every operator replacement. `<` and `>` only count with spaces on both sides, so type
   brackets are never touched.
2. Apply one mutant, type-check the file, and count a mutant that does not check as invalid.
3. Run the suite named after the file's top module folder first, such as `ApiTest` for
   `Api/Lexer`; a failure kills the mutant at once. Otherwise run every suite.
4. A run past sixty seconds counts as killed. The file is restored after every mutant.
5. Print each survivor, then killed, survived, invalid, and the score.

## Negative Logic (Prohibited Paths)

- Do not count invalid mutants toward the score.
- Do not leave a mutant in place; the original text is written back after each run.
- Do not run it in a working tree with unsaved edits; it rewrites source files while it runs.

## Edge Cases

- Zero scored mutants scores 100.
- Import lines and comment lines are never mutated.

## Grill Log

- Q: Run every suite for every mutant? A: The owning suite first, then all suites only when it
  passes, so survivors are still judged by the whole tree. Rejected: a partial run declaring survival.
- Q: Mutate sort comparators? A: Sorts use keys (`List.sortOn`, `List.sorted`), which leave no
  comparator to flip. Rejected: equivalent mutants that no test can kill.

## Referenced by

[[tools/_MOC]] · [[architecture/DELIVERY]]
