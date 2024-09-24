#include <limits.h>
#include <stdio.h>

#define MAX 10

int main() {
	int n, large, small;
	large = INT_MIN;
	small = INT_MAX;

	for (int i = 0; i < MAX; i++) {
		scanf("%d", &n);
		if (n > large) {
			large = n;
		}
		if (n < small) {
			small = n;
		}
	}
	printf("%d %d\n", large, small);
	return 0;
}