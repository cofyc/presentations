#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

ROOT=$(unset CDPATH && cd $(dirname "${BASH_SOURCE[0]}")/.. && pwd)
cd $ROOT

tmpfile=$(mktemp)
trap "test -f $tmpfile && rm $tmpfile" EXIT
mv README.md $tmpfile
hack/update-docs.sh

function diff_file() {
    local current=$1
    local expected=$2
    echo -n "Checking $current "
    local diff=$(diff -u $current $expected 2>&1) || true
    if [[ -n "${diff}" ]]; then
        echo "failed, diff: "
        echo "$diff"
        exit 1
    else
        echo "passed."
    fi
}

diff_file README.md $tmpfile
