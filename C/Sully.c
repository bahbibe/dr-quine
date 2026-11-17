#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int i = 5;
int main() {
char *s = "#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$cint i = %4$d;%1$cint main() {%1$cchar *s = %2$c%3$s%2$c;%1$cchar b[128];%1$cif (strcmp(__FILE__, %2$cSully.c%2$c)) i--;%1$cif (i < 0) return 0;%1$csprintf(b, %2$cSully_%%d.c%2$c, i);%1$cFILE *f = fopen(b, %2$cw%2$c);%1$cif (!f) return 1;%1$cfprintf(f, s, 10, 34, s, i);%1$cfclose(f);%1$csprintf(b, %2$cgcc -Wall -Wextra -Werror Sully_%%1$d.c -o Sully_%%1$d && ./Sully_%%1$d%2$c, i);%1$csystem(b);%1$c}%1$c";
char b[128];
if (strcmp(__FILE__, "Sully.c")) i--;
if (i < 0) return 0;
sprintf(b, "Sully_%d.c", i);
FILE *f = fopen(b, "w");
if (!f) return 1;
fprintf(f, s, 10, 34, s, i);
fclose(f);
sprintf(b, "gcc -Wall -Wextra -Werror Sully_%1$d.c -o Sully_%1$d && ./Sully_%1$d", i);
system(b);
}
