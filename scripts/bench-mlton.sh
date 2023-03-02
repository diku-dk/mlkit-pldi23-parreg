#!/bin/sh
#
# Benchmark sequential MLton.

set -e

. ./config.sh

announce "Measuring MLton baseline"
tools/bench/mlkit-bench -o results/mlton.json -mlton:-mlb-path-var \'MLCOMP mlton\': $benchmarks
