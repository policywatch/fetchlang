#!/usr/bin/env bash

set -euo pipefail

cat "$@" \
  | sed 's/^https\?:\/\///' \
  | cut -d '/' -f 2- \
  | cut -d '?' -f 1 \
  | sort | uniq
