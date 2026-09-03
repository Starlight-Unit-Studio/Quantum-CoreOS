#!/bin/sh
set -eu

required_files='LICENSE.de.md LICENSE.md LICENSE_HISTORY.md NOTICE.md COPYRIGHT.md TRADEMARKS.md THIRD_PARTY_NOTICES.md docs/LICENSE-FAMILY.md'

for file in $required_files; do
  if [ ! -s "$file" ]; then
    echo "Required legal file is missing or empty: $file" >&2
    exit 1
  fi
done

grep -Fq 'Quantum CoreOS Community Source Lizenz 1.0' LICENSE.de.md
grep -Fq 'Quantum CoreOS Community Source License 1.0' LICENSE.md
grep -Fq 'Source-Available-Lizenz' LICENSE.de.md
grep -Fq 'not an Open Source Initiative approved open-source license' LICENSE.md
grep -Fq 'Erlaubter Dienstbetrieb' LICENSE.de.md
grep -Fq 'Permitted Service Operation' LICENSE.md
grep -Fq 'Quantum-UNIX' NOTICE.md
grep -Fq 'THIRD_PARTY_NOTICES.md' LICENSE.de.md
grep -Fq 'THIRD_PARTY_NOTICES.md' LICENSE.md

echo 'Quantum CoreOS legal-file verification passed.'
