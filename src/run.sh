#!/bin/bash
gcc array/array-writer.c -o array/array-writer
gcc CPU/sequential-quicksort.c -o CPU/sequential-quicksort -lm
gcc CPU/sequential-quicksort.c -o CPU/sequential-quicksort -lm
gcc CPU/parallel-quicksort-2pivot.c -o CPU/parallel-quicksort -lm -fopenmp
gcc GPU/gpu-sequential-quicksort.c -o GPU/gpu-sequential-quicksort -lm -fopenmp
gcc GPU/gpu-parallel-quicksort.c -o GPU/gpu-parallel-quicksort -lm -fopenmp
gcc GPU/gpu-parallel-quicksort-2pivot.c -o GPU/gpu-parallel-quicksort -lm -fopenmp
rm -rf CPU/sequential-quicksort-report.txt
rm -rf CPU/parallel-quicksort-report.txt
rm -rf CPU/parallel-quicksort-2pivot-report.txt
rm -rf GPU/gpu-sequential-quicksort-report.txt
rm -rf GPU/gpu-parallel-quicksort-report.txt
rm -rf GPU/gpu-parallel-quicksort-2pivot-report.txt


cd array
./array-writer 1000
cd ../
cd CPU
#./sequential-quicksort 1000
#./parallel-quicksort 1000
./parallel-quicksort-2pivot 1000
cd ../
cd GPU
#./gpu-sequential-quicksort 1000
#./gpu-parallel-quicksort 1000
./gpu-parallel-quicksort-2pivot 1000
cd ..


cd array
./array-writer 2000
cd ../
cd CPU
#./sequential-quicksort 2000
#./parallel-quicksort 2000
./parallel-quicksort-2pivot 2000
cd ../
cd GPU
#./gpu-sequential-quicksort 2000
#./gpu-parallel-quicksort 2000
./gpu-parallel-quicksort-2pivot 2000
cd ..

cd array
./array-writer 4000
cd ../
cd CPU
#./sequential-quicksort 4000
#./parallel-quicksort 4000
./parallel-quicksort-2pivot 4000
cd ../
cd GPU
#./gpu-sequential-quicksort 4000
#./gpu-parallel-quicksort 4000
./gpu-parallel-quicksort-2pivot 4000
cd ..

cd array
./array-writer 8000
cd ../
cd CPU
#./sequential-quicksort 8000
#./parallel-quicksort 8000
./parallel-quicksort-2pivot 8000
cd ../
cd GPU
#./gpu-sequential-quicksort 8000
#./gpu-parallel-quicksort 8000
./gpu-parallel-quicksort-2pivot 8000
cd ..

cd array
./array-writer 16000
cd ../
cd CPU
#./sequential-quicksort 16000
#./parallel-quicksort 16000
./parallel-quicksort-2pivot 16000
cd ../
cd GPU
#./gpu-sequential-quicksort 16000
#./gpu-parallel-quicksort 16000
./gpu-parallel-quicksort-2pivot 16000
cd ..

cd array
./array-writer 32000
cd ../
cd CPU
#./sequential-quicksort 32000
#./parallel-quicksort 32000
./parallel-quicksort-2pivot 32000
cd ../
cd GPU
#./gpu-sequential-quicksort 32000
#./gpu-parallel-quicksort 32000
./gpu-parallel-quicksort-2pivot 32000
cd ..

cd array
./array-writer 64000
cd ../
cd CPU
#./sequential-quicksort 64000
#./parallel-quicksort 64000
./parallel-quicksort-2pivot 64000
cd ../
cd GPU
#./gpu-sequential-quicksort 64000
#./gpu-parallel-quicksort 64000
./gpu-parallel-quicksort-2pivot 64000
cd ..

cd array
./array-writer 128000
cd ../
cd CPU
#./sequential-quicksort 128000
#./parallel-quicksort 128000
./parallel-quicksort-2pivot 128000
cd ../
cd GPU
#./gpu-sequential-quicksort 128000
#./gpu-parallel-quicksort 128000
./gpu-parallel-quicksort-2pivot 128000
cd ..

# cd array
# ./array-writer 256000
# cd ../
# cd CPU
# #./sequential-quicksort 256000
# #./parallel-quicksort 256000
# ./parallel-quicksort-2pivot 256000
# cd ../
# cd GPU
# #./gpu-sequential-quicksort 256000
# #./gpu-parallel-quicksort 256000
# ./gpu-parallel-quicksort-2pivot 256000
# cd ..