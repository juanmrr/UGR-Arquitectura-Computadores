#!/bin/bash



for((M = 1; M < 13; M=M+1))
do
	export OMP_NUM_THREADS=$M
	for((N = 10000; N < 30001; N=N*3))
	do
		./pmv-OpenMP-b $N
	done
done
