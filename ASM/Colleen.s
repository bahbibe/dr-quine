; outside
global main
extern printf
main:
; inside
call print
xor eax, eax
ret
print:
lea rdi, [rel fmt]
mov esi, 10
mov edx, 34
lea rcx, [rel fmt]
xor eax, eax
call printf wrt ..plt
ret
fmt db "; outside%1$cglobal main%1$cextern printf%1$cmain:%1$c; inside%1$ccall print%1$cxor eax, eax%1$cret%1$cprint:%1$clea rdi, [rel fmt]%1$cmov esi, 10%1$cmov edx, 34%1$clea rcx, [rel fmt]%1$cxor eax, eax%1$ccall printf wrt ..plt%1$cret%1$cfmt db %2$c%3$s%2$c, 0", 0