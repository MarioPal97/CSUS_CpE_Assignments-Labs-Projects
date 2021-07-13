/*
 * Mario Palacios
 * HOMEWORK 5
 */

// INCLUDE LIBRARIES 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <sys/wait.h>

#define MAX_LIST 14         // DEFINE NUM OF CMDS
#define MAX_INPUT 1000      // DEFINE AMOUNT OF CMD ARGS

char * cmds[MAX_LIST] =     // LISTING CMDS FOR CLI
{
        "cd",
        "exec",
        "exit",
        "gcc",
        "ls",
        "man",
        "more",
        "mv",
        "rm",
        "pwd",
        "sh",
        "touch",
        "which",
        "$PATH"
};

char rawInput[MAX_INPUT];       // TEMP, TO BE PARSED
char* token;                    // HOLDS INPUT, DURING TOKENIZING
char* parsedStr[MAX_INPUT];     // ARRAY TO HOLD STRINGS
int currentIndex = 0;           // INDEX FOR PARSED STRING ARRAY

int main(int argc, char* argv[]) {
    if(argc == 1) {
        fprintf(stderr, "Enter at least two arguments (filename and commands)\n");
        exit(-1);
    } else {
        int i;
        printf("CLI, Mario Palacios, CSC 139 - Section 06\n");  // SELF INDENTIFICATION
        printf("Legal Commands: ");                             // PRINT LEGAL CMDS
        for (i = 0; i < MAX_LIST; i++) {
            printf(" %s", cmds[i]);
        }

        rawInput[0] = 0; 
        
        printf("\n%d strings passed to argv[]\n", argc);
        for(i = 1; i < argc; i++) {                             // CMD LIST FOR CLI
            printf("next string is '%s'\n", argv[i]);
            strcat(rawInput, argv[i]);
            strcat(rawInput, " ");
            printf("new string is '%s'\n", rawInput);
        }

        token = strtok(rawInput, ",;");
        while (token != NULL) {                                 // SEPERATE CMD, BY COMMAS
            parsedStr[currentIndex] = token;
            token = strtok(NULL, ",;");
            currentIndex++;
        }

        for (i = 0; i < currentIndex; i++) {                    // TRIM WHITE SPACE
            while(isspace(*parsedStr[i])) {
                parsedStr[i]++;
            }
        }

        int currentCmd = 0;
        for (i = 1; i < currentIndex; i++) {
            while (currentCmd < MAX_LIST) {
                if (strncmp(cmds[currentCmd], parsedStr[i], strlen(cmds[currentCmd])) == 0) {
                    printf("CMD '%s' is one of the predefined.\n", parsedStr[i]);
                    system(parsedStr[i]);
                }
                currentCmd++;
            }
        }
        system("touch example.txt; mv example.txt file2.txt; ls");             // SYS COMMANDS
    }
}
