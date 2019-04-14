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