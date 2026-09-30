# Delivery

`main` holds releases; `dev` integrates reviewed features. Bootstrap creates governance first.
Every subsequent feature starts from a ready issue and `feature/<issue>-<slug>` from current `dev`.
Keep reviewable PRs below 600 changed lines; use `Refs #N` for partitions and `Closes #N` only
for the last partition. Independent reviewers cannot author the implementation they approve.
Public APIs require Language Architect review; every partition requires Forensic Guardian parity.

Every pull request runs compilation, formatting, lint, tests, and examples. Mutation testing
with [[tools/Mutate]] runs by hand; its survivors are follow-up work after the first release.

Release only after configuration, articles, metadata, navigation, references, templates, search,
resources, preview, incremental behavior, export, diagnostic, package, and platform
acceptance evidence is complete. Release notes state tested contracts and supported limits.
Private inputs never enter Git, issues, PRs, artifacts, or release descriptions.

## Grill Log

- Q: Can passing tests close a missing capability? A: No; each ledger row needs implementation
  and relevant acceptance tests. Rejected: completeness inferred from a green suite.
- Q: Can an author approve their changes? A: No; independent review records findings and parity.
  Rejected: role switching presented as an independent review.

## Referenced by

[[architecture/_MOC]] · [[handoffs/2026-09-29-docgen]]
