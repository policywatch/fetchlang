#!/usr/bin/env bash

set -euo pipefail

cat "$@" \
  | cut -d ':' -f 1 \
  | sort | uniq
