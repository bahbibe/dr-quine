; Out
global main
extern printf
section .data
fmt db "; Out%1$cglobal main%1$cextern printf%1$csection .data%1$cfmt db %2$c%3$s%2$c,0%1$csection .text%1$cmain:%1$c; In%1$ccall print%1$cxor eax, eax%1$cret%1$cprint:%1$cmov rdi, fmt%1$cmov rsi, 10%1$cmov rdx, 34%1$cmov rcx, fmt%1$cxor eax, eax%1$ccall printf%1$cret%1$csection .note.GNU-stack,%2$c%2$c,@progbits%1$c",0
section .text
main:
; In
call print
xor eax, eax
ret
print:
mov rdi, fmt
mov rsi, 10
mov rdx, 34
mov rcx, fmt
xor eax, eax
call printf
ret
section .note.GNU-stack,"",@progbits
