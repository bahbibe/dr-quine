#include <stdio.h>

char *s = "#include <stdio.h>%c%cchar *s = %c%s%c;%c%cvoid%ccalled(void)%c{%c%c/* a called function that writes nothing to stdout */%c}%c%c/* This comment is outside main. */%cint%cmain(void)%c{%c%c/* This comment is inside main. */%c%ccalled();%c%cprintf(s, 10, 10, 34, s, 34, 10, 10, 9, 10, 10, 9, 10, 10, 10, 10, 9, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10);%c%creturn (0);%c}%c";

void	called(void)
{
	/* a called function that writes nothing to stdout */
}

/* This comment is outside main. */
int	main(void)
{
	/* This comment is inside main. */
	called();
	printf(s, 10, 10, 34, s, 34, 10, 10, 9, 10, 10, 9, 10, 10, 10, 10, 9, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10);
	return (0);
}
