#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

ROOT=$(unset CDPATH && cd $(dirname "${BASH_SOURCE[0]}")/.. && pwd)
cd $ROOT

cat <<EOF > README.md
# Presentations

[![Build Status](https://travis-ci.org/cofyc/presentations.svg?branch=master)](https://travis-ci.org/cofyc/presentations)

## slides

EOF

for f in $(find . -type f -name '*.slide' -printf '%P\n' | sort -n -r); do
    link="https://talks.godoc.org/github.com/cofyc/presentations/""$f"
    printf -- "- [%s](%s)\n" "$f" "$link" >> README.md
done
