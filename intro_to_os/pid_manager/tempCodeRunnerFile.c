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
		pthread_join(tids[i], NULL);
		pthread_mutex_destroy(&mutex);
	}
	
	//Todo:
	
	printf("***DONE***\n");

	return 0;
}