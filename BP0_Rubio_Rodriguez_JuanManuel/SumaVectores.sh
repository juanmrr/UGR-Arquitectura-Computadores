#!/bin/bash
#Se asigna al trabajo el nombre SumaVectores_vdinamicas
#PBS -N SumaVectoresC_vdinamicas
#Se asigna al trabajo la cola ac
#PBS -q ac
#Se imprime información del trabajo usando variables de entorno de PBS

#echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
#echo "Id. del trabajo: $PBS_JOBID"
#echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
#echo "Nodo que ejecuta qsub: $PBS_O_HOST"
#echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
#echo "Cola: $PBS_QUEUE"
#echo "Nodos asignados al trabajo:"
#cat $PBS_NODEFILE


	echo export OMP_NUM_THREADS=1
	echo $OMP_NUM_THREADS

	for((N = 10000; N < 30001; N=N*3))
	do
		./pmv-OpenMP-reduction $N
	done
