#!/bin/bash
gcc sequential-quicksort.c -o sequential-quicksort
gcc parallel-quicksort.c -o parallel-quicksort -fopenmp
gcc gpu-sequential-quicksort.c -o gpu-sequential-quicksort -fopenmp
gcc gpu-parallel-quicksort.c -o gpu-parallel-quicksort -fopenmp

clear

echo "--- Quicksort 10 elements ---"
./sequential-quicksort 10
./parallel-quicksort 10
./gpu-sequential-quicksort 10
./gpu-parallel-quicksort 10
echo -e

echo "--- Quicksort 100 elements ---"
./sequential-quicksort 100
./parallel-quicksort 100
./gpu-sequential-quicksort 100
./gpu-parallel-quicksort 100
echo -e

echo "--- Quicksort 1.000 elements ---"
./sequential-quicksort 1000
./parallel-quicksort 1000
./gpu-sequential-quicksort 1000
./gpu-parallel-quicksort 1000
echo -e

echo "--- Quicksort 10.000 elements ---"
./sequential-quicksort 10000
./parallel-quicksort 10000
./gpu-sequential-quicksort 10000
./gpu-parallel-quicksort 10000
echo -e

echo "--- Quicksort 100.000 elements ---"
./sequential-quicksort 100000
./parallel-quicksort 100000
./gpu-sequential-quicksort 100000
./gpu-parallel-quicksort 100000
echo -e

echo "--- Quicksort 1.000.000 elements ---"
./sequential-quicksort 1000000
./parallel-quicksort 1000000
./gpu-sequential-quicksort 1000000
./gpu-parallel-quicksort 1000000
echo -e

# echo "--- Quicksort 10.000.000 elements ---"
# ./sequential-quicksort 10000000
# ./parallel-quicksort 10000000
# ./gpu-sequential-quicksort 10000000
#./gpu-parallel-quicksort 1000000
# echo -e
