#!/bin/sh
# Build bench-c3 and write its results to stdout. Build output goes to stderr.
# Arguments are passed to bench-c3, e.g. ./bench-c3.sh --maxl=20 --maxs=32 rapidhashC3
set -e
cd "$(dirname "$0")"
make bench-c3 >&2
exec ./bench-c3 "$@"
