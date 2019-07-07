#include<stdio.h> 
#include<time.h>
#include<omp.h>
#include<stdio.h>
#include<stdlib.h>
#include "../lib/quicksort.h"  
int prints = 0;

int main(int argc, char **argv) 
{ 
    int *arr, size, i;
    int executions = 10;
    double reports[10];
    time_t t;
    double total_time;
    clock_t start, end;
    FILE *fp;
    fp = fopen("../array/array.txt", "r");
    size = atoi(argv[1]);//gets the array dimension from argv[1] argument
    arr = (int*)malloc(size * sizeof(int));
    
    //read the array from file
    while (!feof (fp))
    {  
        fscanf (fp, "%d", &arr[i]);      
        //printf ("%d ", arr[i]);
    }
    fclose(fp);


    fp = fopen("gpu-sequential-quicksort-report.txt", "a");
    fprintf(fp,"\n\n---------- %d ----------",size);
    //time count starts
    for(i=0;i<executions;i++){
        //time count starts
        start = clock();
        #pragma omp target // move this region of the code to the GPU and implicity maps data
        {
            quickSort(arr, 0, size-1); 
        }
        
        //calulate total time    
        end = clock();

        reports[i] = ((double) (end - start)) / CLOCKS_PER_SEC;
        total_time = total_time + reports[i];
        fprintf(fp,"\n[%d] GPU Sequential %d Elements: %.2f miliseconds",i+1,size, reports[i]*1000);            
    }
    fprintf(fp,"\n\n Average: %.2f miliseconds",(total_time*1000)/ executions);   
    fprintf(fp,"\n----------------------");           
    fclose(fp); 
  
    return 0; 
} 