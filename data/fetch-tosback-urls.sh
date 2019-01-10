#!/usr/bin/env bash

set -euo pipefail

tmpdir=$(mktemp -d)

trap "rm -rf $tmpdir" INT TERM EXIT

wget -o wget.log -O $tmpdir/master.zip \
  https://github.com/tosdr/tosback2/archive/master.zip

unzip -d $tmpdir/ $tmpdir/master.zip > unzip.log 2>&1

find $tmpdir/tosback2-master/rules/ -iname "*.xml" \
  -exec xmllint {} -xpath "string(//url/@name)" \; \
  -exec echo \; \
  > tosback-urls.txt
