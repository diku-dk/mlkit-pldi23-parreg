# No binary release of MPL is available, so we have to compile it
# ourselves, with MLton.  This also requires GMP.

MLTON=compilers/mlton-20210117-1.amd64-linux-glibc2.31/bin/mlton
MPL=compilers/mpl-0.3/build/bin/mpl
MLKIT=compilers/mlkit-bin-dist-linux/mlkit

all: artifact

# Run this target to prepare the artifact for submission.  This
# downloads and precompiles the compilers.
artifact: compilers/mlkit-bin-dist-linux compilers/mpl-0.3 compilers/mlton-20210117-1.amd64-linux-glibc2.31

compilers/mlkit-bin-dist-linux: tarballs/mlkit-bin-dist-linux.tgz
	cd compilers && tar -xf ../$<

compilers/mpl-0.3: tarballs/mpl-v0.3.tgz
	cd compilers && tar -xf ../$<

compilers/mlton-20210117-1.amd64-linux-glibc2.31: tarballs/mlton-20210117-1.amd64-linux-glibc2.31.tgz
	cd compilers && tar -xf ../$<

tarballs/mlkit-bin-dist-linux.tgz:
	curl -L --create-dirs https://github.com/melsman/mlkit/releases/download/v4.7.2/mlkit-bin-dist-linux.tgz --output $@

tarballs/mlton-20210117-1.amd64-linux-glibc2.31.tgz:
	mkdir -p tarballs
	curl -L --create-dirs https://github.com/MLton/mlton/releases/download/on-20210117-release/mlton-20210117-1.amd64-linux-glibc2.31.tgz --output $@

tarballs/mpl-v0.3.tgz:
	curl -L --create-dirs https://github.com/MPLLang/mpl/archive/refs/tags/v0.3.tar.gz --output $@

clean:
	rm -rf compilers tarballs
