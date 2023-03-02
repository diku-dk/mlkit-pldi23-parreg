#!/bin/sh
#
# Benchmark parallel MLkit.

set -e

. ./config.sh

for c in $(seq $cores); do
    announce "Benchmarking MLKit with $c threads."
    restrict() {
        taskset -c 0-$((c-1)) "$@"
    }
    restrict tools/bench/mlkit-bench -o results/mlkit-par-${c}.json -mlkit:MLCOMP=mlkit-par -no_gc -par: $benchmarks
done
