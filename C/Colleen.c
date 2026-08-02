/*Out*/
#include <stdio.h>
char *s="/*Out*/%c#include <stdio.h>%cchar *s=%c%s%c;%cvoid print(){printf(s,10, 10, 34, s, 34, 10, 10);}%cint main(){/*In*/print();}";
void print(){printf(s,10, 10, 34, s, 34, 10, 10);}
int main(){/*In*/print();}