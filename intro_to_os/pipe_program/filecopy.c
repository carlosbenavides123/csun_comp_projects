/**
 *
 * This program copies files using a pipe.
 *
 * Usage:
 *	filecopy <input file> <output file>
 */

#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <time.h>

#define READ_END 0
#define WRITE_END 1

void timestamp(void);

int main(int argc, char *argv[])
{
	int rv;
	pid_t pid;
	int c;
	char rb[2], wb[2];	/* bytes for reading/writing */
	int ffd[2];		/* file descriptor */
	int pfd[2];		/* pipe file descriptor */

	/* Step1: Create pipe descriptor */

	/* open the input file */
	ffd[READ_END] = open(argv[1], O_RDONLY);

	if (ffd[READ_END] < 0) {
		fprintf(stderr,"Unable to open %s\n",argv[1]);
		return 1;
	}

	/* open the output file */
	ffd[1] = open(argv[2], O_CREAT | O_RDWR, S_IRUSR | S_IWUSR);

	if (ffd[1] < 0) {
		fprintf(stderr,"Unable to open %s\n",argv[2]);

		/* close the input file */
		close(ffd[0]);

		return 1;
	}

	/* Step2: set up the pipe */
	/* make sure your program closes file handles*/
	if (pipe(pfd) == -1) {
		fprintf(stderr,"Pipe ran into an error");

		/* close the open files */
		close(ffd[0]);
		close(ffd[1]);

		return 1;
	}

	/* create the processes */
	pid = fork();

	/* error checking */
	if (pid < 0) {
		fprintf(stderr, "Fork Failed");

		close(ffd[0]);
		close(ffd[1]);

		return 1;
	}

	if (pid == 0) {	/* Child reads from pipe */
		/* Close unused write end */
		close(pfd[WRITE_END]);

		/* read from input write to pipe */
		while (read(pfd[0], rb, 1) > 0)
			write(ffd[1], rb, 1);

		/* close */
		close(ffd[WRITE_END]);
		close(pfd[WRITE_END]);
		timestamp();
	}
	else { /* Parent writes to Pipe */ 
		close(pfd[READ_END]);
		while ( (c = read(ffd[0], rb, 1)) > 0 )
			write(pfd[WRITE_END],rb, c);
		close(ffd[READ_END]);
		close(pfd[WRITE_END]);
		wait(NULL);
	}
	return 0;
}

void timestamp()
{
    time_t ltime; /* calendar time */
    ltime=time(NULL); /* get current cal time */
    printf("%s",asctime( localtime(&ltime) ) );
}