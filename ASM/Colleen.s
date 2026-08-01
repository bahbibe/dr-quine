; It's a quine.
global main
extern printf
section .data
fmt db "; It's a quine.%cglobal main%cextern printf%csection .data%cfmt db %c%s%c,0%ctab dq fmt, 34, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 34, 34, 10%ctcount equ ($ - tab)/8%csection .text%cmain:%c%c; inside main%c%ccall helper%c%cxor eax, eax%c%cret%chelper:%c%cmov rdi, fmt%c%cmov rsi, 10%c%cmov rdx, 10%c%cmov rcx, 10%c%cmov r8, 10%c%cmov r9, 34%c%clea r10, [tab + 8*(tcount-1)]%c%cmov r11, tcount%c%c.loop:%c%cpush qword [r10]%c%csub r10, 8%c%cdec r11%c%cjnz .loop%c%cxor eax, eax%c%ccall printf%c%cadd rsp, 440%c%cxor eax, eax%c%cret%csection .note.GNU-stack,%c%c,@progbits%c",0
tab dq fmt, 34, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 34, 34, 10
tcount equ ($ - tab)/8
section .text
main:
	; inside main
	call helper
	xor eax, eax
	ret
helper:
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
	add rsp, 440
	xor eax, eax
	ret
section .note.GNU-stack,"",@progbits
