#include <stdio.h>
/* Grace */
#define S "#include <stdio.h>%1$c/* Grace */%1$c#define S %2$c%3$s%2$c%1$c#define F fopen(%2$cGrace_kid.c%2$c, %2$cw%2$c)%1$c#define MAIN int main() { FILE *f = F; if (!f) return 1; fprintf(f, S, 10, 34, S); fclose(f); }%1$cMAIN%1$c"
#define F fopen("Grace_kid.c", "w")
#define MAIN int main() { FILE *f = F; if (!f) return 1; fprintf(f, S, 10, 34, S); fclose(f); }
MAIN
