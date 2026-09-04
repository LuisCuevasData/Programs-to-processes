	.file	"mini.c"
	.intel_syntax noprefix
	.text
	.globl	sort
	.type	sort, @function
sort:
	cmp	rdi, 3
	mov	edx, 11
	mov	eax, 17
	cmovg	rax, rdx
	ret
	.size	sort, .-sort
	.globl	branch
	.type	branch, @function
branch:
	mov	eax, 1
	cmp	rdi, rsi
	jg	.L4
	cmp	rdi, 3
	jle	.L7
	cmp	rsi, 3
	jle	.L7
	mov	eax, 12
	ret
.L7:
	mov	eax, 33
.L4:
	ret
	.size	branch, .-branch
	.globl	loop
	.type	loop, @function
loop:
	xor	eax, eax
.L16:
	test	edi, edi
	jle	.L15
	test	esi, esi
	jle	.L15
	mov	edx, edi
	dec	edi
	imul	edx, esi
	dec	esi
	add	eax, edx
	jmp	.L16
.L15:
	ret
	.size	loop, .-loop
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
