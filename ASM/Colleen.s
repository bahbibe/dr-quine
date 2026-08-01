global main
extern printf
section .data
fmt db "global main%cextern printf%csection .data%cfmt db %c%s%c,0%ctab dq 34, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10, 9, 10, 9, 10, 10, 10, 34, 34, 10%ctcount equ ($ - tab)/8%csection .text%cmain:%c%c; comment inside the entry point routine%c%ccall helper%c%cmov rdi, fmt%c%cmov rsi, 10%c%cmov rdx, 10%c%cmov rcx, 10%c%cmov r8, 34%c%cmov r9, fmt%c%clea r10, [tab + 8*(tcount-1)]%c%cmov r11, tcount%cpush qword 0%c.loop:%c%cpush qword [r10]%c%csub r10, 8%c%cdec r11%c%cjnz .loop%c%cxor eax, eax%c%ccall printf%c%cadd rsp, 456%c%cxor eax, eax%c%cret%chelper:%c%c; comment in the helper routine%c%cret%c; comment outside the entry point routine%c%csection .note.GNU-stack,%c%c,@progbits%c",0
tab dq 34, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10, 9, 10, 9, 10, 10, 10, 34, 34, 10
tcount equ ($ - tab)/8
section .text
main:
	; comment inside the entry point routine
	call helper
	mov rdi, fmt
	mov rsi, 10
	mov rdx, 10
	mov rcx, 10
	mov r8, 34
	mov r9, fmt
	lea r10, [tab + 8*(tcount-1)]
	mov r11, tcount
push qword 0
.loop:
	push qword [r10]
	sub r10, 8
	dec r11
	jnz .loop
	xor eax, eax
	call printf
	add rsp, 456
	xor eax, eax
	ret
helper:
	; comment in the helper routine
	ret
; comment outside the entry point routine

section .note.GNU-stack,"",@progbits
