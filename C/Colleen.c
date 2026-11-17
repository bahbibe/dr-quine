/* outside */
#include <stdio.h>
char *s = "/* outside */%1$c#include <stdio.h>%1$cchar *s = %2$c%3$s%2$c;%1$cvoid p() { printf(s, 10, 34, s); }%1$cint main() { /* inside */ p(); }%1$c";
void p() { printf(s, 10, 34, s); }
int main() { /* inside */ p(); }
