	.file	"test.c"
	.text
.globl foo
	.type	foo, @function
foo:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movl	%edi, -52(%rbp)
	movabsq	$4607182418800017408, %rax
	movq	%rax, -32(%rbp)
	movabsq	$4611686018427387904, %rax
	movq	%rax, -24(%rbp)
	movabsq	$4613937818241073152, %rax
	movq	%rax, -16(%rbp)
	movabsq	$4616189618054758400, %rax
	movq	%rax, -8(%rbp)
	movq	$0, -40(%rbp)
	jmp	.L2
.L3:
	movl	-52(%rbp), %eax
	imull	-52(%rbp), %eax
	movl	%eax, -52(%rbp)
	addl	$3, -52(%rbp)
	movsd	-32(%rbp), %xmm0
	divsd	-8(%rbp), %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-16(%rbp), %xmm0
	mulsd	-32(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	mulsd	-24(%rbp), %xmm0
	movsd	-16(%rbp), %xmm1
	movapd	%xmm1, %xmm2
	divsd	%xmm0, %xmm2
	movapd	%xmm2, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-24(%rbp), %xmm0
	mulsd	-32(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	divsd	-8(%rbp), %xmm1
	movsd	-32(%rbp), %xmm0
	addsd	-24(%rbp), %xmm0
	addsd	-16(%rbp), %xmm0
	addsd	-8(%rbp), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	-16(%rbp), %xmm0
	movsd	-24(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	addq	$1, -40(%rbp)
.L2:
	cmpq	$999999999, -40(%rbp)
	jle	.L3
	movl	-52(%rbp), %eax
	leave
	ret
	.cfi_endproc
.LFE0:
	.size	foo, .-foo
	.section	.rodata
.LC4:
	.string	"Hello, world! %d\n"
.LC5:
	.string	"z = %d\n"
	.text
.globl main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$2347823, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	foo
	movl	%eax, -4(%rbp)
	movl	$.LC4, %eax
	movl	-4(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	addl	$4, -4(%rbp)
	movl	$.LC5, %eax
	movl	-4(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	leave
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
