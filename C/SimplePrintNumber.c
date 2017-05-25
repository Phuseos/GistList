#import <stdio.h>

#define INTNUMBER 10
#define NEWLINE '\n'

int main(){	
	//Simple program that prints 'Defined number found: 10' when ran.

	printf("Defined number found: %d", INTNUMBER);
	printf("%c", NEWLINE);		//Creates a new line

	return 0;				
}

/*

USAGE

Compile on a mac terminal: cc YourFileHere.c -o YourProgramNameHere

You can run it by entering in the terminal: ./YourProgramNameHere

Replace YourFileHere with your .c file and YourProgramNameHere with the name you want to give your program.

*/