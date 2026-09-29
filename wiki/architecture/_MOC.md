# Architecture

An explicit configuration and input snapshot produce an artifact plan. Parsing, references,
navigation, rendering, search, and output validation are pure. Only `Docset` and `Command` read
files or run tools. All exported modules live under `PuduLangDocgen`.

- [[architecture/LANGUAGE]] — domain and architectural terms.
- [[architecture/DELIVERY]] — issue, branch, independent review, and release gates.
- [[architecture/CAPABILITIES]] — complete requested capabilities and evidence status.
- [[src/PuduLangDocgen]] — shared value contracts.
- [[src/PuduLangDocgen/Paths]] — paths and destinations.

## Grill Log

- Q: Reuse foreign implementation/assets? A: Original algorithms and presentation; reference
  research supplies observable requirements only. Rejected: copied implementation or branding.
- Q: Publish while capability gaps remain? A: No release or production claims before complete
  evidence. Rejected: treating a scaffold or sampled mutation score as full readiness.
- Q: Test rendering only through file writes? A: Expose deterministic artifacts before effects.
  Rejected: hidden writes inside parsing or templating.

## Referenced by

[[00-INDEX]] · [[handoffs/2026-09-29-docgen]]
