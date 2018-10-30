#!/bin/bash



for((M = 1; M < 13; M=M*2))
do
	export OMP_NUM_THREADS=$M
	echo "Numero de threads = $M"
	for((N = 100; N <= 700; N=N+300))
	do
		./pmm-OpenMP $N
	done
done

	export OMP_NUM_THREADS=12
	echo "Numero de threads = 12"
	for((N = 100; N <= 700; N=N+300))
	do
		./pmm-OpenMP $N
	done
