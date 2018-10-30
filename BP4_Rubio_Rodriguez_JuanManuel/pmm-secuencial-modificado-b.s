	.file	"pmm-secuencial-modificado-b.c"
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
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L38
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	%eax, %ebp
	movq	%rax, %rbx
	movq	%rax, 32(%rsp)
	salq	$3, %rbp
	movl	%eax, %r15d
	movq	%rbp, %rdi
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, 16(%rsp)
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %r14
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	malloc
	testl	%ebx, %ebx
	movq	%rax, %r13
	je	.L3
	leal	-1(%rbx), %eax
	movl	%r15d, 44(%rsp)
	movq	16(%rsp), %r15
	leaq	8(,%rax,8), %rbx
	movl	%eax, 24(%rsp)
	movq	%rbx, 8(%rsp)
	xorl	%ebx, %ebx
.L4:
	movq	%rbp, %rdi
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, (%r15,%rbx)
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, (%r14,%rbx)
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, (%r12,%rbx)
	call	malloc
	movq	%rax, 0(%r13,%rbx)
	addq	$8, %rbx
	cmpq	%rbx, 8(%rsp)
	jne	.L4
	movl	44(%rsp), %r15d
	movq	16(%rsp), %r8
	xorl	%r9d, %r9d
.L7:
	pxor	%xmm0, %xmm0
	movq	(%r8,%r9,8), %rdi
	movq	(%r14,%r9,8), %rsi
	movq	(%r12,%r9,8), %rcx
	xorl	%eax, %eax
	movq	0(%r13,%r9,8), %rdx
	cvtsi2sd	%r9d, %xmm0
	.p2align 4,,10
	.p2align 3
.L6:
	movsd	%xmm0, (%rdi,%rax,8)
	movq	$0, (%rcx,%rax,8)
	movq	$0, (%rdx,%rax,8)
	movsd	%xmm0, (%rsi,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %r15d
	ja	.L6
	addq	$1, %r9
	cmpl	%r9d, %r15d
	ja	.L7
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	24(%rsp), %eax
	xorl	%ecx, %ecx
	leaq	8(,%rax,8), %rdi
.L9:
	movq	0(%r13,%rcx), %rsi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%r14,%rax,8), %rdx
	movsd	(%rdx,%rcx), %xmm0
	movsd	%xmm0, (%rsi,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %r15d
	ja	.L10
	addq	$8, %rcx
	cmpq	%rcx, %rdi
	jne	.L9
	leaq	8(%r13), %r8
	movq	%r13, 8(%rsp)
	movq	16(%rsp), %r13
	pxor	%xmm6, %xmm6
	xorl	%ebp, %ebp
.L14:
	movq	(%r12,%rbp,8), %rax
	movq	0(%r13,%rbp,8), %r9
	movq	%r8, %r11
	xorl	%ebx, %ebx
	leaq	8(%rax), %r10
	.p2align 4,,10
	.p2align 3
.L16:
	movq	-8(%r11), %rdi
	movq	(%r11), %rsi
	xorl	%eax, %eax
	movq	8(%r11), %rcx
	movq	16(%r11), %rdx
	movapd	%xmm6, %xmm4
	movapd	%xmm6, %xmm3
	movapd	%xmm6, %xmm2
	movapd	%xmm6, %xmm1
	.p2align 4,,10
	.p2align 3
.L12:
	movsd	(%r9,%rax,8), %xmm0
	movsd	(%rdi,%rax,8), %xmm5
	mulsd	%xmm0, %xmm5
	addsd	%xmm5, %xmm1
	movsd	(%rsi,%rax,8), %xmm5
	mulsd	%xmm0, %xmm5
	addsd	%xmm5, %xmm2
	movsd	(%rcx,%rax,8), %xmm5
	mulsd	%xmm0, %xmm5
	mulsd	(%rdx,%rax,8), %xmm0
	addq	$1, %rax
	cmpl	%eax, %r15d
	addsd	%xmm5, %xmm3
	addsd	%xmm0, %xmm4
	ja	.L12
	addl	$4, %ebx
	movsd	%xmm1, -8(%r10)
	addq	$32, %r11
	movsd	%xmm2, (%r10)
	addq	$32, %r10
	movsd	%xmm3, -24(%r10)
	movsd	%xmm4, -16(%r10)
	cmpl	%ebx, %r15d
	ja	.L16
	addq	$1, %rbp
	cmpl	%ebp, %r15d
	ja	.L14
	movq	8(%rsp), %r13
.L15:
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	24(%rsp), %esi
	pxor	%xmm0, %xmm0
	movq	(%r12), %rdx
	movl	$1, %edi
	movl	%esi, %eax
	movq	(%r12,%rax,8), %rcx
	movq	%rax, %rbx
	movq	%rax, 8(%rsp)
	movq	72(%rsp), %rax
	subq	56(%rsp), %rax
	movsd	(%rcx,%rbx,8), %xmm2
	movq	32(%rsp), %rbx
	movl	%esi, %ecx
	movl	$.LC3, %esi
	cvtsi2sdq	%rax, %xmm0
	movq	64(%rsp), %rax
	subq	48(%rsp), %rax
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
	ja	.L17
	testl	%ebx, %ebx
	je	.L22
	movl	32(%rsp), %eax
	movq	%r12, %r15
	xorl	%ebx, %ebx
	movq	%r12, 24(%rsp)
	movq	%r13, 32(%rsp)
	movl	%eax, %ebp
.L20:
	movq	(%r15), %r13
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L19:
	movsd	0(%r13), %xmm0
	movl	%r12d, %ecx
	movl	%ebx, %edx
	movl	$.LC4, %esi
	movl	$1, %edi
	movl	$1, %eax
	addl	$1, %r12d
	addq	$8, %r13
	call	__printf_chk
	cmpl	%ebp, %r12d
	jne	.L19
	addl	$1, %ebx
	addq	$8, %r15
	cmpl	%ebp, %ebx
	jne	.L20
	movq	24(%rsp), %r12
	movq	32(%rsp), %r13
.L17:
	movq	8(%rsp), %rax
	movq	16(%rsp), %r15
	xorl	%ebx, %ebx
	leaq	8(,%rax,8), %rbp
.L21:
	movq	(%r15,%rbx), %rdi
	call	free
	movq	(%r14,%rbx), %rdi
	call	free
	movq	(%r12,%rbx), %rdi
	call	free
	movq	0(%r13,%rbx), %rdi
	addq	$8, %rbx
	call	free
	cmpq	%rbx, %rbp
	jne	.L21
.L22:
	movq	16(%rsp), %rdi
	call	free
	movq	%r14, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	movq	%r13, %rdi
	call	free
	xorl	%eax, %eax
	movq	88(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L39
	addq	$104, %rsp
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
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	$-1, 24(%rsp)
	jmp	.L15
.L38:
	movl	$.LC1, %edi
	call	puts
	orl	$-1, %edi
	call	exit
.L39:
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
