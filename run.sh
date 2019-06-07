#!/bin/bash
gcc /src/sequential-quicksort.c -o /src/sequential-quicksort
gcc /src/parallel-quicksort.c -o /src/parallel-quicksort -fopenmp
clear
./src/sequential-quicksort 10
./src/parallel-quicksort 10
./src/sequential-quicksort 100
./src/parallel-quicksort 100
# ./src/sequential-quicksort 1000
# ./src/parallel-quicksort 1000
# ./src/sequential-quicksort 10000
# ./src/parallel-quicksort 10000
# ./src/sequential-quicksort 100000
# ./src/parallel-quicksort 100000
# ./src/sequential-quicksort 1000000
# ./src/parallel-quicksort 1000000
# ./src/sequential-quicksort 10000000
# ./src/parallel-quicksort 10000000
# ./src/sequential-quicksort 100000000
# ./src/parallel-quicksort 100000000