	.section	__TEXT,__text,regular,pure_instructions
	.globl	_foo
	.align	4, 0x90
_foo:
Leh_func_begin1:
	pushq	%rbp
Ltmp0:
	movq	%rsp, %rbp
Ltmp1:
	movl	%edi, -4(%rbp)
	movabsq	$1, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	%xmm0, -32(%rbp)
	movabsq	$2, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	%xmm0, -40(%rbp)
	movabsq	$3, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	%xmm0, -48(%rbp)
	movabsq	$4, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	%xmm0, -56(%rbp)
	movq	$0, -24(%rbp)
	jmp	LBB1_2
LBB1_1:
	movl	-4(%rbp), %eax
	movl	-4(%rbp), %ecx
	imull	%ecx, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addl	$3, %eax
	movl	%eax, -4(%rbp)
	movsd	-32(%rbp), %xmm0
	movsd	-56(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-48(%rbp), %xmm0
	movsd	-32(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	-48(%rbp), %xmm0
	movsd	-40(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	-48(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movsd	%xmm1, -48(%rbp)
	movsd	-40(%rbp), %xmm0
	movsd	-32(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	-56(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	movsd	-40(%rbp), %xmm2
	addsd	%xmm2, %xmm1
	movsd	-48(%rbp), %xmm2
	addsd	%xmm2, %xmm1
	movsd	-56(%rbp), %xmm2
	addsd	%xmm2, %xmm1
	mulsd	%xmm1, %xmm0
	movsd	-48(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	-40(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movq	-24(%rbp), %rax
	movabsq	$1, %rcx
	addq	%rcx, %rax
	movq	%rax, -24(%rbp)
LBB1_2:
	movq	-24(%rbp), %rax
	cmpq	$999999999, %rax
	jle	LBB1_1
	movl	-4(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	popq	%rbp
	ret
Leh_func_end1:

	.globl	_main
	.align	4, 0x90
_main:
Leh_func_begin2:
	pushq	%rbp
Ltmp2:
	movq	%rsp, %rbp
Ltmp3:
	subq	$32, %rsp
Ltmp4:
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$2347823, -24(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	callq	_foo
	movl	%eax, %ecx
	movl	%ecx, -24(%rbp)
	movl	-24(%rbp), %ecx
	xorb	%dl, %dl
	leaq	L_.str(%rip), %rdi
	movl	%ecx, %esi
	movb	%dl, %al
	callq	_printf
	movl	-24(%rbp), %ecx
	addl	$4, %ecx
	movl	%ecx, -24(%rbp)
	movl	-24(%rbp), %ecx
	xorb	%dl, %dl
	leaq	L_.str1(%rip), %rdi
	movl	%ecx, %esi
	movb	%dl, %al
	callq	_printf
	movl	-20(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	ret
Leh_func_end2:

	.section	__TEXT,__cstring,cstring_literals
L_.str:
	.asciz	 "Hello, world! %d\n"

L_.str1:
	.asciz	 "z = %d\n"

	.section	__TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame0:
Lsection_eh_frame:
Leh_frame_common:
Lset0 = Leh_frame_common_end-Leh_frame_common_begin
	.long	Lset0
Leh_frame_common_begin:
	.long	0
	.byte	1
	.asciz	 "zR"
	.byte	1
	.byte	120
	.byte	16
	.byte	1
	.byte	16
	.byte	12
	.byte	7
	.byte	8
	.byte	144
	.byte	1
	.align	3
Leh_frame_common_end:
	.globl	_foo.eh
_foo.eh:
Lset1 = Leh_frame_end1-Leh_frame_begin1
	.long	Lset1
Leh_frame_begin1:
Lset2 = Leh_frame_begin1-Leh_frame_common
	.long	Lset2
Ltmp5:
	.quad	Leh_func_begin1-Ltmp5
Lset3 = Leh_func_end1-Leh_func_begin1
	.quad	Lset3
	.byte	0
	.byte	4
Lset4 = Ltmp0-Leh_func_begin1
	.long	Lset4
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset5 = Ltmp1-Ltmp0
	.long	Lset5
	.byte	13
	.byte	6
	.align	3
Leh_frame_end1:

	.globl	_main.eh
_main.eh:
Lset6 = Leh_frame_end2-Leh_frame_begin2
	.long	Lset6
Leh_frame_begin2:
Lset7 = Leh_frame_begin2-Leh_frame_common
	.long	Lset7
Ltmp6:
	.quad	Leh_func_begin2-Ltmp6
Lset8 = Leh_func_end2-Leh_func_begin2
	.quad	Lset8
	.byte	0
	.byte	4
Lset9 = Ltmp2-Leh_func_begin2
	.long	Lset9
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset10 = Ltmp3-Ltmp2
	.long	Lset10
	.byte	13
	.byte	6
	.align	3
Leh_frame_end2:


.subsections_via_symbols
