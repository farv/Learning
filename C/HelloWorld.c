/* Let's see: Firstly we find is dificult to undestand now, but in some lesson we will. Secondly we find the important part: the function MAIN, let's go to analize this:*/

#include <stdio.h>

/* "int" means that the function "main" return an integer number. Usually we use this to return errors and 0 means "everything is OK". Don't think about that, it's only a convention */

int main (int argc, char* argv[])
{
/* int argc & char* argv[] will be explained later, now don't think about that */
	printf("Hello world!");
/* "printf" shows by screen the next text in quotes */
	return 0;
/* and we return 0 as we said. */
}

/*Now we know how to write on the screen. Don't forget the "#include <stdio.h>", it is a library where C have the function "printf"!*/
