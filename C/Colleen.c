// It's a quine.
#include <stdio.h>
char *s="// It's a quine.%c#include <stdio.h>%cchar *s=%c%s%c;%cvoid foo(){%cprintf(s,10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10, 10);%c}%cint main(){%c// in%cfoo();%c}%c";
void foo(){
printf(s,10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10, 10);
}
int main(){
// in
foo();
}
