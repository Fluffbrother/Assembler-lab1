#include <stdio.h>

int antal = 10;
int vek[] = {4, 5, 2, 2, 1, 6, 7, 9, 5, 10};

/* Funktion som fogar samman 2 sorterade vektorhalvor till en sorterad vektor */
void merge(int a[], int size) {
	int half = size / 2;
	int i, j, k;
	int b[size];
	for (i = 0; i < size; i++)
		b[i] = a[i];
	i = 0;
	j = half;
	k = 0;

	while (i < half && j < size) {
		if (b[i] <= b[j]) {
			a[k] = b[i];
			i++;
		} else {
			a[k] = b[j];
			j++;
		}
		k++;
	}

	while (i < half) {
		a[k] = b[i];
		i++;
		k++;
	}

	while (j < size) {
		a[k] = b[j];
		j++;
		k++;
	}
}

/* Rekursiv funktion som sorterar en vektor (array) */
void mergeSort(int a[], int size) {
	if (size > 1) {
		int half = size / 2;
		mergeSort(a, half);
		mergeSort(a + half, size - half);
		merge(a, size);
	}
}

/* Funktion som skriver ut elementen i en vektor (array) */
void printArray(int a[], int size) {
	int i;
	printf("\n");
	for (i = 0; i < size; i++)
		printf("%d ", a[i]);
	printf("\n");
}

/* Huvudprogrammet */
int main() {
	printArray(vek, antal);
	mergeSort(vek, antal);
	printArray(vek, antal);
	return 0;
}