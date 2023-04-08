.PHONY: all
all:
	make -C tools
	scripts/bench-mlkit-seq.sh
	scripts/bench-mlkit-par.sh
	scripts/bench-mlton.sh
	scripts/bench-mpl.sh
	scripts/compute-speedups.sh
	scripts/plot-speedups.sh
	scripts/tables.sh

mlkit-pldi23-parreg.tar.gz: Dockerfile
	sudo docker build . -t mlkit-pldi23-parreg
	sudo docker save mlkit-pldi23-parreg:latest | gzip > $@

.PHONY: clean
clean:
	rm -rf *~ mlkit-pldi23-parreg.tar.gz
	make -C tools clean
