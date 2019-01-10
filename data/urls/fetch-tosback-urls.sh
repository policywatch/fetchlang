#!/usr/bin/env bash

set -euo pipefail

url=https://github.com/tosdr/tosback2/archive/master.zip
output=tosback-urls.txt

tmpdir=$(mktemp -d)
trap "rm -rf $tmpdir" INT TERM EXIT

wget -q -O $tmpdir/master.zip "${url}"
unzip -q -d $tmpdir/ $tmpdir/master.zip

find $tmpdir/tosback2-master/rules/ -iname "*.xml" \
  -exec xmllint {} -xpath "string(//url/@name)" \; \
  -exec echo \; \
  | sed '/^\s*$/d' \
  | sort | uniq \
  > "${output}"
