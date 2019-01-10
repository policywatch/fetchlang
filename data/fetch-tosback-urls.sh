#!/usr/bin/env bash

set -euo pipefail

url=https://github.com/tosdr/tosback2/archive/master.zip

tmpdir=$(mktemp -d)
trap "rm -rf $tmpdir" INT TERM EXIT

wget -O $tmpdir/master.zip "${url}"
unzip -d $tmpdir/ $tmpdir/master.zip

find $tmpdir/tosback2-master/rules/ -iname "*.xml" \
  -exec xmllint {} -xpath "string(//url/@name)" \; \
  -exec echo \; \
  > tosback-urls.txt
