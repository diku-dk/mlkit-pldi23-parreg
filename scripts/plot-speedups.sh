#!/bin/sh
#
# Assumes speedups have been computed by compute-speedups.sh

set -e

. ./config.sh

announce "Plotting speedups"

gnuplot -e "set terminal pdf noenhanced; set output 'fig6a.pdf'; data='results/mlkit.speedups'" -d scripts/speedup.gnu
gnuplot -e "set terminal pdf noenhanced; set output 'fig6b.pdf'; data='results/mpl.speedups'" -d scripts/speedup.gnu
