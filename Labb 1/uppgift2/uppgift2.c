#include <stdio.h>

int main() {
	int n;
	scanf("%d", &n);

	if (n % 2) {
		printf("Even");
	} else {
		printf("Odd");
	}
	return 0;
}