#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main (int argc, char **argv){

  int i, n, chunk, a[n], suma = 0;

  if(argc < 3) {
    fprintf(stderr, "\nFalta iteraciones y/o tchunk \n");
    exit(-1);
  }
  n = atoi(argv[1]);

  if (n > 200) n = 200;

  chunk = atoi(argv[2]);

  for (i = 0; i < n; i++)
    a[i] = i;

  #pragma omp parallel for firstprivate(suma) lastprivate(suma) schedule(dynamic, chunk)

  for (i = 0; i < n; i++){
    suma = suma + a[i];

    if (omp_get_thread_num() == 0){

    	printf("Dentro de parallel for \n");

  	printf("Número de threads=%d, Número de procesadores=%d, ¿Dentro de la region paralela? =%d \n", omp_get_num_threads(), omp_get_num_procs(), omp_in_parallel());

    }
  }

  printf("Fuera de 'parallel for' \n");

  printf("Número de threads=%d, Número de procesadores=%d, ¿Dentro de la region paralela? =%d \n", omp_get_num_threads(), omp_get_num_procs(), omp_in_parallel());

}
