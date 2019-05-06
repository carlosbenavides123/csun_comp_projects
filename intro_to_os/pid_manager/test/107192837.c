// File 1, pid.h
// This header file is included in pid.c and test.c

#include <pthread.h>

#define PID_MIN 300
#define PID_MAX 350

/* mutex lock for accessing pid_map */
pthread_mutex_t mutex;

//File 2, pid.c

#include "pid.h"
#include <pthread.h>
#include <stdio.h>
#define TRUE 1
#define FALSE 0

struct pid_struct
{
    int PID;
    int active;
} * pid_struct;

/**
 * Allocates the pid map.
 */
int allocate_map(void)
{
    int i;

    pid_struct = (struct pid_struct *)calloc((PID_MAX - PID_MIN + 1), sizeof(struct pid_struct));
    if (pid_struct == NULL)
        return -1;
    pid_struct[0].PID = PID_MIN;
    pid_struct[0].active = TRUE;

    for(i = 1; i < PID_MAX - PID_MIN + 1; i++)
    {
        pid_struct[i].PID = pid_struct[i - 1].PID + 1;
        pid_struct[i].active = TRUE;
    }
    return 1;
}

/**
 * Allocates a pid
 */
int allocate_pid(void)
{
    int i;
    for (i = 0; i < PID_MAX - PID_MIN + 1; i++)
    {
        if(pid_struct[i].active == TRUE)
        {
            pid_struct[i].active = FALSE;
            return pid_struct[i].PID;
        }
    }
    if (i == PID_MAX - PID_MIN + 1)
        return -1;
}

/**
 * Releases a pid
 */
void release_pid(int pid)
{
    pid_struct[pid - PID_MIN].active = TRUE;
}

//File 3, test.c
#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#include <time.h>
#include "pid.h"
​
#define NUM_THREADS 100
#define ITERATIONS 3
#define SLEEP 5
​

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
// File 4: Makefile
// all: testpid

// testpid: test.o pid.o
// 	gcc  -lpthread -o testpid test.o pid.o

// pid.o: pid.c pid.h
// 	gcc -c pid.c

// test.o: test.c pid.h
// 	gcc -lpthread -c test.c