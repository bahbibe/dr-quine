global main
extern fopen
extern fprintf
extern fclose
extern sprintf
extern system
default rel
section .data
i dd 5 ; i = 5
sfmt db "Sully_%d.s",0
bfmt db "Sully_%d",0
mode db "w",0
cfmt db "nasm -f elf64 %1$s -o %2$s.o && gcc -o %2$s %2$s.o && rm %2$s.o",0
rfmt db "./%s",0
fmt db "global main%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$cextern sprintf%1$cextern system%1$cdefault rel%1$csection .data%1$ci dd %4$d ; i = %4$d%1$csfmt db %2$cSully_%%d.s%2$c,0%1$cbfmt db %2$cSully_%%d%2$c,0%1$cmode db %2$cw%2$c,0%1$ccfmt db %2$cnasm -f elf64 %%1$s -o %%2$s.o && gcc -o %%2$s %%2$s.o && rm %%2$s.o%2$c,0%1$crfmt db %2$c./%%s%2$c,0%1$cfmt db %2$c%3$s%2$c,0%1$csection .bss%1$cc resb 32%1$cb resb 32%1$ccmd resb 160%1$csection .text%1$cmain:%1$csub rsp, 8%1$cmov eax, [i]%1$cdec eax%1$cmov r12d, eax%1$clea rdi, [rel c]%1$clea rsi, [rel sfmt]%1$cmov edx, r12d%1$cxor eax, eax%1$ccall sprintf wrt ..plt%1$clea rdi, [rel b]%1$clea rsi, [rel bfmt]%1$cmov edx, r12d%1$cxor eax, eax%1$ccall sprintf wrt ..plt%1$clea rdi, [rel c]%1$clea rsi, [rel mode]%1$ccall fopen wrt ..plt%1$cmov r13, rax%1$ctest r13, r13%1$cjnz .ok%1$cadd rsp, 8%1$cmov eax, 1%1$cret%1$c.ok:%1$cmov rdi, r13%1$clea rsi, [rel fmt]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel fmt]%1$cmov r9d, r12d%1$cxor eax, eax%1$ccall fprintf wrt ..plt%1$cmov rdi, r13%1$ccall fclose wrt ..plt%1$clea rdi, [rel cmd]%1$clea rsi, [rel cfmt]%1$clea rdx, [rel c]%1$clea rcx, [rel b]%1$cxor eax, eax%1$ccall sprintf wrt ..plt%1$clea rdi, [rel cmd]%1$ccall system wrt ..plt%1$ccmp r12d, 0%1$cjl .skip%1$clea rdi, [rel cmd]%1$clea rsi, [rel rfmt]%1$clea rdx, [rel b]%1$cxor eax, eax%1$ccall sprintf wrt ..plt%1$clea rdi, [rel cmd]%1$ccall system wrt ..plt%1$c.skip:%1$cadd rsp, 8%1$cxor eax, eax%1$cret%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c",0
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
lea rdi, [rel c]
lea rsi, [rel sfmt]
mov edx, r12d
xor eax, eax
call sprintf wrt ..plt
lea rdi, [rel b]
lea rsi, [rel bfmt]
mov edx, r12d
xor eax, eax
call sprintf wrt ..plt
lea rdi, [rel c]
lea rsi, [rel mode]
call fopen wrt ..plt
mov r13, rax
test r13, r13
jnz .ok
add rsp, 8
mov eax, 1
ret
.ok:
mov rdi, r13
lea rsi, [rel fmt]
mov rdx, 10
mov rcx, 34
lea r8, [rel fmt]
mov r9d, r12d
xor eax, eax
call fprintf wrt ..plt
mov rdi, r13
call fclose wrt ..plt
lea rdi, [rel cmd]
lea rsi, [rel cfmt]
lea rdx, [rel c]
lea rcx, [rel b]
xor eax, eax
call sprintf wrt ..plt
lea rdi, [rel cmd]
call system wrt ..plt
cmp r12d, 0
jl .skip
lea rdi, [rel cmd]
lea rsi, [rel rfmt]
lea rdx, [rel b]
xor eax, eax
call sprintf wrt ..plt
lea rdi, [rel cmd]
call system wrt ..plt
.skip:
add rsp, 8
xor eax, eax
ret
section .note.GNU-stack noalloc noexec nowrite progbits
