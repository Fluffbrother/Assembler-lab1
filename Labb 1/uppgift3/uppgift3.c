#include <stdio.h>

int main() {
	int netto, brutto;
	scanf("%d", &brutto);

	int low = 30;
	int high = 50;
	int threshold = 204000;

	if (brutto <= threshold) {
		netto = brutto - brutto * low / 100;
		printf("%d\n", netto);
	} else {
		netto =
			brutto - threshold * low / 100 - (brutto - threshold) * high / 100;
		printf("%d\n", netto);
	}
	return 0;
}