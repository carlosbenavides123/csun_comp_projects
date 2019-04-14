//File 3, test.c 
#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include "pid.h"
#include "pid.c"

#define NUM_THREADS 100
#define ITERATIONS	3
#define SLEEP		5

/**
 * mutex lock used when accessing data structure
 * to ensure there are no duplicate pid's in use.
 */
pthread_mutex_t test_mutex;
int fail = 0;

void *allocator(void *param)
{
	pthread_mutex_lock(&mutex);
	int ret = allocate_pid();
	while(ret == -1)
	{
		fail++;
		ret = allocate_pid();
	}
    printf("\n PID %d has been allocated\n", ret);
	sleep(SLEEP);
	release_pid(ret);
    printf("\n PID %d has been allocated\n", ret);
	pthread_mutex_unlock(&test_mutex);

	return NULL;
}

int main(void)
{
	int i = 0;
	int j = 0;
	int thread = 1;
	pthread_t tids[NUM_THREADS];

	if (allocate_map() == -1)
		return -1;

	while( i < ITERATIONS)
	{
		while(j < NUM_THREADS)
		{
			if (pthread_mutex_init(&test_mutex, NULL) != 0)
			{
				printf("\n mutex init failed\n");
				return 1;
			}

			thread = pthread_create(&(tids[i]), NULL, &allocator, NULL);

			while (thread != 0)
			{
				fail++;
				thread = pthread_create(&(tids[i]), NULL, &allocator, NULL);
			}
			j++;
		}
		i++;
	}

	sleep(SLEEP);

	pthread_mutex_destroy(&test_mutex);
	printf("%d times process can not obtain PID", fail);
	printf("***DONE***\n");

	return 0;
}