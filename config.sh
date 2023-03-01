# This script is sourced by other scripts and configures various
# things.  You can edit it if necessary.

benchmarks="benchmarks/sobol/soboloption.mlb \
 benchmarks/mandelbrot/mandelbrot.mlb \
 benchmarks/primes/primes.mlb
 benchmarks/soac/scan.mlb \
 benchmarks/soac/filter.mlb \
 benchmarks/fib/fib.mlb \
 benchmarks/vpmsort/vpmsort.mlb \
 benchmarks/pmsort/pmsort.mlb \
 benchmarks/ray/ray.mlb \
 benchmarks/ray-orig/ray-orig.mlb \
 benchmarks/nqueens/nqueens.mlb"

# Compute speedup from 1 up to this number of cores.
cores=4

benchmarks=benchmarks/vpmsort/vpmsort.mlb
