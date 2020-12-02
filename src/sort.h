void bubble_sort(long int array[] , int* nsort)
{
    for(int i = 0 ; i < *(nsort)-1 ; ++i)
    {
        for(int j = 0 ; j < *(nsort) - i - 1 ; ++j)
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