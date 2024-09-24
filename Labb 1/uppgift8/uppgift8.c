#include <stdio.h>

int vec[] = {5, 7, 1, 9, 2, 4, 8, 3, 6};

int main() {
	printf("Enter the number you are searching for: ");
	int s;
	scanf("%d", &s);

	int found = 0;
	int pos = -1;
	int i;
	for (i = 0; !found && i < 9; i++) {
		if (vec[i] == s) {
			found = 1;
			pos = i + 1;
		}
	}
	if (found) {
		printf("The position of the number is %d.\n", pos);
	} else {
		printf("The number is missing.\n");
	}

	return 0;
}
