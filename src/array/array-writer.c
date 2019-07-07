#include <stdio.h>
#include <stdlib.h>
#include <time.h>

main(int argc, char **argv) {
    FILE *fp;
    int *arr,n,i,size;
    time_t t;
    int numero;
    size = atoi(argv[1]);//gets the array dimension from argv[1] argument


    fp = fopen("array.txt", "w+");
    srand(time(NULL));
    size = atoi(argv[1]);//gets the array dimension from argv[1] argument
    srand((unsigned) time(&t)); //Intializes random number generator
    //populate the array
    arr = (int*)malloc(size * sizeof(int));
    for(i=0;i<size;i++){
        arr[i] = rand() % 9999;
        fprintf(fp,"%d ",arr[i]);
    }
    fclose(fp);
}