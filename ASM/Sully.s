global main
extern fopen
extern fprintf
extern fclose
extern sprintf
extern system
section .data
i dd 5 ; i = 5
sfmt db "Sully_%d.s",0
bfmt db "Sully_%d",0
mode db "w",0
cfmt db "nasm -f elf64 %1$s -o %2$s.o && gcc -no-pie -z noexecstack -o %2$s %2$s.o && rm %2$s.o",0
rfmt db "./%s",0
fmt db "global main%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$cextern sprintf%1$cextern system%1$csection .data%1$ci dd %4$d ; i = %4$d%1$csfmt db %2$cSully_%%d.s%2$c,0%1$cbfmt db %2$cSully_%%d%2$c,0%1$cmode db %2$cw%2$c,0%1$ccfmt db %2$cnasm -f elf64 %%1$s -o %%2$s.o && gcc -no-pie -z noexecstack -o %%2$s %%2$s.o && rm %%2$s.o%2$c,0%1$crfmt db %2$c./%%s%2$c,0%1$cfmt db %2$c%3$s%2$c,0%1$csection .bss%1$cc resb 32%1$cb resb 32%1$ccmd resb 160%1$csection .text%1$cmain:%1$csub rsp, 8%1$cmov eax, [i]%1$cdec eax%1$cmov r12d, eax%1$cmov rdi, c%1$cmov rsi, sfmt%1$cmov edx, r12d%1$cxor eax, eax%1$ccall sprintf%1$cmov rdi, b%1$cmov rsi, bfmt%1$cmov edx, r12d%1$cxor eax, eax%1$ccall sprintf%1$cmov rdi, c%1$cmov rsi, mode%1$ccall fopen%1$cmov r13, rax%1$cmov rdi, r13%1$cmov rsi, fmt%1$cmov rdx, 10%1$cmov rcx, 34%1$cmov r8, fmt%1$cmov r9d, r12d%1$cxor eax, eax%1$ccall fprintf%1$cmov rdi, r13%1$ccall fclose%1$cmov rdi, cmd%1$cmov rsi, cfmt%1$cmov rdx, c%1$cmov rcx, b%1$cxor eax, eax%1$ccall sprintf%1$cmov rdi, cmd%1$ccall system%1$ccmp r12d, 0%1$cjl .skip%1$cmov rdi, cmd%1$cmov rsi, rfmt%1$cmov rdx, b%1$cxor eax, eax%1$ccall sprintf%1$cmov rdi, cmd%1$ccall system%1$c.skip:%1$cadd rsp, 8%1$cxor eax, eax%1$cret%1$csection .note.GNU-stack,%2$c%2$c,@progbits%1$c",0
section .bss
c resb 32
b resb 32
cmd resb 160
section .text
main:
sub rsp, 8
mov eax, [i]
dec eax
mov r12d, eax
mov rdi, c
mov rsi, sfmt
mov edx, r12d
xor eax, eax
call sprintf
mov rdi, b
mov rsi, bfmt
mov edx, r12d
xor eax, eax
call sprintf
mov rdi, c
mov rsi, mode
call fopen
mov r13, rax
mov rdi, r13
mov rsi, fmt
mov rdx, 10
mov rcx, 34
mov r8, fmt
mov r9d, r12d
xor eax, eax
call fprintf
mov rdi, r13
call fclose
mov rdi, cmd
mov rsi, cfmt
mov rdx, c
mov rcx, b
xor eax, eax
call sprintf
mov rdi, cmd
call system
cmp r12d, 0
jl .skip
mov rdi, cmd
mov rsi, rfmt
mov rdx, b
xor eax, eax
call sprintf
mov rdi, cmd
call system
.skip:
add rsp, 8
xor eax, eax
ret
section .note.GNU-stack,"",@progbits
