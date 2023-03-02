# Artifact for the paper *Parallelism in a Region Inference Context* submitted to PLDI 2023

This artifact reproduces Figures 6(a), 6(b) and Tables 1 and 2.

The figures and tables in the paper were computed on an Intel Xeon
Gold 6230 CPU with 20 cores and hyper-threading disabled.  The precise
results you obtain are likely to be somewhat different unless you use
the same hardware.  Hopefully the general trends will remain stable.

Simply running `make` should run all benchmarks and produce files
`fig6a.pdf`, `fig6b.pdf`, `table1.tex`, `table2.tex`, corresponding to
the figures and tables of the paper.  While the tables are formatted
as LaTeX snippets, they should be (relatively) readable as plain text,
although you'll have to get the column headers from the paper.

## System Requirements

The artifact assumes that `mpl`, `mlkit`, and `mlton` are immediately
runnable from the command line and that necessary environment
variables have been set for them to work.  Further, `gnuplot` must be
available.  The provided Docker container has all this set up already.

Constructing the image from `Dockerfile` requires access to the
Internet, but running `make` does not.

## Manifest

This section describes every top-level directory and nontrivial file
and its purpose.

* `benchmarks/`: The benchmark programs.  You may wish to look at these.

* `config.sh`: Configuration of the benchmark scaffolding; most
  importantly listing the benchmarks used.  You can change this if you
  wish or need to.

* `results/`: Contains intermediate results produced by the
  experimental tooling.

* `tools/`: Various SML programs that constitute the experimental
  tooling.  You should not need to look at these.

* `scripts/`: Various shell scripts that constitute the experimental
  tooling.  You should not need to look at these, but they are very
  simple, so you can take a peek if something goes wrong.  They all
  expect to be run from the directory containing the main `Makefile`.

* `Dockerfile`: The file used to build the Docker image.  You should
  use the prebuilt image if possible, but if necessary you can build
  it yourself with the following command:

  ```
  $ docker build . -t mlkit-pldi23-parreg
  ```

  (You might need `sudo`, depending on your system.)

  The `-t mlkit-pldi23-parreg` assigns a tag to the image in your
  local Docker registry.  You can run the built image with:

  ```
  $ docker run -it mlkit-pldi23-parreg:latest
  ```

  (Again, might need `sudo`.)

  Note that the Dockerfile is *not* reproducible, so it may or may not
  result in a working image if you try this in the distant future.

  The image can be saved to a file with:

  ```
  $ docker save mlkit-pldi23-parreg | gzip > mlkit-pldi23-parreg.gz
  ```

  On another machine, the image can then be loaded from the file:

  ```
  $ docker load -i mlkit-pldi23-parreg.tar.gz
  ```

  This file is what we distribute as the "reproducible" artifact.

* `Makefile`: The commands executed when running `make`.  You can
  extract the commands if you need to run them out of order.
