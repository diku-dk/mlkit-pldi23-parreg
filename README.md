# Artifact for the paper *Parallelism in a Region Inference Context* submitted to PLDI 2023

## Getting Started

The artifact comprises a Docker image
`mlkit-pldi23-parreg.tar.gz`.  Depending on your system,
`docker` commands might or might not need to be prefixed with
`sudo`.  In the following we will leave off `sudo`, but you may
have to add it yourself.

You can load the Docker image into Docker with:

```
$ docker load -i mlkit-pldi23-parreg.tar.gz
```

You can then run the image with:

```
$ docker run -it mlkit-pldi23-parreg:latest
```

This will put you into a shell inside a directory containing
our experimental infrastructure.  Run `make` to begin
benchmarking.  If it stays running for a few minutes, then
everything likely works.  **Caveat:** some of the benchmarks
require almost 16GiB of memory, and the above does not test
that this is available to Docker.

## Step by Step Instructions

This artifact reproduces Figures 6(a), 6(b) and Tables 1 and 2.

The figures and tables in the paper were computed on an Intel
Xeon Gold 6230 CPU with 20 cores and hyper-threading disabled.
The precise results you obtain are likely to be somewhat
different unless you use the same hardware.  Hopefully the
general trends will remain stable.

**Caveat:** the approach we use for disabling cores when doing
speedup measurements is not NUMA-aware, so your results on
machines with a complicated NUMA topology (e.g. multiple
sockets) may look strange.  This affects both MLKit and MPL.

Simply running `make` should run all benchmarks and produce files
`fig6a.pdf`, `fig6b.pdf`, `table1.tex`, `table2.tex`, corresponding to
the figures and tables of the paper.  While the tables are formatted
as LaTeX snippets, they should be (relatively) readable as plain text,
although you'll have to get the column headers from the paper.

It takes about five hours to run all benchmarks, depending on machine
speed.  You can lower the number of cores in `config.sh` to speed up
the process.  Such a modification is particularly useful if your
machine has fewer than 20 cores anyway.

The Docker image also contains a tarball `/home/bench/v4.7.3.tar.gz`
that contains the MLKit 4.7.3 source code for reference.

### System Requirements

The experimental infrastructure assumes that `mpl`, `mlkit`,
and `mlton` are immediately runnable from the command line and
that necessary environment variables have been set for them to
work.  Further, `gnuplot` must be available.  The provided Docker
image has all this set up already.

You must have 16GiB of memory to run the benchmarks.  We have noticed
that Docker on macOS may have a lower default limit than this.

### Docker Image

For space reasons, the Docker image is sparse and does not have
e.g. text editors installed.  The user account has passwordless `sudo`
so you can install more things if you want.  Otherwise you can use
commands such as `docker cp` to move data out of the image for
inspection on the host system.  Consult your favourite search engine
for information on how to use Docker if you are unfamiliar.

## Adding a new benchmark

This artifact is not intended as an extensible benchmarking framework,
but it is not too onerous to add new benchmarks.

A benchmark is presented by an
[.mlb](http://mlton.org/MLBasisExamples) file that describes the
source files of the benchmark.  Our convention is further that each
benchmark is stored in a subfolder in `benchmarks/`.  The list of
benchmarks being used is listed in [config.sh](config.sh), and you
need to modify this file when you add or remove a benchmark.

A benchmark program must invoke the function `Timing.run` when
starting.  This function provides the necessary command line options
and performs timing.

The easiest way to add a new benchmark is to copy
[benchmarks/fib](benchmarks/fib), give it a new name, add it to
`config.sh`, and then modify its implementation.  Benchmarks are
responsible for doing their own validation through the `Timing.run`
function.  The timing methodology employed is somewhat crude, so to
avoid too much noise, adjust the default workload so the benchmark
takes at least a second to run on a single core.

## Manifest

This section describes every top-level directory and nontrivial file
and its purpose.

* `benchmarks/`: The benchmark programs.  You may wish to look at these.

* `config.sh`: Configuration of the benchmark scaffolding; most
  importantly listing the benchmarks used.  You can change this if
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
  it yourself with `make mlkit-pldi23-parreg.tar.gz` (uses `sudo`).

  Note that the Dockerfile is *not* reproducible, so it may or may
  result in a working image if you try this in the distant future.

* `Makefile`: The commands executed when running `make`.  You can
  extract the commands if you need to run them out of order.
