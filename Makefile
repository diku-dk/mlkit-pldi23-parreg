all:
	make -C tools
	scripts/bench-mlkit-seq.sh
	scripts/bench-mlkit-par.sh
	scripts/bench-mlton.sh
	scripts/bench-mpl.sh
	scripts/compute-speedups.sh
	scripts/plot-speedups.sh
	scripts/tables.sh
