//File 2, pid.c

#include "pid.h"
#include <pthread.h>
#include <stdio.h>
#define TRUE 1
#define FALSE 0
struct PidTable
{
    int PID;
    int isAvailable;
} * pId;

/**
 * Allocates the pid map.
 */
int allocate_map(void)
{
    int i;
    pId = (struct PidTable *)calloc((PID_MAX - PID_MIN + 1), sizeof(struct PidTable));
    if (pId == NULL)
        return -1;
    pId[0].PID = PID_MIN;
    pId[0].isAvailable = TRUE;
    for (i = 1; i < PID_MAX - PID_MIN + 1; i++)
    {
        pId[i].PID = pId[i - 1].PID + 1;
        pId[i].isAvailable = TRUE;
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
        if (pId[i].isAvailable == TRUE)
        {
            pId[i].isAvailable = FALSE;
            return pId[i].PID;
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
    pId[pid - PID_MIN].isAvailable = TRUE;
}