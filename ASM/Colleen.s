; Out
global main
extern printf
section .data
fmt db "; Out%cglobal main%cextern printf%csection .data%cfmt db %c%s%c,0%ctab dq fmt, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, 34, 10%ctcount equ ($ - tab)/8%csection .text%cmain:%c; In%ccall print%cxor eax, eax%cret%cprint:%cmov rdi, fmt%cmov rsi, 10%cmov rdx, 10%cmov rcx, 10%cmov r8, 10%cmov r9, 34%clea r10, [tab + 8*(tcount-1)]%cmov r11, tcount%c.loop:%cpush qword [r10]%csub r10, 8%cdec r11%cjnz .loop%cxor eax, eax%ccall printf%cadd rsp, 264%cxor eax, eax%cret%csection .note.GNU-stack,%c%c,@progbits%c",0
tab dq fmt, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, 34, 10
tcount equ ($ - tab)/8
section .text
main:
; In
call print
xor eax, eax
ret
print:
mov rdi, fmt
mov rsi, 10
mov rdx, 10
mov rcx, 10
mov r8, 10
mov r9, 34
lea r10, [tab + 8*(tcount-1)]
mov r11, tcount
.loop:
push qword [r10]
sub r10, 8
dec r11
jnz .loop
xor eax, eax
call printf
add rsp, 264
xor eax, eax
ret
section .note.GNU-stack,"",@progbits
