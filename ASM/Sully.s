global main
extern sprintf, fopen, fprintf, fclose, system
section .data
i dd 5
buf times 256 db 0
section .text
main:
push rbx
cmp byte [rel me_end-3], 'y'
je keep
dec dword [rel i]
keep:
xor eax, eax
cmp dword [rel i], 0
jl done
lea rdi, [rel buf]
lea rsi, [rel name]
mov edx, [rel i]
xor eax, eax
call sprintf wrt ..plt
lea rdi, [rel buf]
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
mov r9d, [rel i]
xor eax, eax
call fprintf wrt ..plt
mov rdi, rbx
call fclose wrt ..plt
lea rdi, [rel buf]
lea rsi, [rel cmd]
mov edx, [rel i]
xor eax, eax
call sprintf wrt ..plt
lea rdi, [rel buf]
call system wrt ..plt
xor eax, eax
done:
pop rbx
ret
me db __FILE__
me_end db 0
name db "Sully_%d.s", 0
mode db "w", 0
cmd db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && gcc Sully_%1$d.o -o Sully_%1$d && rm Sully_%1$d.o && ./Sully_%1$d", 0
fmt db "global main%1$cextern sprintf, fopen, fprintf, fclose, system%1$csection .data%1$ci dd %4$d%1$cbuf times 256 db 0%1$csection .text%1$cmain:%1$cpush rbx%1$ccmp byte [rel me_end-3], 'y'%1$cje keep%1$cdec dword [rel i]%1$ckeep:%1$cxor eax, eax%1$ccmp dword [rel i], 0%1$cjl done%1$clea rdi, [rel buf]%1$clea rsi, [rel name]%1$cmov edx, [rel i]%1$cxor eax, eax%1$ccall sprintf wrt ..plt%1$clea rdi, [rel buf]%1$clea rsi, [rel mode]%1$ccall fopen wrt ..plt%1$cmov rbx, rax%1$cmov eax, 1%1$ctest rbx, rbx%1$cjz done%1$cmov rdi, rbx%1$clea rsi, [rel fmt]%1$cmov edx, 10%1$cmov ecx, 34%1$clea r8, [rel fmt]%1$cmov r9d, [rel i]%1$cxor eax, eax%1$ccall fprintf wrt ..plt%1$cmov rdi, rbx%1$ccall fclose wrt ..plt%1$clea rdi, [rel buf]%1$clea rsi, [rel cmd]%1$cmov edx, [rel i]%1$cxor eax, eax%1$ccall sprintf wrt ..plt%1$clea rdi, [rel buf]%1$ccall system wrt ..plt%1$cxor eax, eax%1$cdone:%1$cpop rbx%1$cret%1$cme db __FILE__%1$cme_end db 0%1$cname db %2$cSully_%%d.s%2$c, 0%1$cmode db %2$cw%2$c, 0%1$ccmd db %2$cnasm -f elf64 Sully_%%1$d.s -o Sully_%%1$d.o && gcc Sully_%%1$d.o -o Sully_%%1$d && rm Sully_%%1$d.o && ./Sully_%%1$d%2$c, 0%1$cfmt db %2$c%3$s%2$c, 0%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c", 0
section .note.GNU-stack noalloc noexec nowrite progbits
