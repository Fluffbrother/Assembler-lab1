#include <stdio.h>

#define MIN_IN 'b'
#define MAX_IN 'y'

int main() {
	char input;
	scanf("%c", &input);

	if (input >= MIN_IN && input <= MAX_IN) {
		char prev = input - 1;
		char next = input + 1;
		printf("%c %c\n", prev, next);
		return 0;
	}

	return 1;
}
