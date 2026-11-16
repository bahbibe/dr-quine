; Out
global main
extern printf
default rel
section .data
fmt db "; Out%1$cglobal main%1$cextern printf%1$cdefault rel%1$csection .data%1$cfmt db %2$c%3$s%2$c,0%1$csection .text%1$cmain:%1$c; In%1$ccall print%1$cxor eax, eax%1$cret%1$cprint:%1$clea rdi, [rel fmt]%1$cmov rsi, 10%1$cmov rdx, 34%1$clea rcx, [rel fmt]%1$cxor eax, eax%1$ccall printf wrt ..plt%1$cret%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c",0
section .text
main:
; In
call print
xor eax, eax
ret
print:
lea rdi, [rel fmt]
mov rsi, 10
mov rdx, 34
lea rcx, [rel fmt]
xor eax, eax
call printf wrt ..plt
ret
section .note.GNU-stack noalloc noexec nowrite progbits
