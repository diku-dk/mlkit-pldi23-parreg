#!/bin/sh
#
# Benchmark parallel MPL MLton.

set -e

. ./config.sh

for c in $(seq $cores); do
    announce "Benchmarking MPL with $c threads"
    taskset -c 0-$((c-1)) tools/bench/mlkit-bench -o results/mpl-${c}.json -mpl:-mlb-path-var \'MLCOMP mpl\' -runtime procs -runtime $c: $benchmarks
done


