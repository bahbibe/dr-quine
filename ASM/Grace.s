; a single comment
global main
extern fopen
extern fprintf
extern fclose
section .data
path db "Grace_kid.s",0
mode db "w",0
fmt db "; a single comment%1$cglobal main%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$csection .data%1$cpath db %2$cGrace_kid.s%2$c,0%1$cmode db %2$cw%2$c,0%1$cfmt db %2$c%3$s%2$c,0%1$csection .text%1$c%%macro B 0%1$csub rsp, 8%1$cmov rdi, path%1$cmov rsi, mode%1$ccall fopen%1$cmov r12, rax%1$ctest r12, r12%1$cjnz %%%%ok%1$cadd rsp, 8%1$cmov eax, 1%1$cret%1$c%%%%ok:%1$cmov rdi, r12%1$cmov rsi, fmt%1$cmov rdx, 10%1$cmov rcx, 34%1$cmov r8, fmt%1$cxor eax, eax%1$ccall fprintf%1$cmov rdi, r12%1$ccall fclose%1$cadd rsp, 8%1$c%%endmacro%1$c%%define A(x) main: x%1$c%%define MAIN A(B)%1$cMAIN%1$cxor eax, eax%1$cret%1$csection .note.GNU-stack,%2$c%2$c,@progbits%1$c",0
section .text
%macro B 0
sub rsp, 8
mov rdi, path
mov rsi, mode
call fopen
mov r12, rax
test r12, r12
jnz %%ok
add rsp, 8
mov eax, 1
ret
%%ok:
mov rdi, r12
mov rsi, fmt
mov rdx, 10
mov rcx, 34
mov r8, fmt
xor eax, eax
call fprintf
mov rdi, r12
call fclose
add rsp, 8
%endmacro
%define A(x) main: x
%define MAIN A(B)
MAIN
xor eax, eax
ret
section .note.GNU-stack,"",@progbits
