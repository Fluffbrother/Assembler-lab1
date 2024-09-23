#include <stdio.h>

int main() {
	int year;
	scanf("%d", &year);

	// if (year % 400 == 0) {
	// 	// Print YEs
	// } else if (year % 4 == 0) {
	// 	if (year % 100 != 0) {
	// 		// print YES
	// 	} else {
	// 		// print NO
	// 	}
	// } else {
	// 	// print NO
	// }

	if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) {
		printf("yes\n");
	} else {
		printf("no\n");
	}

	return 0;
}
