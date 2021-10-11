#include <stdio.h>

long f(long x, long y)
{
    return x * x + y * y;
}

int main()
{
    long i, j;
	long s;
	scanf("%ld %ld", &i, &j);
    s = f(i, j);
	printf("Sqr sum of %ld and %ld is %ld\n", i, j, s);
	return 0;
}
