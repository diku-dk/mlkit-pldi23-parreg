#!/bin/sh
#
# Benchmark sequential MLton.

set -e

source ./config.sh

tools/bench/mlkit-bench -o results/mlton.json -mlton:-mlb-path-var \'MLCOMP mlton\': $benchmarks
