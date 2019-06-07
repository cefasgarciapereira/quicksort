#include<stdio.h> 
#include<time.h>
#include "quicksort.h"  
int prints = 0;

int main(int argc, char **argv) 
{ 
    int *arr, size, i;
    time_t t;
    double total_time;
    clock_t start, end;
    size = atoi(argv[1]);//gets the array dimension from argv[1] argument
    
    arr = (int*)malloc(size * sizeof(int));
    for(i=0;i<size;i++){
        arr[i] = rand() % 9999;
    }
    //time count starts
    start = clock();
    quickSort(arr, 0, size-1); 
    //calulate total time    
    end = clock();
    total_time = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("\nTime taken to solve it in sequential and an array size of %d: %.2f miliseconds\n",size, total_time*1000);
    if(prints != 0){
        printf("Sorted array: "); 
        printArray(arr, size); 
        printf("\n");
    }
    return 0; 
} 