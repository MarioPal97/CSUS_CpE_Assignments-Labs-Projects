/* Author(s):
 * Mario Palacios
 * Trevor Davis 
 *
 * This is lab9.c the csc60mshell
 * This program serves as a skeleton for doing labs 9, 10, 11.
 * Student is required to use this program to build a mini shell
 * using the specification as documented in direction.
 * Date: Fall 2019
 */

/* The include files section */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

/* Define Section */
#define MAXLINE 80
#define MAXARGS 20
#define MAX_PATH_LENGTH 50
#define TRUE 1

/* function prototypes */
int parseline(char *cmdline, char **argv);


void process_input(int argc, char **argv); 
void handle_redir(int argc, char *argv[]); 


/* ----------------------------------------------------------------- */
/*                  The main program starts here                     */
/* ----------------------------------------------------------------- */
int main(void)
{
    char cmdline[MAXLINE];
    char *argv[MAXARGS];
    int argc;
    int status;
    pid_t pid;
    
    /* Loop forever to wait and process commands */
    while (TRUE)
    {
    	/* Print your shell name: csc60msh (m for mini shell) */
    	printf("csc60msh> ");

    	/* Read the command line */
    	fgets(cmdline, MAXLINE, stdin);

    	/* Call parseline to build argc/argv */
        argc = parseline(cmdline, argv);
        
        int i =0;
        for (i=0;i<argc;i++)
        {
            printf ("Argv %i = %s\n",i,argv[i]);
        }

	    /* If user hits enter key without a command, continue to loop */
	    /* again at the beginning */
	    /*  Hint: if argc is zero, no command declared */
	    /*  Hint: look up for the keyword "continue" in C */
        if (argc == 0)
        {
            continue;
        }

	    /* Handle build-in command: exit, pwd, or cd  */
	    /* Put the rest of your code here */
        
        //EXIT Command
        else if (strncmp(argv[0], "exit", 30) ==0)
        {
            exit(EXIT_SUCCESS);
        }
        //PWD Command   
        else if (strncmp(argv[0], "pwd", 30) == 0)
        {
            char cwd [MAX_PATH_LENGTH];
            getcwd (cwd, MAX_PATH_LENGTH);
            printf ("%s\n", cwd);
            continue;
        }
        else if (strncmp(argv[0], "cd", 30) == 0)
        {
            char *dir;
            /*Set destination to home directory
             *if no argument provided after cd */   
            if (argc == 1)
            {
                dir = getenv("HOME");
            }
            //ENTER FOLDER NAME
            else 
            {
                dir = argv[1];
            }
            //Checks for error on CD command
            if (chdir(dir) < 0) 
            {
                perror ("Error changing directory");
            }
            continue;
        }
    	/* Else, fork off a process */
        else
        {
	        pid = fork();
            switch(pid)
    	    {
	            case -1:
		             perror("Shell Program fork error");
	                exit(EXIT_FAILURE);
	    	    case 0:
	    	    /* I am child process. I will execute the command, */
		        /* and call: execvp */
		             process_input(argc, argv);
		        break;
    	    	default:
		        /* I am parent process */
	   	        if (wait(&status) == -1)
	        	    perror("Parent Process error");
	   	        else
		        	printf("Child returned status: %d\n",status);
		        break;
	        } 	/* end of the switch */
	    }	/* end of the if-else-if */
    }		/* end of the while */
} 		/* end of main */

/* ----------------------------------------------------------------- */
/*                  parseline                                        */
/* ----------------------------------------------------------------- */
/* parse input line into argc/argv format */

int parseline(char *cmdline, char **argv)
{
    int argc = 0;
    char *separator = " \n\t"; /* Includes space, Enter, Tab */
 
    /* strtok searches for the characters listed in separator */
    argv[argc] = strtok(cmdline, separator);

    while ((argv[argc] != NULL) && (argc+1 < MAXARGS)) 
    	argv[++argc] = strtok((char *) 0, separator);
     		
    return argc;  
}
/* ----------------------------------------------------------------- */
/*                  process_input                                    */
/* ----------------------------------------------------------------- */
void process_input(int argc, char **argv)
{                        

    /* Step 1: Call handle_redir to deal with operators:             */
    /* < , or  >, or both                                            */
    handle_redir(argc, argv);

    /* Step 2: perform system call execvp to execute command         */
    /* Hint: Please be sure to review execvp.c sample program        */
    if (execvp(argv[0], argv)  == -1) 
    {                                         
        fprintf("Error on the exec call\n");               
        exit(EXIT_FAILURE);                                       
    }                                                             
 
}
/* ----------------------------------------------------------------- */
/*                    handle_redir                                   */
/* ----------------------------------------------------------------- */
void handle_redir(int count, char *argv[])
{
    /*Set the redirect index(s)*/
    int out_redir = 0;
    int in_redir = 0;

    //Loop to parse the string to find redirect chars
    int c;
    for (c = 0; c < count; c++)
    {
        //out_redir char is detected
        if (strcmp(argv[c], ">") == 0)
        {
            //Multiple redirect Chars
            if (out_redir != 0)
            {
                perror("Cannot output more than one file.\n");
                exit(EXIT_FAILURE);
            }
            //Empty Command
            else if (c == 0) 
            {
                perror("No Command Entered.\n");
                exit(EXIT_FAILURE);
            }
            //out_redir index to counter
            out_redir = c;
        }
        //in_redir char detected 
        else if (strcmp(argv[c], "<") == 0)
        {
            //Error, multiple redirect chars 
            if (in_redir != 0)
            {
                perror("Cannot Input More Than One File.\n");
                exit(EXIT_FAILURE);
            }
            //Error, empty command
            else if (c == 0)
            {
                perror("No Command Entered.\n");
                exit(EXIT_FAILURE);
            }
            //Set in_redir index to the counter 
            in_redir = c;
        }
        //Redirect is taking place
        if (out_redir != 0)
        {
            /*O_RDWR: read/write
             *O_CREAT: create the file if doesn't exist
             *O_TURNC: truncate exist file to zero length
             *S_IRUSR: read permission, owner
             *S_IWUSR: write permission, owner
             */
            int fileDescriptor = open(argv[out_redir + 1], O_RDWR | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
            //HAndle system call to open redirect out
            if (fileDescriptor < 0)
            {
                perror ("Error On Open For Output.\n");
                exit (EXIT_FAILURE);
            }
            dup2(fileDescriptor, 1);
            //close output file with error 
            if (close(fileDescriptor) == -1)
            {
                perror ("Error On Closing Output File.\n");
                exit (EXIT_FAILURE);
            }
            //Set Arguement
            argv[out_redir] = NULL;
        }
        //Redirect taking place
        if (in_redir != 0)
        {
            //Error, empty input file
            if (argv[in_redir + 1] == NULL)
            {
                perror ("Error, No Such File Exists.\n");
                exit(EXIT_FAILURE);
            }
            int fileDescriptor = open(argv[in_redir + 1], O_RDWR);
            //Error, call to open input file 
            if (fileDescriptor < 0);
            {
                perror ("Error On Open for Read.\n");
                exit(EXIT_FAILURE);
            }
            dup2(fileDescriptor, 0);
            //Close input with error handling 
            if (close(fileDescriptor) == 1)
            {
                perror ("Error On Close for Read.\n");
                exit(EXIT_FAILURE);
            }
            argv[in_redir] = NULL;
        }
    }
}

/* ----------------------------------------------------------------- */
