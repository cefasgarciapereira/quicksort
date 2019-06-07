#!/bin/bash
gcc sequential-quicksort.c -o sequential-quicksort
gcc parallel-quicksort.c -o parallel-quicksort -fopenmp
clear
./sequential-quicksort 10
./parallel-quicksort 10
./sequential-quicksort 100
./parallel-quicksort 100
./sequential-quicksort 1000
./parallel-quicksort 1000
./sequential-quicksort 10000
./parallel-quicksort 10000
# ./sequential-quicksort 100000
# ./parallel-quicksort 100000
# ./sequential-quicksort 1000000
# ./parallel-quicksort 1000000
# ./sequential-quicksort 10000000
# ./parallel-quicksort 10000000