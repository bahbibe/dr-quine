; a single comment
global main
extern fopen
extern fprintf
extern fclose
default rel
section .data
path db "Grace_kid.s",0
mode db "w",0
fmt db "; a single comment%1$cglobal main%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$cdefault rel%1$csection .data%1$cpath db %2$cGrace_kid.s%2$c,0%1$cmode db %2$cw%2$c,0%1$cfmt db %2$c%3$s%2$c,0%1$csection .text%1$c%%macro B 0%1$csub rsp, 8%1$clea rdi, [rel path]%1$clea rsi, [rel mode]%1$ccall fopen wrt ..plt%1$cmov r12, rax%1$ctest r12, r12%1$cjnz %%%%ok%1$cadd rsp, 8%1$cmov eax, 1%1$cret%1$c%%%%ok:%1$cmov rdi, r12%1$clea rsi, [rel fmt]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel fmt]%1$cxor eax, eax%1$ccall fprintf wrt ..plt%1$cmov rdi, r12%1$ccall fclose wrt ..plt%1$cadd rsp, 8%1$c%%endmacro%1$c%%define A(x) main: x%1$c%%define MAIN A(B)%1$cMAIN%1$cxor eax, eax%1$cret%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c",0
section .text
%macro B 0
sub rsp, 8
lea rdi, [rel path]
lea rsi, [rel mode]
call fopen wrt ..plt
mov r12, rax
test r12, r12
jnz %%ok
add rsp, 8
mov eax, 1
ret
%%ok:
mov rdi, r12
lea rsi, [rel fmt]
mov rdx, 10
mov rcx, 34
lea r8, [rel fmt]
xor eax, eax
call fprintf wrt ..plt
mov rdi, r12
call fclose wrt ..plt
add rsp, 8
%endmacro
%define A(x) main: x
%define MAIN A(B)
MAIN
xor eax, eax
ret
section .note.GNU-stack noalloc noexec nowrite progbits
