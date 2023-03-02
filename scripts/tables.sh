#!/bin/sh
#
# Assumes all the result JSONs have been produced already.

set -e

. ./config.sh

MLKIT_BASELINE=results/mlkit-seq.json
MLKIT_RUN_1=results/mlkit-par-1.json
MLKIT_RUN_ALL=results/mlkit-par-${cores}.json
MPL_BASELINE=results/mlton.json
MPL_RUN_1=results/mpl-1.json
MPL_RUN_ALL=results/mpl-${cores}.json

banner "Generating tables"

tools/abstime/mlkit-bench-abstime -json $MLKIT_BASELINE -json $MLKIT_RUN_1 -json $MLKIT_RUN_ALL -json $MPL_BASELINE -json $MPL_RUN_1 -json $MPL_RUN_ALL $benchmarks > table1.tex
tools/mem/mlkit-bench-mem -json $MLKIT_BASELINE,$MLKIT_RUN_1,$MLKIT_RUN_ALL -json $MPL_BASELINE,$MPL_RUN_1,$MPL_RUN_ALL $benchmarks > table2.tex
