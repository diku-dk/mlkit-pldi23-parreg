FROM debian:latest

# Install tools
RUN apt-get update
RUN apt-get install -y sudo git curl make gcc libgmp-dev gnuplot

# Set up user
RUN adduser --gecos '' --disabled-password bench
RUN echo "bench ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers
USER bench
WORKDIR /home/bench/

# Install MLton
RUN curl -L --remote-name https://github.com/MLton/mlton/releases/download/on-20210117-release/mlton-20210117-1.amd64-linux-glibc2.31.tgz
RUN tar xf mlton-20210117-1.amd64-linux-glibc2.31.tgz
RUN make -C mlton-20210117-1.amd64-linux-glibc2.31 install PREFIX=/home/bench/mlton
ENV PATH=/home/bench/mlton/bin:$PATH
RUN rm -rf mlton-20210117-1.amd64-linux-glibc2.31*

# Install MLKit
RUN curl -L --remote-name https://github.com/melsman/mlkit/releases/download/v4.7.2/mlkit-bin-dist-linux.tgz
RUN tar xf mlkit-bin-dist-linux.tgz
RUN make -C mlkit-bin-dist-linux install PREFIX=/home/bench/mlkit
RUN rm -rf mlkit-bin-dist-linux*
ENV PATH=/home/bench/mlkit/bin:$PATH
ENV SML_LIB=/home/bench/mlkit/lib/mlkit

# Install MPL - note that MPL conflicts with MLton so we put it in /opt
RUN curl -L --remote-name https://github.com/MPLLang/mpl/archive/refs/tags/v0.3.tar.gz
RUN tar xf v0.3.tar.gz
RUN make -C mpl-0.3
RUN make -C mpl-0.3 install PREFIX=/home/bench/mpl
RUN rm -rf v0.3.tar.gz mpl-0.3
ENV PATH=/home/bench/mpl/bin:$PATH

# Prepare artifact
RUN git clone https://github.com/diku-dk/mlkit-pldi23-parreg.git
WORKDIR /home/bench/mlkit-pldi23-parreg
