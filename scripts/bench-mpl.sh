#!/bin/sh
#
# Benchmark parallel MPL MLton.

set -e

source ./config.sh
for c in $(seq $cores); do
    echo "Benchmarking $c cores."
    restrict() {
        taskset -c 0-$((c-1)) "$@"
    }
    restrict tools/bench/mlkit-bench -o results/mlton.json -mpl:-mlb-path-var \'MLCOMP mpl\' -runtime procs -runtime $c: $benchmarks
done


