#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define CRITICAL_VALUE 2147483647
#define MAX_ARRAY_SIZE 100

extern void sort(long long *array_to_sort, int array_length);

int count(int argc, char* argv[]) {   /* Сколько элементов будет в сформатированном массиве */
	int arr_count = 0;
	for (int i = 1; i < argc; i++) {
		if (strncmp (argv[i], "--from=",7)==0)	arr_count ++;
		if (strncmp (argv[i], "--to=",5)==0)	arr_count ++;
		}
	arr_count += (argc-1);

	return arr_count;
}

char** array_format(int argc, char* argv[]) {  /* Создаем массив в нужном формате */

	int arr_count = count(argc, argv);
	char** console_data_format = (char**)malloc(arr_count * sizeof(char*));
	for(int i = 0; i < arr_count; i++)
        console_data_format[i] = (char*)malloc(10);
	
	int j = -1;
	for (int i = 1; i < argc; i++) {
		j++;
		if (strncmp (argv[i], "--from=",7)==0) {
			strcpy(console_data_format[j], "--from=");
			strcpy(console_data_format[j+1],argv[i] + 7);
			j++;
		}
		else if (strncmp (argv[i], "--to=",5)==0) {
			strcpy(console_data_format[j], "--to=");
			strcpy(console_data_format[j+1], argv[i] + 5);
			j++;
		}
		else strcpy(console_data_format[j], argv[i]);
	}

	return console_data_format;
}

int different_positions(long long *array, long long *copied_array, int array_size) {
	int count_different_numbers = 0;
	for (int i = 0; i < array_size; i++)
		if (array[i] != copied_array[i])
			count_different_numbers++;
	return count_different_numbers;
}

int main(int argc, char* argv[]) { // прием данных --from= и --to= с консоли
	if (argc < 2)
		return -1;
	if (argc > 3) { printf("-2\n");
		return -2; }
	typedef enum{false, true} bool;
	bool from_in_console = false, to_in_console = false;
	int index_for_from = 0, index_for_to = 0, how_many_param = 0,  \
	value_from = 0, value_to = 0, command_count = 0, how_many_from = 0, how_many_to = 0; 
	char* its_char_here;
	
	char** console_data = array_format(argc, argv); // данные с консоли приобретают нужный формат
	int arr_count = count(argc, argv);	// сколько элементов будет в уже форматированном массиве данных

// Поиск ошибок при в вводе с консоли --from= и --to= и нахождение значений from и to
	for (int i = 0; i < arr_count; i++) {
		if (strcmp(console_data[i], "--from=")==0) {
			how_many_from++;
			index_for_from = i + 1;
			from_in_console = true;
			}

		if (strcmp(console_data[i], "--to=")==0) {
			how_many_to++;
			index_for_to = i + 1;
			to_in_console = true;
			}
		if (strncmp(console_data[i], "--",2)==0) command_count++;

		if (i != 0) {   
		long int strtol_result = strtol(console_data[i], &its_char_here, 10);

     	 if (*its_char_here) {			
			if (i == index_for_from) {
				value_from = 0;
				how_many_param++; }
					 			
			if (i == index_for_to) {
				value_to = 0;
				how_many_param++; }
				}
		 else { 
			if (i == index_for_from)	{
				value_from = strtol_result;
				how_many_param++; }
						
			if (i == index_for_to) {
				value_to = strtol_result;
				how_many_param++; }
			}
		} 
	}

// Обработка этих ошибок 
	if (how_many_param < 1) {
		printf("-1\n"); 
		return -1;
	}
	if (command_count > 2) {
		printf("-2\n");
		return -2;
	}
	if (how_many_from > 1 || how_many_to > 1) {
		printf("-3\n");
		return -3;
	}
	if (how_many_from == 0 && how_many_to == 0) {
		printf("-4\n");
		return -4;
	}

// Вывод на экран запроса о введении массива, его прием и формат
	if (how_many_param == 1) {
		if (from_in_console) value_to = CRITICAL_VALUE;
		if (to_in_console) value_from = -CRITICAL_VALUE;
	}
	
//	printf("From %d to %d\nIts correct.\nYou may write your array:\n", value_from, value_to);

	long long int entered_array[MAX_ARRAY_SIZE], data; 
	char c;
	int jent = -1;
	do
	{
		if (scanf("%lld%c", &data, &c) !=2)
			printf("Data is spelled incorrectly\n");
		else {
			jent++;
			entered_array[jent] = data;
		}
//		printf("%d\n", entered_array[jent]); 
	} 	while(c != '\n' || jent != 100);

/* этот цикл for реализован для определения количества элементов в массивах Stdout, Stderr, Reduced, Sorted,
	чтобы не задействовать для них в программе больше памяти, чем нужно. */
	size_t jsort = 0, jerr = 0, jout = 0;
	for (int i = 0; i < jent+1; i++) { 
		if (entered_array[i] > value_from && entered_array[i] < value_to) 	jsort++;
		if (entered_array[i] <= value_from) 	jout++;
		if (entered_array[i] >= value_to) 	jerr++;
	}

/*	if (jsort == 0) {
		printf("Nothing to sort\n");
//		return 0;
	}
*/
// этот цикл for реализован, чтобы наполнить массивы Stdout, Stderr, Reduced их значениями
	long long int reduced_array[jsort], stdout_array[jout], stderr_array[jerr];
	int j = -1, j1 = -1, j2 = -1;
	for (int i = 0; i < jent+1; i++) {
		if (entered_array[i] > value_from && entered_array[i] < value_to) {
			j++;
			reduced_array[j] = entered_array[i];	
		}
		if (entered_array[i] <= value_from) {
			j1++;
			stdout_array[j1] = entered_array[i];	
		}
		if (entered_array[i] >= value_to) {
			j2++;
			stderr_array[j2] = entered_array[i];	
		}		
	}

    long long int* sorted_array = (long long int*)malloc(jsort * sizeof(long long int));	
	for (size_t i = 0; i < jsort; i++) {
	    sorted_array[i] = (long long int)malloc(sizeof(long long int));
		sorted_array[i] = reduced_array[i];
		}


// Вывод массивов Stdout, Stderr, Reduced в потоки и на экран 
	printf("\nStdout: ");
	if (jout == 0) printf("-");
	else { for (unsigned int i = 0; i < jout; i++) fprintf(stdout, "%lld ", stdout_array[i]); }

	printf("\nStderr: ");
	if (jerr == 0) printf("-");
	else { for (unsigned int i = 0; i < jerr; i++) fprintf(stderr, "%lld ", stderr_array[i]); 	}

	printf("\nReduced: ");
	for (unsigned int i = 0; i < jsort; i++) printf("%lld ", reduced_array[i]); 

	sort(sorted_array, jsort);  

	printf("\nSorted: ");
	for (unsigned int i = 0; i < jsort; i++) printf("%lld ", sorted_array[i]); 

//	int t = different_positions(sorted_array, reduced_array, jsort);
//	printf("\nRtrn: %d ", t);
    return different_positions(sorted_array, reduced_array, jsort);
}

