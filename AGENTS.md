# Package operating contract

The vault at `wiki/` governs every change. Read `wiki/00-INDEX.md`, the active handoff,
`wiki/grammar/pudu.md`, and every owned module mirror before acting. A complete mirror with
purpose, concrete signatures, algorithm, prohibited paths, edge cases, depth, and resolved
Grill Log exists before implementation. Keep code and vault synchronized.

`fmcf.md`, `lang_proposal.md`, and `goal.md` are private, ignored inputs; never stage, quote,
or expose them. Public specifications contain distilled decisions only.

Use ready issues and `feature/<issue>-<slug>` branches from `dev`. Public API changes require
an independent Language Architect review. Every PR requires independent implementation and
Forensic Guardian parity review. Authors cannot be their sole reviewers. Independent agents
may review and implement bounded assignments with disjoint file ownership; preserve others' work.
Keep PRs below 600 changed lines except isolated generated data and the governance bootstrap.
Keep source below 500 lines, document public contracts, and keep comments neutral.

Run compilation, formatting, lint, success/failure/regression/output tests, and selected
mutation tests before integration. Publish releases through a reviewed release PR from `dev`
to `main`, only after every required capability and gate is verified. No unverified readiness claims.
Follow `CONTRIBUTING.md`. Record role transitions and one exact next action in the handoff.
