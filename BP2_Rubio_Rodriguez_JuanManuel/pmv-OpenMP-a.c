#include <stdlib.h>
#include <stdio.h>
#ifdef _OPENMP
        #include <omp.h>
#else
        #define omp_get_thread_num() 0
        #define omp_get_num_threads() 1
#endif

int main(int argc, char** argv)
{
        int i, j;
        double t1, t2, total;

if (argc<2){
                printf("Falta tamaño de matriz y vector\n");
                exit(-1);
        }

        unsigned int N = atoi(argv[1]);

	//Reservo memoria para los vectores y la matriz

        double *v1, *v3, **M;
        v1 = (double*) malloc(N*sizeof(double));
        v3 = (double*) malloc(N*sizeof(double));
        M = (double**) malloc(N*sizeof(double *));

        for (i=0; i<N; i++){
                M[i] = (double*) malloc(N*sizeof(double));
        }
       
	#pragma omp parallel
	{

        //Inicializo matriz y vectores
	#pragma omp for private (j)
        for (i=0; i<N;i++)
        {
                v1[i] = i;
                v3[i] = 0;
                for(j=0;j<N;j++)
                        M[i][j] = i+j;
        }

        //Medida de tiempo
	#pragma omp single
        t1 = omp_get_wtime();

	#pragma omp for private (j)

        //Calculo el producto de la matriz por el vector v1
        for (i=0; i<N;i++)
                for(j=0;j<N;j++)
                               v3[i] += M[i][j] * v1[j];
		
        //Medida de tiempo
	#pragma omp single
        t2 = omp_get_wtime();

	}

        total = t2 - t1;

        //Imprimir el resultado y el tiempo de ejecución
        printf("Tiempo(seg.):%11.9f\t / Tamaño:%u\t/ v3[0]=%8.6f v3[%d]=%8.6f\n", total,N,v3[0],N-1,v3[N-1]);

        if (N<20)
                for (i=0; i<N;i++)
                        printf(" v3[%d]=%5.2f\n", i, v3[i]);

	//Libero memoria

        free(v1);
        free(v3);
        for (i=0; i<N; i++)
                free(M[i]);
        free(M);

        return 0;
}
