all:
	make -C tools
	scripts/bench-mlkit-seq.sh
	scripts/bench-mlkit-par.sh
