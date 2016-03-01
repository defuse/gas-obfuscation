	.file	"diamond.c"
	.section	.rodata
.LC0:
	.string	"Enter number of rows"
.LC1:
	.string	"%d"
	.text
.globl main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$1, -4(%rbp)
	movl	$.LC0, %edi
	call	puts
	movl	$.LC1, %eax
	leaq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	-16(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L2
.L7:
	movl	$1, -12(%rbp)
	jmp	.L3
.L4:
	movl	$32, %edi
	call	putchar
	addl	$1, -12(%rbp)
.L3:
	movl	-12(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jle	.L4
	subl	$1, -4(%rbp)
	movl	$1, -12(%rbp)
	jmp	.L5
.L6:
	movl	$42, %edi
	call	putchar
	addl	$1, -12(%rbp)
.L5:
	movl	-8(%rbp), %eax
	addl	%eax, %eax
	subl	$1, %eax
	cmpl	-12(%rbp), %eax
	jge	.L6
	movl	$10, %edi
	call	putchar
	addl	$1, -8(%rbp)
.L2:
	movl	-16(%rbp), %eax
	cmpl	%eax, -8(%rbp)
	jle	.L7
	movl	$1, -4(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L8
.L13:
	movl	$1, -12(%rbp)
	jmp	.L9
.L10:
	movl	$32, %edi
	call	putchar
	addl	$1, -12(%rbp)
.L9:
	movl	-12(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jle	.L10
	addl	$1, -4(%rbp)
	movl	$1, -12(%rbp)
	jmp	.L11
.L12:
	movl	$42, %edi
	call	putchar
	addl	$1, -12(%rbp)
.L11:
	movl	-16(%rbp), %eax
	subl	-8(%rbp), %eax
	addl	%eax, %eax
	subl	$1, %eax
	cmpl	-12(%rbp), %eax
	jge	.L12
	movl	$10, %edi
	call	putchar
	addl	$1, -8(%rbp)
.L8:
	movl	-16(%rbp), %eax
	subl	$1, %eax
	cmpl	-8(%rbp), %eax
	jge	.L13
	movl	$0, %eax
	leave
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
