#!/bin/sh
#
# Benchmark sequential MLkit.

set -e

. ./config.sh

announce "Measuring MLKit baseline"
tools/bench/mlkit-bench -o results/mlkit-seq.json -mlkit:MLCOMP=mlkit-seq -no_gc: $benchmarks
