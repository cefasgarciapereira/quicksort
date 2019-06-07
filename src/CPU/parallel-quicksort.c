#include<stdio.h>
#include<time.h>
#include <stdlib.h>
#include<omp.h>
#include "../lib/quicksort.h"
int prints = 0;

int getPivot(int n){
    int r = rand() % n;
    //printf("Pivot: %d\n",r);
    return r;
}

void populateL(int L[],int v[],int pivot){
    int i=0;

    for(i=0;i<pivot;i++){
        L[i] = v[i];
    }
}

void populateR(int R[],int v[],int pivot, int n){
    int i,j = 0;

    for(i=pivot;i<n;i++){
        R[j] = v[i];
        j++;
    }
}

int parallelQuicksort(int v[], int n){
    int pivot;
    int *L; //left size of the array
    int *R; //right size of the array


    if(n<=1)
        return v;

    pivot = getPivot(n); //any value from array (random)
    L = (int*)malloc(pivot * sizeof(int));//L gets the value of the array from the begining until the pivot
    R = (int*)malloc((n-pivot) * sizeof(int));//R gets the value of the array from the pivot to the end

    populateL(L, v, pivot);//slice the left part of the array
    //printf("L: ");
    //printArray(L,pivot);//slice the right part of the array
    //printf("\n");
    //printf("R: ");
    populateR(R, v,pivot,n);
    //printArray(R,(n-pivot));
    //printf("\n");

    omp_set_num_threads(2);


    #pragma omp parallel
    {
        int id = omp_get_thread_num();
        int nt = omp_get_num_threads();

        if(id == 0){
            quickSort(L,0,pivot-1);
        }

        if(id == 1){
            quickSort(R,0,(n-pivot)-1);
        }

    }
    if(prints != 0){
        printf("Sorted array: ");
        if(L[0] < R[0]){
            printArray(L, pivot);
            printArray(R, (n-pivot));
        }else{
            printArray(R, (n-pivot));
            printArray(L, pivot);
        }
    }


}

int main(int argc, char **argv){
    int *arr,n,i,size;
    time_t t;
    double total_time;
    clock_t start, end;
    srand(time(NULL));
    size = atoi(argv[1]);//gets the array dimension from argv[1] argument
    srand((unsigned) time(&t)); //Intializes random number generator
    //populate the array
    arr = (int*)malloc(size * sizeof(int));
    for(i=0;i<size;i++){
        arr[i] = rand() % 9999;
    }
    //time count starts
    start = clock();
    parallelQuicksort(arr, size);
    //calulate total time
    end = clock();
    total_time = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("\nCPU Prallel %d Elements: %.2f miliseconds\n",size, total_time*1000);
    return 0;
}
