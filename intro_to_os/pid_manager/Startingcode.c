/*
	Start code for Programming Project 5.
	Create 4 files with proper file extension.
*/


// File 1, pid.h
// This header file is included in pid.c and test.c

#include <pthread.h>

#define PID_MIN  	300
#define PID_MAX 	350

/* mutex lock for accessing pid_map */
pthread_mutex_t mutex;


//File 2, pid.c
#include "pid.h"
#include <pthread.h>
#include <stdio.h>

struct pid_tab
{
    int pid;
    bool bitmap;
}pidArr[50];

/**
 * Allocates the pid map.
 */
int allocate_map(void) 
{
    int i,j;
    for(i = MIN_PID, j =0; i <= MAX_PID; i++, j++)
    {
        pidArr[j].pid = i;
        pidArr[j].bitmap = 0;
    }

    if(i == MAX_PID && j == 50)
    	return 1;
    return -1;
}

/**
 * Allocates a pid
 */
int allocate_pid(void)
{
	for(int i = MIN_PID, j = 0; i <= MAX_PID; i++, j++)
    {
        if(pidArr[j].bitmap == 0)
        {
            pidArr[j].pid = i;
            pidArr[j].bitmap = 1;
            return i;
            break;
        }
    }
    return -1;
}
/**
 * Releases a pid
 */
void release_pid(int pid)
{
    for(int i = 0; i <= 50; i++)
    {
        if(pidArr[i].pid == pid)
        {
            pidArr[i].bitmap = 0;
        }
    }
}


//File 3, test.c 
#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#include <time.h>
#include "pid.h"

#define NUM_THREADS 100
#define ITERATIONS	3
#define SLEEP		5

/**
 * mutex lock used when accessing data structure
 * to ensure there are no duplicate pid's in use.
 */
pthread_mutex_t test_mutex;
int idx = 0;

void *allocator(void *param)
{
	int ret = allocate_pid();
	while(idx < 100)
	{
		pthread_mutex_lock(&mutex);
		if(idx >= 100)
		{
			pthread_mutex_unlock(&mutex);
			break;
		}
		idx++;
		sleep(100);
		pthread_mutex_unlock(&mutex);
	}
	sleep(10);
	release_pid(ret);
}

int main(void)
{
	int i;
	pthread_t tids[NUM_THREADS];

	//Todo:
	/* allocate the pid map */
	for(i = 0; i < 100; i++)
	{
		pthread_mutex_init(&mutex, NULL);
		pthread_create(&tids[i], NULL, allocator, NULL);
		allocator(NULL);
	}
	for(int i = 0; i < 100; i++)
	{
		pthread_join(idx[i], NULL);
		pthread_mutex_destroy(&mutex);
	}
	
	//Todo:
	
	printf("***DONE***\n");

	return 0;
}

//File 4, Makefile, To compile, enter "make all"

// all: testpid

// testpid: test.o pid.o
// 	gcc  -lpthread -o testpid test.o pid.o

// pid.o: pid.c pid.h
// 	gcc -c pid.c

// test.o: test.c pid.h
// 	gcc -lpthread -c test.c
