# This script is sourced by other scripts and configures various
# things.  You can edit it if necessary.

# This is also the order in which the benchmarks are shown on the
# speedup plot.
benchmarks="benchmarks/sobol/soboloption.mlb \
 benchmarks/fib/fib.mlb \
 benchmarks/mandelbrot/mandelbrot.mlb \
 benchmarks/primes/primes.mlb
 benchmarks/soac/filter.mlb \
 benchmarks/ray/ray.mlb \
 benchmarks/soac/scan.mlb \
 benchmarks/ray-orig/ray-orig.mlb \
 benchmarks/nqueens/nqueens.mlb \
 benchmarks/vpmsort/vpmsort.mlb \
 benchmarks/pmsort/pmsort.mlb \
"

# Compute speedup from 1 up to this number of cores.
cores=20

export BOLD=$(printf '\e[1m')
export NC=$(printf '\e[0m')

announce() {
    echo
    echo
    echo "${BOLD}# ${1}${NC}"
}
