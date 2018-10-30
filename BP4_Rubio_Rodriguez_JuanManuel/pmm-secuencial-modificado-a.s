	.file	"pmm-secuencial-modificado-a.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Falta tama\303\261o de matriz y vector"
	.align 8
.LC3:
	.string	"\nTiempo(seg.):%11.9f\t / Tama\303\261o:%u\t/ M3[0]=%8.6f M3[%d]=%8.6f\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	" M3[%d][%d]=%5.2f\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB5:
	.section	.text.startup,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L34
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	%eax, %r14d
	movq	%rax, %r15
	movq	%rax, 8(%rsp)
	salq	$3, %r14
	movl	%eax, %ebx
	movq	%r14, %rdi
	call	malloc
	movq	%r14, %rdi
	movq	%rax, (%rsp)
	call	malloc
	movq	%r14, %rdi
	movq	%rax, %r12
	call	malloc
	testl	%r15d, %r15d
	movq	%rax, %rbp
	je	.L3
	leal	-1(%r15), %eax
	movl	%ebx, 28(%rsp)
	movq	(%rsp), %rbx
	xorl	%r13d, %r13d
	leaq	8(,%rax,8), %r15
	movl	%eax, 16(%rsp)
.L4:
	movq	%r14, %rdi
	call	malloc
	movq	%r14, %rdi
	movq	%rax, (%rbx,%r13)
	call	malloc
	movq	%r14, %rdi
	movq	%rax, (%r12,%r13)
	call	malloc
	movq	%rax, 0(%rbp,%r13)
	addq	$8, %r13
	cmpq	%r13, %r15
	jne	.L4
	movl	28(%rsp), %ebx
	movq	(%rsp), %r8
	xorl	%edi, %edi
.L7:
	pxor	%xmm0, %xmm0
	movq	(%r8,%rdi,8), %rsi
	movq	(%r12,%rdi,8), %rcx
	movq	0(%rbp,%rdi,8), %rdx
	xorl	%eax, %eax
	cvtsi2sd	%edi, %xmm0
	.p2align 4,,10
	.p2align 3
.L6:
	movsd	%xmm0, (%rsi,%rax,8)
	movq	$0, (%rdx,%rax,8)
	movsd	%xmm0, (%rcx,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ebx
	ja	.L6
	addq	$1, %rdi
	cmpl	%edi, %ebx
	ja	.L7
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	xorl	%r15d, %r15d
	call	clock_gettime
	pxor	%xmm6, %xmm6
	movq	(%rsp), %r13
.L9:
	movq	0(%r13,%r15,8), %r9
	movq	0(%rbp,%r15,8), %r10
	xorl	%ecx, %ecx
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L13:
	leaq	8(%rcx), %r8
	leaq	16(%rcx), %rdi
	leaq	24(%rcx), %rsi
	movapd	%xmm6, %xmm4
	xorl	%eax, %eax
	movapd	%xmm6, %xmm3
	movapd	%xmm6, %xmm2
	movapd	%xmm6, %xmm1
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%r12,%rax,8), %rdx
	movsd	(%r9,%rax,8), %xmm0
	addq	$1, %rax
	cmpl	%eax, %ebx
	movsd	(%rdx,%rcx), %xmm5
	mulsd	%xmm0, %xmm5
	addsd	%xmm5, %xmm1
	movsd	(%rdx,%r8), %xmm5
	mulsd	%xmm0, %xmm5
	addsd	%xmm5, %xmm2
	movsd	(%rdx,%rdi), %xmm5
	mulsd	%xmm0, %xmm5
	mulsd	(%rdx,%rsi), %xmm0
	addsd	%xmm5, %xmm3
	addsd	%xmm0, %xmm4
	ja	.L10
	addl	$4, %r11d
	movsd	%xmm1, (%r10,%rcx)
	movsd	%xmm2, 8(%r10,%rcx)
	movsd	%xmm3, 16(%r10,%rcx)
	movsd	%xmm4, 24(%r10,%rcx)
	addq	$32, %rcx
	cmpl	%r11d, %ebx
	ja	.L13
	addq	$1, %r15
	cmpl	%r15d, %ebx
	ja	.L9
.L12:
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	16(%rsp), %edi
	pxor	%xmm0, %xmm0
	movq	0(%rbp), %rdx
	movq	8(%rsp), %rbx
	movl	%edi, %eax
	movq	0(%rbp,%rax,8), %rcx
	movq	%rax, %rsi
	movq	%rax, 16(%rsp)
	movq	56(%rsp), %rax
	subq	40(%rsp), %rax
	movsd	(%rcx,%rsi,8), %xmm2
	movl	%edi, %ecx
	movl	$.LC3, %esi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	48(%rsp), %rax
	subq	32(%rsp), %rax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC2(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	$3, %eax
	addsd	%xmm1, %xmm0
	movsd	(%rdx), %xmm1
	movl	%ebx, %edx
	call	__printf_chk
	cmpl	$4, %ebx
	ja	.L14
	testl	%ebx, %ebx
	je	.L19
	movl	8(%rsp), %r15d
	movq	%rbp, %r14
	xorl	%ebx, %ebx
	movq	%rbp, 8(%rsp)
.L17:
	movq	(%r14), %rbp
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L16:
	movsd	0(%rbp), %xmm0
	movl	%r13d, %ecx
	movl	%ebx, %edx
	movl	$.LC4, %esi
	movl	$1, %edi
	movl	$1, %eax
	addl	$1, %r13d
	addq	$8, %rbp
	call	__printf_chk
	cmpl	%r15d, %r13d
	jne	.L16
	addl	$1, %ebx
	addq	$8, %r14
	cmpl	%r15d, %ebx
	jne	.L17
	movq	8(%rsp), %rbp
.L14:
	movq	16(%rsp), %rax
	movq	(%rsp), %r14
	xorl	%ebx, %ebx
	leaq	8(,%rax,8), %r13
.L18:
	movq	(%r14,%rbx), %rdi
	call	free
	movq	(%r12,%rbx), %rdi
	call	free
	movq	0(%rbp,%rbx), %rdi
	addq	$8, %rbx
	call	free
	cmpq	%rbx, %r13
	jne	.L18
.L19:
	movq	(%rsp), %rdi
	call	free
	movq	%r12, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	xorl	%eax, %eax
	movq	72(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L35
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	$-1, 16(%rsp)
	jmp	.L12
.L34:
	movl	$.LC1, %edi
	call	puts
	orl	$-1, %edi
	call	exit
.L35:
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE5:
	.section	.text.startup
.LHOTE5:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
