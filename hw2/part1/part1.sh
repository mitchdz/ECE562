
PROG="build/ARM/gem5.opt"

declare -a arr=("a2time01" "cacheb01" "bitmnp01" "mcf" "libquantum")

for i in "${arr[@]}"
do
	${PROG} \
		--stats-file=OoO_${i}_stats.txt \
		--dump-config=OoO_${i}_config.ini \
		configs/example/se.py \
		--caches \
		--l1i_size=32kB \
		--l1i_assoc=4 \
		--l1d_size=32kB --l1d_assoc=4 --cacheline_size=64 --l2cache \
		--l2_size=1MB --l2_assoc=8 --cpu-clock=1.6GHz \
		--cpu-type=ex5_big -n 1 --maxinsts=100000000 --bench ${i}

	${PROG} \
		--stats-file=IoO_${i}_stats.txt \
		--dump-config=IoO_${i}_config.ini \
		configs/example/se.py \
		--caches \
		--l1i_size=32kB \
		--l1i_assoc=4 \
		--l1d_size=32kB --l1d_assoc=4 --cacheline_size=64 --l2cache \
		--l2_size=1MB --l2_assoc=8 --cpu-clock=1.6GHz \
		--cpu-type=ex5_LITTLE -n 1 --maxinsts=100000000 --bench ${i}

done
