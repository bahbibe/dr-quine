; Grace
global main
extern fopen, fprintf, fclose
%define S "; Grace%1$cglobal main%1$cextern fopen, fprintf, fclose%1$c%%define S %2$c%3$s%2$c%1$c%%define F %2$cGrace_kid.s%2$c%1$c%%macro MAIN 0%1$cmain:%1$cpush rbx%1$clea rdi, [rel file]%1$clea rsi, [rel mode]%1$ccall fopen wrt ..plt%1$cmov rbx, rax%1$cmov eax, 1%1$ctest rbx, rbx%1$cjz done%1$cmov rdi, rbx%1$clea rsi, [rel fmt]%1$cmov edx, 10%1$cmov ecx, 34%1$clea r8, [rel fmt]%1$cxor eax, eax%1$ccall fprintf wrt ..plt%1$cmov rdi, rbx%1$ccall fclose wrt ..plt%1$cxor eax, eax%1$cdone:%1$cpop rbx%1$cret%1$c%%endmacro%1$cMAIN%1$cfmt db S, 0%1$cfile db F, 0%1$cmode db %2$cw%2$c, 0%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c"
%define F "Grace_kid.s"
%macro MAIN 0
main:
push rbx
lea rdi, [rel file]
lea rsi, [rel mode]
call fopen wrt ..plt
mov rbx, rax
mov eax, 1
test rbx, rbx
jz done
mov rdi, rbx
lea rsi, [rel fmt]
mov edx, 10
mov ecx, 34
lea r8, [rel fmt]
xor eax, eax
call fprintf wrt ..plt
mov rdi, rbx
call fclose wrt ..plt
xor eax, eax
done:
pop rbx
ret
%endmacro
MAIN
fmt db S, 0
file db F, 0
mode db "w", 0
section .note.GNU-stack noalloc noexec nowrite progbits
