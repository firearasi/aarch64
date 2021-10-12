#include <stdio.h>
extern float sqrt_approx(float x);

int main()
{
	float a;
	printf("Input a float:\n");
	scanf("%f", &a);

	float dist = sqrt_approx(a);
	printf("Sqrt of %f is %f\n", a, dist);
	return 0;
}
