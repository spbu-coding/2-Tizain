#include <stdio.h>
#include <string.h>
#include <stdlib.h>
<<<<<<< HEAD

#define CRITICAL_VALUE 32767

extern void sort(long long *strings_array_t, int array_size_t);

int count(int argc, char* argv[]) {   /* Ñêîëüêî ýëåìåíòîâ áóäåò â ñôîðìàòèðîâàííîì ìàññèâå */
=======
#include "sort.h"

#define CRITICAL_VALUE 32767
//#define chg_var long int

int count(int argc, char* argv[]) {   /* Ð¡ÐºÐ¾Ð»ÑŒÐºÐ¾ ÑÐ»ÐµÐ¼ÐµÐ½Ñ‚Ð¾Ð² Ð±ÑƒÐ´ÐµÑ‚ Ð² ÑÑ„Ð¾Ñ€Ð¼Ð°Ñ‚Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð½Ð¾Ð¼ Ð¼Ð°ÑÑÐ¸Ð²Ðµ */
>>>>>>> cee803c8b7597d7c05703342cfc4d5da483fea3b
	int arr_count = 0;
	for (int i = 1; i < argc; i++) {
		if (strncmp (argv[i], "--from=",7)==0)	arr_count ++;
		if (strncmp (argv[i], "--to=",5)==0)	arr_count ++;
		}
	arr_count += (argc-1);

	return arr_count;
}

<<<<<<< HEAD
char** array_format(int argc, char* argv[]) {  /* Ñîçäàåì ìàññèâ â íóæíîì ôîðìàòå */
=======
char** array_format(int argc, char* argv[]) {  /* Ð¡Ð¾Ð·Ð´Ð°ÐµÐ¼ Ð¼Ð°ÑÑÐ¸Ð² Ð² Ð½ÑƒÐ¶Ð½Ð¾Ð¼ Ñ„Ð¾Ñ€Ð¼Ð°Ñ‚Ðµ */
>>>>>>> cee803c8b7597d7c05703342cfc4d5da483fea3b

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


<<<<<<< HEAD
int main(int argc, char* argv[]) { // ïðèåì äàííûõ --from= è --to= ñ êîíñîëè
=======
int main(int argc, char* argv[]) { // Ð¿Ñ€Ð¸ÐµÐ¼ Ð´Ð°Ð½Ð½Ñ‹Ñ… --from= Ð¸ --to= Ñ ÐºÐ¾Ð½ÑÐ¾Ð»Ð¸
>>>>>>> cee803c8b7597d7c05703342cfc4d5da483fea3b

	typedef enum{false, true} bool;
	bool from_in_console = false, to_in_console = false;
	int index_for_from = 0, index_for_to = 0, how_many_param = 0, invalid_values = 0, \
	value_from = 0, value_to = 0, command_count = 0, how_many_from = 0, how_many_to = 0; 
	char* its_char_here;
	
<<<<<<< HEAD
	char** console_data = array_format(argc, argv); // äàííûå ñ êîíñîëè ïðèîáðåòàþò íóæíûé ôîðìàò
	int arr_count = count(argc, argv);	// ñêîëüêî ýëåìåíòîâ áóäåò â óæå ôîðìàòèðîâàííîì ìàññèâå äàííûõ

// Ïîèñê îøèáîê ïðè â ââîäå ñ êîíñîëè --from= è --to= è íàõîæäåíèå çíà÷åíèé from è to
=======
	char** console_data = array_format(argc, argv); // Ð´Ð°Ð½Ð½Ñ‹Ðµ Ñ ÐºÐ¾Ð½ÑÐ¾Ð»Ð¸ Ð¿Ñ€Ð¸Ð¾Ð±Ñ€ÐµÑ‚Ð°ÑŽÑ‚ Ð½ÑƒÐ¶Ð½Ñ‹Ð¹ Ñ„Ð¾Ñ€Ð¼Ð°Ñ‚
	int arr_count = count(argc, argv);	// ÑÐºÐ¾Ð»ÑŒÐºÐ¾ ÑÐ»ÐµÐ¼ÐµÐ½Ñ‚Ð¾Ð² Ð±ÑƒÐ´ÐµÑ‚ Ð² ÑƒÐ¶Ðµ Ñ„Ð¾Ñ€Ð¼Ð°Ñ‚Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð½Ð¾Ð¼ Ð¼Ð°ÑÑÐ¸Ð²Ðµ Ð´Ð°Ð½Ð½Ñ‹Ñ…

// ÐŸÐ¾Ð¸ÑÐº Ð¾ÑˆÐ¸Ð±Ð¾Ðº Ð¿Ñ€Ð¸ Ð² Ð²Ð²Ð¾Ð´Ðµ Ñ ÐºÐ¾Ð½ÑÐ¾Ð»Ð¸ --from= Ð¸ --to= Ð¸ Ð½Ð°Ñ…Ð¾Ð¶Ð´ÐµÐ½Ð¸Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ð¹ from Ð¸ to
>>>>>>> cee803c8b7597d7c05703342cfc4d5da483fea3b
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
				invalid_values++;	
				value_from = 0;
				how_many_param++; }
					 			
			if (i == index_for_to) {
				invalid_values++;
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

<<<<<<< HEAD
// Îáðàáîòêà ýòèõ îøèáîê 
=======
// ÐžÐ±Ñ€Ð°Ð±Ð¾Ñ‚ÐºÐ° ÑÑ‚Ð¸Ñ… Ð¾ÑˆÐ¸Ð±Ð¾Ðº 
>>>>>>> cee803c8b7597d7c05703342cfc4d5da483fea3b
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
	if (invalid_values > 1) {
		printf("-4\n");
		return -4;
	}

<<<<<<< HEAD
// Âûâîä íà ýêðàí çàïðîñà î ââåäåíèè ìàññèâà, åãî ïðèåì è ôîðìàò
=======
// Ð’Ñ‹Ð²Ð¾Ð´ Ð½Ð° ÑÐºÑ€Ð°Ð½ Ð·Ð°Ð¿Ñ€Ð¾ÑÐ° Ð¾ Ð²Ð²ÐµÐ´ÐµÐ½Ð¸Ð¸ Ð¼Ð°ÑÑÐ¸Ð²Ð°, ÐµÐ³Ð¾ Ð¿Ñ€Ð¸ÐµÐ¼ Ð¸ Ñ„Ð¾Ñ€Ð¼Ð°Ñ‚
>>>>>>> cee803c8b7597d7c05703342cfc4d5da483fea3b
	if (how_many_param == 1) {
		if (from_in_console) value_to = CRITICAL_VALUE;
		if (to_in_console) value_from = -CRITICAL_VALUE;
	}
	
	printf("From %d to %d\nIts correct.\nYou may write your array:\n", value_from, value_to);

	long int entered_array[100], data; 
	char c;
	int jent = -1;
	do
	{
		if (scanf("%ld%c", &data, &c) !=2)
			printf("Data is spelled incorrectly\n");
		else {
			jent++;
			entered_array[jent] = data;
		}
//		printf("%d\n", entered_array[jent]); 
	} 	while(c != '\n');

<<<<<<< HEAD
/* ýòîò öèêë for ðåàëèçîâàí äëÿ îïðåäåëåíèÿ êîëè÷åñòâà ýëåìåíòîâ â ìàññèâàõ Stdout, Stderr, Reduced, Sorted,
	÷òîáû íå çàäåéñòâîâàòü äëÿ íèõ â ïðîãðàììå áîëüøå ïàìÿòè, ÷åì íóæíî. */
=======
/* ÑÑ‚Ð¾Ñ‚ Ñ†Ð¸ÐºÐ» for Ñ€ÐµÐ°Ð»Ð¸Ð·Ð¾Ð²Ð°Ð½ Ð´Ð»Ñ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð¸Ñ ÐºÐ¾Ð»Ð¸Ñ‡ÐµÑÑ‚Ð²Ð° ÑÐ»ÐµÐ¼ÐµÐ½Ñ‚Ð¾Ð² Ð² Ð¼Ð°ÑÑÐ¸Ð²Ð°Ñ… Stdout, Stderr, Reduced, Sorted,
	Ñ‡Ñ‚Ð¾Ð±Ñ‹ Ð½Ðµ Ð·Ð°Ð´ÐµÐ¹ÑÑ‚Ð²Ð¾Ð²Ð°Ñ‚ÑŒ Ð´Ð»Ñ Ð½Ð¸Ñ… Ð² Ð¿Ñ€Ð¾Ð³Ñ€Ð°Ð¼Ð¼Ðµ Ð±Ð¾Ð»ÑŒÑˆÐµ Ð¿Ð°Ð¼ÑÑ‚Ð¸, Ñ‡ÐµÐ¼ Ð½ÑƒÐ¶Ð½Ð¾. */
>>>>>>> cee803c8b7597d7c05703342cfc4d5da483fea3b
	size_t jsort = 0, jerr = 0, jout = 0;
	for (int i = 0; i < jent+1; i++) { 
		if (entered_array[i] > value_from && entered_array[i] < value_to) 	jsort++;
		if (entered_array[i] <= value_from) 	jout++;
		if (entered_array[i] >= value_to) 	jerr++;
	}

	if (jsort == 0) {
		printf("Nothing to sort\n");
		return 0;
	}

<<<<<<< HEAD
// ýòîò öèêë for ðåàëèçîâàí, ÷òîáû íàïîëíèòü ìàññèâû Stdout, Stderr, Reduced èõ çíà÷åíèÿìè
=======
// ÑÑ‚Ð¾Ñ‚ Ñ†Ð¸ÐºÐ» for Ñ€ÐµÐ°Ð»Ð¸Ð·Ð¾Ð²Ð°Ð½, Ñ‡Ñ‚Ð¾Ð±Ñ‹ Ð½Ð°Ð¿Ð¾Ð»Ð½Ð¸Ñ‚ÑŒ Ð¼Ð°ÑÑÐ¸Ð²Ñ‹ Stdout, Stderr, Reduced Ð¸Ñ… Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸ÑÐ¼Ð¸
>>>>>>> cee803c8b7597d7c05703342cfc4d5da483fea3b
	long int reduced_array[jsort], stdout_array[jout], stderr_array[jerr];
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

<<<<<<< HEAD
    long int* sorted_array = (long int*)malloc(jsort * sizeof(long int));	
	size_t count = 0;	
	for (int i = 0; i < jent; i++) {
		if (entered_array[i] > value_from && entered_array[i] < value_to) {
            sorted_array[count] = (unsigned int)malloc(sizeof(unsigned int));
			sorted_array[count] = entered_array[i];
			count ++ ; 
		}
	}

// Âûâîä ìàññèâîâ Stdout, Stderr, Reduced â ïîòîêè è íà ýêðàí 
=======
    long int* sorted_array = (long int*)malloc(jsort * sizeof(long int));
    size_t count = 0;
    for (int i = 0; i < jent; i++) {
        if (entered_array[i] > value_from && entered_array[i] < value_to) {
            sorted_array[count] = entered_array[i];
            count ++ ;
        }
    }

// Ð’Ñ‹Ð²Ð¾Ð´ Ð¼Ð°ÑÑÐ¸Ð²Ð¾Ð² Stdout, Stderr, Reduced Ð² Ð¿Ð¾Ñ‚Ð¾ÐºÐ¸ Ð¸ Ð½Ð° ÑÐºÑ€Ð°Ð½ 
>>>>>>> cee803c8b7597d7c05703342cfc4d5da483fea3b
	printf("\nStdout: ");
	if (jout == 0) printf("-");
	else { for (unsigned int i = 0; i < jout; i++) fprintf(stdout, "%ld ", stdout_array[i]); }

	printf("\nStderr: ");
	if (jerr == 0) printf("-");
	else { for (unsigned int i = 0; i < jerr; i++) fprintf(stderr, "%ld ", stderr_array[i]); 	}

	printf("\nReduced: ");
	for (unsigned int i = 0; i < jsort; i++) printf("%ld ", reduced_array[i]); 

<<<<<<< HEAD
	sort(sorted_array, jsort);  
=======
	bubble_sort(sorted_array, jsort);  
>>>>>>> cee803c8b7597d7c05703342cfc4d5da483fea3b

	printf("\nSorted: ");
	for (unsigned int i = 0; i < jsort; i++) printf("%ld ", sorted_array[i]); 

    return 0;
}

