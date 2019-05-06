//File , test.c
#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#include <time.h>
#include "pid.h"

#define NUM_THREADS 100
#define ITERATIONS 3
#define SLEEP 5

/**
 * mutex lock used when accessing data structure
 * to ensure there are no duplicate pid's in use.
 */
pthread_mutex_t test_mutex;
int fail = 0;

void *allocator(void *param)
{
    pthread_mutex_lock(&test_mutex);
    int id = allocate_pid();
    while(id == -1){
        fail++;
        id = allocate_pid();
    }
    printf("\n PID %d has been allocated\n", id);
    sleep(SLEEP);
    release_pid(id);
    printf("\n PID %d has been freed\n", id);
    pthread_mutex_unlock(&test_mutex);

    return NULL;
}

int main(void)
{
    int i = 0;
    int j = 0;
    int thread = 1;
    pthread_t tids[NUM_THREADS];

    /* allocate the pid map */
    if (allocate_map() == -1)
        return -1;

    while (i < ITERATIONS)
    {
        while (j < NUM_THREADS)
        {
            if (pthread_mutex_init(&test_mutex, NULL) != 0)
            {
                printf("\n mutex init has failed\n");
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
    printf("%d times process can not obtain a PID", fail);
    printf("***DONE***\n");

    return 0;
}