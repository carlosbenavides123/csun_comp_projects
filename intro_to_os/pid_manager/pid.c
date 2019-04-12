//File 2, pid.c
#include "pid.h"
#include <pthread.h>
#include <stdio.h>
#include <stdbool.h>

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