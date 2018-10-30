#include <stdlib.h>
#include <stdio.h>
#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
	#define omp_get_num_threads() 1
#endif

#define MAX 1000 //variable global para el tamaño del vector

int main(int argc, char** argv)
{
	int i, j;
	double t1, t2, total;

	if (argc<2){
		printf("Falta tamaño de matriz y vector\n");
		exit(-1);
	}

	unsigned int N = atoi(argv[1]);


	if (N>MAX) N=MAX;

	double v1[MAX], v3[MAX], M[MAX][MAX];

	//Inicializo la matriz y los vectores
	for (i=0; i<N;i++)
	{
		v1[i] = i;
		v3[i] = 0;
		for(j=0;j<N;j++)
			M[i][j] = i+j;
	}


	//Medida de tiempo
	t1 = omp_get_wtime();

	//Calculo el producto de la matriz por el vector v1
	for (i=0; i<N;i++)
		for(j=0;j<N;j++)
			v3[i] += M[i][j] * v1[j];


	//Medida de tiempo
	t2 = omp_get_wtime();
	total = t2 - t1;

	//Imprimir el resultado y el tiempo de ejecución
	printf("Tiempo(seg.):%11.9f\t / Tamaño:%u\t/ V2[0]=%8.6f V2[%d]=%8.6f\n", total,N,v2[0],N-1,v2[N-1]);

	return 0;
}
