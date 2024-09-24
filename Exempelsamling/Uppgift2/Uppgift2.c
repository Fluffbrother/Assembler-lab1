#include <stdio.h>

int vec[] = {5, 7, 1, 9, 2, 4, 8, 3, 6};

main() {
	int i;
	int sum = 0;

	for (i = 0; i < 9; i++) {
		sum = sum + vec[i];
	}
	printf("The sum of the elements in the vector is %d.\n", sum);
}