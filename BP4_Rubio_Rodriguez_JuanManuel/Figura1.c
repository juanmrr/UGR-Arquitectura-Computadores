#include <time.h>
#include <stdlib.h>
#include <stdio.h>

struct xd {
	int a;
	int b;
} s[5000];

int main (){

	int x1, x2, i, j;
	int R[40000];

	for (i = 0; i < 5000; i++){
		s[i].a = 1;
		s[i].b = 1;
	}

        double ncgt;
	struct timespec cgt1, cgt2;

        clock_gettime(CLOCK_REALTIME, &cgt1);

	for (i = 0; i < 40000; i++){
		x1 = 0;
		x2 = 0;
		for (j = 0; j < 5000; j++)
			x1 += 2*s[j].a + i;
		for (j = 0; j < 5000; j++)
			x2 += 3*s[j].b - i;
		
	if (x1 < x2) 
		R[i] = x1;
	else
		R[i] = x2;
	}

        clock_gettime(CLOCK_REALTIME, &cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double)((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	printf("R[0] = %d R[39999] = %d\n", R[0], R[39999]);
	printf("Tiempo total empleado en el cálculo: %11.9f \n" , ncgt);

}
