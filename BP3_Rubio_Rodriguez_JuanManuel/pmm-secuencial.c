#include <stdlib.h>
#include <stdio.h>
#ifdef _OPENMP
        #include <omp.h>
#else
        #define omp_get_thread_num() 0
        #define omp_get_num_threads() 1
#endifz

int main(int argc, char** argv)
{
        int i, j, k;
        double t1, t2, total;

if (argc<2){
                printf("Falta tamaño de matriz y vector\n");
                exit(-1);
        }

        unsigned int N = atoi(argv[1]);

	//Reservo memoria para los vectores y la matriz

        double **M1, **M2, **M3;
        M1 = (double**) malloc(N*sizeof(double *));
        M2 = (double**) malloc(N*sizeof(double *));
        M3 = (double**) malloc(N*sizeof(double *));

        for (i=0; i<N; i++){
                M1[i] = (double*) malloc(N*sizeof(double));
                M2[i] = (double*) malloc(N*sizeof(double));
                M3[i] = (double*) malloc(N*sizeof(double));
        }
       
        //Inicializo matriz y vectores
        for (i=0; i<N; i++)
                for(j=0; j<N; j++){
                       		M1[i][j] = i;
                       		M2[i][j] = i;
                       		M3[i][j] = 0;
		}

        //Medida de tiempo
        t1 = omp_get_wtime();

        //Calculo el producto de la matriz por el vector v1
        for (i=0; i<N;i++)
                for (j=0;j<N; j++)
			for (k=0; k<N; k++)
                		M3[i][j] += M1[i][k] * M2[k][j];

        //Medida de tiempo
        t2 = omp_get_wtime();
        total = t2 - t1;

        //Imprimir el resultado y el tiempo de ejecución
        printf("\nTiempo(seg.):%11.9f\t / Tamaño:%u\t/ v3[0]=%8.6f v3[%d]=%8.6f\n", total,N,M3[0][0],N-1,M3[N-1][N-1]);

        if (N<5)
                for (i=0; i<N; i++)
			for (j=0; j<N; j++)
                       		printf(" M3[%d][%d]=%5.2f\n", i, j, M3[i][j]);

	//Libero memoria

        for (i=0; i<N; i++){
               free(M1[i]);
               free(M2[i]);
               free(M3[i]);
	}	

        free(M1);
        free(M2);
        free(M3);

        return 0;
}
