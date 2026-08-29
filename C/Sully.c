#include <stdio.h>
#include <stdlib.h>

int i = 5;

char *s = "#include <stdio.h>%c#include <stdlib.h>%c%cint i = %d;%c%cchar *s = %c%s%c;%c%cint main(void)%c{%c    int n = i - 1;%c    char c[64], b[64], cmd[160];%c    FILE *f;%c%c    sprintf(c, %cSully_%%d.c%c, n);%c    sprintf(b, %cSully_%%d%c, n);%c    f = fopen(c, %cw%c);%c    if (!f) return 1;%c    fprintf(f, s, 10, 10, 10, n, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10, 10, 34, 34, 10, 34, 34, 10, 34, 34, 10, 10, 10, 10, 34, 34, 10, 10, 10, 34, 34, 10, 10, 10, 10, 10);%c    fclose(f);%c    sprintf(cmd, %cgcc -Wall -Wextra -Werror %%s -o %%s%c, c, b);%c    system(cmd);%c    if (n >= 0) {%c        sprintf(cmd, %c./%%s%c, b);%c        system(cmd);%c    }%c    return 0;%c}%c";

int main(void)
{
    int n = i - 1;
    char c[64], b[64], cmd[160];
    FILE *f;

    sprintf(c, "Sully_%d.c", n);
    sprintf(b, "Sully_%d", n);
    f = fopen(c, "w");
    if (!f) return 1;
    fprintf(f, s, 10, 10, 10, n, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10, 10, 34, 34, 10, 34, 34, 10, 34, 34, 10, 10, 10, 10, 34, 34, 10, 10, 10, 34, 34, 10, 10, 10, 10, 10);
    fclose(f);
    sprintf(cmd, "gcc -Wall -Wextra -Werror %s -o %s", c, b);
    system(cmd);
    if (n >= 0) {
        sprintf(cmd, "./%s", b);
        system(cmd);
    }
    return 0;
}
