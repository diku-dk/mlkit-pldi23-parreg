# mlkit-pldi23-parreg

This is the artifact for the paper *Parallelism in a Region Inference
Context* submitted to PLDI 2023.  It reproduces Figures 6(a), 6(b) and
Tables 1 and 2.  It contains precompiled versions of the required
software (MLKit, MLton, and MPL), as well as various utility scripts.

The figures and tables in the paper were computed on an Intel Xeon
Gold 6230 CPU with 20 cores and hyper-threading disabled.  The precise
results you obtain are likely to be somewhat different unless you use
the same hardware.  Hopefully the general trends will remain stable.

## Manifest

This section describes every top-level directory and its purpose.

* `tools/`: Various SML programs that constitute the experimental
  tooling.

* `benchmarks/`: The benchmark programs.
