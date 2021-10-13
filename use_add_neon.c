#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <time.h>
#define NR 300000003
typedef unsigned int uint32_t;
typedef unsigned long long u64;
extern uint32_t add_neon(uint32_t size, uint32_t *a, uint32_t *b, uint32_t *c);
extern uint32_t add_byte(uint32_t size, uint32_t *a, uint32_t *b, uint32_t *c);

int main()
{
	time_t time_1;
	srand(time(NULL));
	uint32_t *a_1 = (uint32_t *)malloc((NR+ 3) * sizeof(uint32_t));
	uint32_t *b_1 = (uint32_t *)malloc((NR + 3) * sizeof(uint32_t));
	uint32_t *c_1 = (uint32_t *)malloc((NR + 3) * sizeof(uint32_t));
	
	uint32_t *a, *b, *c;

	u64 pa, pb, pc;
	if (((u64)a_1) & 0xF) {
		pa = ((u64) a_1) & ~0xF + 0x10;
		a = (uint32_t *)pa;
	} else {
		a = a_1;
	}
	if (((u64)b_1) & 0xF) {
		pb = ((u64) b_1) & ~0xF + 0x10;
		b = (uint32_t *)pb;
	} else {
		b = b_1;
	}
	if (((u64)c_1) & 0xF) {
		pc = ((u64) c_1) & ~0xF + 0x10;
		c = (uint32_t *)pc;
	} else {
		c = c_1;
	}

	printf("add of a[0x%llx, 0x%llx], b[0x%llx, 0x%llx], c[0x%llx, 0x%llx]\n",
			(u64)a, (u64)a + NR * sizeof(int), (u64)b, (u64)b + NR * sizeof(int), (u64)c, (u64)c + NR * sizeof(int));
	

	for (int i = 0; i < NR; i++) {
		a[i] = rand();
		b[i] = rand();
	}

	a[0] = 0xFFFFFFFF;
	b[0] = 0xFFFFFFFF;

    time_1 = time(NULL);
	printf("Begin neon\n");
	add_neon(NR, (uint32_t *)a, (uint32_t *)b, (uint32_t *)c);
	printf("Time for neon: %ld\n", time(NULL) - time_1);

	time_1 = time(NULL);
	printf("Begin common\n");
	add_byte(NR, (uint32_t *)a, (uint32_t *)b, (uint32_t *)c);
	printf("Time for common: %ld\n", time(NULL) - time_1);

	
	bool correct = 1;
	for (int i = 0; i < NR; i++) {
		if (a[i] + b[i] != c[i]) {
			correct = 0;
			printf("%d, 0x%x + 0x%x != 0x%x\n", i, a[i], b[i], c[i]);
			break;
		}
	}
	
	printf("The neon addition is %s\n", correct ? "correct" : "incorrect");

	free(a_1);
	free(b_1);
	free(c_1);
}
