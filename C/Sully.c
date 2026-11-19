#include <stdio.h>
#include <stdlib.h>
int i = 5;
int main() {
char *s = "#include <stdio.h>%1$c#include <stdlib.h>%1$cint i = %4$d;%1$cint main() {%1$cchar *s = %2$c%3$s%2$c;%1$cchar b[256];%1$cif (__FILE__[sizeof(__FILE__) - 4] != 'y') i--;%1$cif (i < 0) return 0;%1$csprintf(b, %2$cSully_%%d.c%2$c, i);%1$cFILE *f = fopen(b, %2$cw%2$c);%1$cif (!f) return 1;%1$cfprintf(f, s, 10, 34, s, i);%1$cfclose(f);%1$csprintf(b, %2$cgcc -Wall -Wextra -Werror Sully_%%1$d.c -o Sully_%%1$d && ./Sully_%%1$d%2$c, i);%1$csystem(b);%1$c}%1$c";
char b[256];
if (__FILE__[sizeof(__FILE__) - 4] != 'y') i--;
if (i < 0) return 0;
sprintf(b, "Sully_%d.c", i);
FILE *f = fopen(b, "w");
if (!f) return 1;
fprintf(f, s, 10, 34, s, i);
fclose(f);
sprintf(b, "gcc -Wall -Wextra -Werror Sully_%1$d.c -o Sully_%1$d && ./Sully_%1$d", i);
system(b);
}
