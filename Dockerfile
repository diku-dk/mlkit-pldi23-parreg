FROM debian:bullseye-slim
LABEL description="Artifact for the paper *Parallelism in a Region Inference Context* submitted to PLDI 2023"

# Install tools
RUN apt-get update
RUN apt-get install -y sudo make gcc libgmp-dev gnuplot-nox time automake patch git

# Clean up image.
RUN apt-get clean autoclean
RUN apt-get autoremove --yes
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/

# Set up user
RUN adduser --gecos '' --disabled-password bench
RUN echo "bench ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers
USER bench
WORKDIR /home/bench/

# Install MLton
ADD --chown=bench https://github.com/MLton/mlton/releases/download/on-20210117-release/mlton-20210117-1.amd64-linux-glibc2.31.tgz ./
RUN tar xf mlton-20210117-1.amd64-linux-glibc2.31.tgz
RUN make -C mlton-20210117-1.amd64-linux-glibc2.31 install PREFIX=/home/bench/mlton
ENV PATH=/home/bench/mlton/bin:$PATH
RUN rm -rf mlton-20210117-1.amd64-linux-glibc2.31*

# Install MPL
ADD --chown=bench https://github.com/MPLLang/mpl/archive/refs/tags/v0.3.tar.gz ./
RUN tar xf v0.3.tar.gz
RUN make -C mpl-0.3
RUN make -C mpl-0.3 install PREFIX=/home/bench/mpl
RUN rm -rf v0.3.tar.gz mpl-0.3
ENV PATH=/home/bench/mpl/bin:$PATH

# Download MLKit source for reference
ADD --chown=bench https://github.com/melsman/mlkit/archive/refs/tags/v4.7.3.tar.gz ./

# Install MLKit
ADD --chown=bench https://github.com/melsman/mlkit/releases/download/v4.7.3/mlkit-bin-dist-linux.tgz ./
RUN tar xf mlkit-bin-dist-linux.tgz
RUN make -C mlkit-bin-dist-linux install PREFIX=/home/bench/mlkit
RUN rm -rf mlkit-bin-dist-linux.tgz mlkit-bin-dist-linux
ENV PATH=/home/bench/mlkit/bin:$PATH
ENV SML_LIB=/home/bench/mlkit/lib/mlkit

# Copy artifact files into image.
RUN mkdir mlkit-pldi23-parreg
COPY --chown=bench ./ mlkit-pldi23-parreg/

WORKDIR /home/bench/mlkit-pldi23-parreg
CMD bash
