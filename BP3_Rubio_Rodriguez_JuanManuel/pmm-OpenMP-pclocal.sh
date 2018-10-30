#!/bin/bash



for((M = 1; M < 5; M=M+1))
do
	export OMP_NUM_THREADS=$M
	echo "Número de threads = $M"
	for((N = 100; N <= 700; N=N+300))
	do
		./pmm-OpenMP $N >> pmm-OpenMP-pclocal
	done
done
