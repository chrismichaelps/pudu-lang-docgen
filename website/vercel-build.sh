#!/usr/bin/env bash
# Build step of the Vercel deployment, run from the website folder.
#
# With the whole repository available (a Git deployment whose root directory is `website`), it
# installs the pinned Pudu release after verifying its checksum, installs the package's
# dependencies at the repository root, and builds website/ into website/_site.
#
# With only the website folder uploaded (`vercel deploy` from website/ after a local build),
# the site in _site is already built and is published as it is.
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root="$(dirname "$here")"

if [ ! -f "$root/src/PuduLangDocgen.pudu" ]; then
  if [ -f "$here/_site/index.html" ]; then
    echo "Publishing the prebuilt site in website/_site."
    exit 0
  fi
  echo "Neither the repository sources nor a prebuilt website/_site are available." >&2
  exit 1
fi

PUDU_VERSION="0.1.2"
archive="pudu-${PUDU_VERSION}-linux-amd64.tar.gz"
base="https://github.com/chrismichaelps/pudu-lang/releases/download/v${PUDU_VERSION}"
tools="${TMPDIR:-/tmp}/pudu-toolchain"

if [ ! -x "$tools/pudu-${PUDU_VERSION}-linux-amd64/bin/pudu" ]; then
  mkdir -p "$tools"
  (
    cd "$tools"
    curl -fsSLO "$base/$archive"
    curl -fsSLO "$base/$archive.sha256"
    sha256sum -c "$archive.sha256"
    tar -xzf "$archive"
  )
fi
export PATH="$tools/pudu-${PUDU_VERSION}-linux-amd64/bin:$PATH"

cd "$root"
pudu version
pudu install
pudu run examples/Cli.pudu build website
