#!/bin/sh
#
# Compute speedups.  Assumes all the result JSONs have been produced
# already.

set -e

. ./config.sh

announce "Computing speedups"

json_args() {
    for c in $(seq $cores); do
        echo "-$c" results/mlkit-par-${c}.json
    done
}

tools/speedup/mlkit-bench-speedup -baseline results/mlkit-seq.json $(json_args) $benchmarks > results/mlkit.speedups

json_args() {
    for c in $(seq $cores); do
        echo "-$c" results/mpl-${c}.json
    done
}

tools/speedup/mlkit-bench-speedup -baseline results/mlton.json $(json_args) $benchmarks > results/mpl.speedups
