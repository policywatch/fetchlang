#!/usr/bin/env bash

set -euo pipefail

cat "$@" \
  | grep '?' \
  | cut -d '?' -f 2 \
  | sort | uniq
