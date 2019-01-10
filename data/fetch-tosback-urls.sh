#!/usr/bin/env bash

set -euo pipefail

rm -f master.zip

wget -o wget.log -O master.zip \
  https://github.com/tosdr/tosback2/archive/master.zip

trap "rm -f master.zip" INT TERM EXIT

rm -rf master

unzip -d master master.zip 2>&1 > unzip.log

trap "rm -rf master" INT TERM EXIT

find master/tosback2-master/rules/ -iname "*.xml" \
  -exec xmllint {} -xpath "string(//url/@name)" \; \
  -exec echo \; \
  > tosback-urls.txt
