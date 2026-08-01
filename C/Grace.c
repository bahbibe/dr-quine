#include <stdio.h>

/* a single comment */

#define B { FILE *f = fopen("Grace_kid.c","w"); char *s = "#include <stdio.h>%c%c/* a single comment */%c%c#define B { FILE *f = fopen(%cGrace_kid.c%c,%cw%c); char *s = %c%s%c; fprintf(f, s, 10, 10, 10, 10, 34, 34, 34, 34, 34, s, 34, 10, 10, 10, 10); fclose(f); }%c#define A(x) int main(void) x%c#define MAIN A(B)%cMAIN%c"; fprintf(f, s, 10, 10, 10, 10, 34, 34, 34, 34, 34, s, 34, 10, 10, 10, 10); fclose(f); }
#define A(x) int main(void) x
#define MAIN A(B)
MAIN
