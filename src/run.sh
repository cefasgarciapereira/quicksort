#!/bin/bash
gcc ./CPU/sequential-quicksort.c -o ./CPU/sequential-quicksort
gcc ./CPU/parallel-quicksort.c -o ./CPU/parallel-quicksort -fopenmp
gcc ./GPU/gpu-sequential-quicksort.c -o ./GPU/gpu-sequential-quicksort -fopenmp
gcc ./GPU/gpu-parallel-quicksort.c -o ./GPU/gpu-parallel-quicksort -fopenmp

clear

echo "--- Quicksort 10 elements ---"
./CPU/sequential-quicksort 10
./CPU/parallel-quicksort 10
./GPU/gpu-sequential-quicksort 10
./GPU/gpu-parallel-quicksort 10
echo -e

echo "--- Quicksort 100 elements ---"
./CPU/sequential-quicksort 100
./CPU/parallel-quicksort 100
./GPU/gpu-sequential-quicksort 100
./GPU/gpu-parallel-quicksort 100
echo -e

echo "--- Quicksort 1.000 elements ---"
./CPU/sequential-quicksort 1000
./CPU/parallel-quicksort 1000
./GPU/gpu-sequential-quicksort 1000
./GPU/gpu-parallel-quicksort 1000
echo -e

echo "--- Quicksort 10.000 elements ---"
./CPU/sequential-quicksort 10000
./CPU/parallel-quicksort 10000
./GPU/gpu-sequential-quicksort 10000
./GPU/gpu-parallel-quicksort 10000
echo -e

echo "--- Quicksort 100.000 elements ---"
./CPU/sequential-quicksort 100000
./CPU/parallel-quicksort 100000
./GPU/gpu-sequential-quicksort 100000
./GPU/gpu-parallel-quicksort 100000
echo -e

echo "--- Quicksort 1.000.000 elements ---"
./CPU/sequential-quicksort 1000000
./CPU/parallel-quicksort 1000000
./GPU/gpu-sequential-quicksort 1000000
./GPU/gpu-parallel-quicksort 1000000
echo -e

# echo "--- Quicksort 10.000.000 elements ---"
# ./CPU/sequential-quicksort 10000000
# ./CPU/parallel-quicksort 10000000
# ./GPU/gpu-sequential-quicksort 10000000
#./GPU/gpu-parallel-quicksort 1000000
# echo -e
