#include <stdio.h>
int vec[] = {5, 7, 1, 9, 2, 4, 8, 3, 6};

int sum(int v[], int size) {
	int i;
	int sum = 0;

	for (i = 0; i < size; i++) {
		sum = sum + v[i];
	}
	return sum;
}

int sumrec(int v[], int size) {
	if (size == 0) {
		return 0;
	} else {
		return v[0] + sumrec(&v[1], size - 1);
	}
}

main() {
	printf("The sum of the elements in the vector is %d.\n", sum(vec, 9));
	printf("The sum of the elements in the vector is %d.\n", sumrec(vec, 9));
}
