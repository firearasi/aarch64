#include <stdio.h>
typedef unsigned long long u64;
extern u64 hamming(u64 x);

int main()
{
	u64 a;
	printf("Input a u64:\n");
	scanf("%llu", &a);

	u64 dist = hamming(a);
	printf("Hamming of %llu is %llu\n", a, dist);
	return 0;
}
