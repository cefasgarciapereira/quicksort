##Quicksort

Quicksort is very famous algorithm to sort arrays. In this project the algorithm
is implemented in C language as a discipline project of Computer Sciende Master
degree. The objective is to compare the performance of sequential and parallel
methods of execution. For that I used the OpenMP library.

## Project Strucure

The quicksort was implemented to run in CPU and GPU. Both have a sequential and
parallel version of the code. So we can compare the time performance for each.

| Versions of the Code  |
| --------------------- |
| CPU Sequential        |
| CPU Parallel          |
| GPU Sequential        |
| GPU Parallel          |

## Running

If you are on unix like OS, you can simply run the script ```./script.sh```. It
automatically compile all the source codes and run them with input from 10 to
10.000.000 array's size.
If you prefer run each code separadetly, the program expects you to inform the
size of the array, for example, if you want to run the code sequentialy on CPU
with an array size of 1000 elements the code would look like:

```
gcc sequential-quicksort.c -o sequential-quicksort -fopenmp

./sequential-quicksort 1000
```
