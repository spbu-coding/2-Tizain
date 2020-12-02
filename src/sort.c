#include <stdio.h>

void bubble_sort(long int array[] , size_t nsort)
{
    for(unsigned int i = 0 ; i < nsort-1 ; ++i)
    {
        for(unsigned int j = 0 ; j < nsort - i - 1 ; ++j)
        {
            if(array[j] > array[j+1])
            {
               int temp = array[j];
                array[j] = array[j+1];
                array[j+1] = temp;
            }
        }
    }
}
