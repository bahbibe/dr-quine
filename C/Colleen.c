// It's a quine.
#include <stdio.h>

char *s = "// It's a quine.%c#include <stdio.h>%c%cchar *s = %c%s%c;%c%cvoid%ccalled(void)%c{%c%cprintf(s, 10, 10, 10, 34, s, 34, 10, 10, 9, 10, 10, 9, 10, 10, 10, 9, 10, 10, 9, 10, 9, 10, 9, 10, 10);%c}%c%cint%cmain(void)%c{%c%c// inside main%c%ccalled();%c%creturn (0);%c}%c";

void	called(void)
{
	printf(s, 10, 10, 10, 34, s, 34, 10, 10, 9, 10, 10, 9, 10, 10, 10, 9, 10, 10, 9, 10, 9, 10, 9, 10, 10);
}

int	main(void)
{
	// inside main
	called();
	return (0);
}
