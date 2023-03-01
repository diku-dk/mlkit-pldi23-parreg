# Artifact for the paper *Parallelism in a Region Inference Context* submitted to PLDI 2023

This artifact reproduces Figures 6(a), 6(b) and Tables 1 and 2.

The figures and tables in the paper were computed on an Intel Xeon
Gold 6230 CPU with 20 cores and hyper-threading disabled.  The precise
results you obtain are likely to be somewhat different unless you use
the same hardware.  Hopefully the general trends will remain stable.

Simply running `make` should run all benchmarks and produce files
TODO, corresponding to the figures and tables of the paper.

## System Requirements

The artifact assumes that `mpl`, `mlkit`, and `mlton` are immediately
runnable from the command line and that necessary environment
variables have been set for them to work.  Further, `gnuplot` must be
available.  The provided Docker container sets all this up for you.

## Manifest

This section describes every top-level directory and nontrivial file
and its purpose.

* `benchmarks/`: The benchmark programs.  You may wish to look at these.

* `config.sh`: Configuration of the benchmark scaffolding; most
  importantly listing the benchmarks used.  You can change this if you
  wish or need to.

* `tools/`: Various SML programs that constitute the experimental
  tooling.  You should not need to look at these.

* `Dockerfile`: The file used to build the Docker image.  You should
  use the prebuilt image if possible, but if necessary you can build
  it yourself with the following command:

  ```
  $ docker build . -t mlkit-pldi23-parreg
  ```

  (You might need `sudo`, depending on your system.)

  You can then run the built image with:

  ```
  $ docker run -it mlkit-pldi23-parreg:latest bash
  ```

  (Again, might need `sudo`.)

  Note that the Dockerfile is *not* reproducible, so it may or may not
  result in a working image if you try this in the distant future.
