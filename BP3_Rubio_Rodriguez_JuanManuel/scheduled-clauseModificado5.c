#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main (int argc, char **argv){

  omp_sched_t kind;
  int i, n, chunk, a[n], suma = 0, chunk_value;

  if(argc < 3) {
    fprintf(stderr, "\nFalta iteraciones y/o tchunk \n");
    exit(-1);
  }
  n = atoi(argv[1]);

  if (n > 200) n = 200;

  chunk = atoi(argv[2]);

  printf("Antes de modificar: \n");

  printf("Variable dyn-var=%d, variable nthreads-var=%d, variable thread-limit-var=%d y variable run-sched-var=%d - chunk=%d \n", omp_get_dynamic(), omp_get_max_threads(), omp_get_thread_limit(), kind, chunk_value);

  //Modificamos los valores pertinentes

  omp_set_dynamic(2);
  omp_set_num_threads(16);
  omp_set_schedule(2, 1);

  for (i = 0; i < n; i++)
    a[i] = i;

  #pragma omp parallel for firstprivate(suma) lastprivate(suma) schedule(dynamic, chunk)

  for (i = 0; i < n; i++){
    suma = suma + a[i];

    if (omp_get_thread_num() == 0){

	omp_get_schedule(&kind, &chunk_value);
    }
  }

  printf("Después de modificar: \n");

  printf("Variable dyn-var=%d, variable nthreads-var=%d, variable thread-limit-var=%d y variable run-sched-var=%d - chunk=%d \n", omp_get_dynamic(), omp_get_max_threads(), omp_get_thread_limit(), kind, chunk_value);

}
