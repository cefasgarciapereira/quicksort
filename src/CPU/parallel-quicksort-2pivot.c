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

void populateVectors(int L[], int M[],int R[],int v[],int vsize, int pivot1, int pivot2){
  int i, lindex=0,rindex = 0,mindex=0;
  for(i=0;i<vsize;i++){
    if((v[i] <= v[pivot1] && (v[i] <= v[pivot2])) || i == pivot1 ){
      L[lindex] = v[i];
      lindex++;
    }
    
    if((v[i] <= v[pivot1]) && (v[i] >= v[pivot2]) || i == pivot2){
        M[mindex] = v[i];
        mindex++;
    }

    if(v[i] > v[pivot1] && (v[i] >= v[pivot2])){
      R[rindex] = v[i];
      rindex++;
    }
  }
}

int parallelQuicksort(int v[], int n){
    int pivot1, pivot2;
    int *L; //left size of the array
    int *M; //left size of the array
    int *R; //right size of the array
    int lsize = 0, rsize = 0, msize = 0;
    int i;

    if(n<=1)
        return v;

    pivot1 = getPivot(n); //any value from array (random)
    pivot2 = getPivot(n);
    //calculate de size of the L and R arrays
    for(i=0;i<n;i++){
      if((v[i] <= v[pivot1]) && (v[i] <= v[pivot2])){
        lsize++;
      }

      if((v[i] <= v[pivot1]) && (v[i] >= v[pivot2])){
        msize++;
      }

      if(v[i] > v[pivot1] && (v[i] >= v[pivot2])){
        rsize++;
      }
    }
     L = (int*)malloc(lsize * sizeof(int));//L gets the values minor than the pivot
     R = (int*)malloc(rsize * sizeof(int));//R gets the values bigger or equal to pivot of the array
     M = (int*)malloc(msize * sizeof(int));//R gets the values bigger or equal to pivot of the array
    populateVectors(L,M,R,v,n,pivot1, pivot2);

    omp_set_num_threads(3);
    #pragma omp parallel
    {
        int id = omp_get_thread_num();
        int nt = omp_get_num_threads();
        if(id == 0){
            quickSort(L,0,lsize-1);
        }
        if(id == 1){
            quickSort(M,0,rsize-1);
        }
        if(id == 2){
            quickSort(R,0,rsize-1);
        }
    }
    if(prints != 0){
      printArray(L,lsize);
      printArray(M,lsize);
      printArray(R,rsize);
    }
}

int main(int argc, char **argv){
  int *arr,n,i,size;
  int executions = 10;
  double reports[10];
  time_t t;
  double total_time;
  clock_t start, end;
  FILE *fp;

  fp = fopen("../array/array.txt", "r");
  srand(time(NULL));
  size = atoi(argv[1]);//gets the array dimension from argv[1] argument
  srand((unsigned) time(&t)); //Intializes random number generator
  //populate the array
  arr = (int*)malloc(size * sizeof(int));
  
  //read the array from file
    while (!feof (fp))
    {  
      fscanf (fp, "%d", &arr[i]);      
      //printf ("%d ", arr[i]);
    }
    fclose(fp);

  fp = fopen("parallel-quicksort-2pivot-report.txt", "a");
  fprintf(fp,"\n\n---------- %d ----------",size);
  //time count starts
  for(i=0;i<executions;i++){
    start = clock();
    parallelQuicksort(arr, size);
    
    //calulate total time    
    end = clock();

    reports[i] = ((double) (end - start)) / CLOCKS_PER_SEC;
    total_time = total_time + reports[i];
    fprintf(fp,"\n[%d] CPU Sequential %d Elements: %.2f miliseconds",i+1,size, reports[i]*1000);            
  }
  fprintf(fp,"\n\n Average: %.2f miliseconds",(total_time*1000)/ executions);   
  fprintf(fp,"\n----------------------");           
  fclose(fp);
  return 0;
}
