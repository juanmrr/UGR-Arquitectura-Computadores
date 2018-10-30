	.file	"pmm-secuencial.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
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
	jle	.L33
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	%eax, %r14d
	movq	%rax, %rbp
	movq	%rax, 16(%rsp)
	salq	$3, %r14
	movl	%eax, %ebx
	movq	%r14, %rdi
	call	malloc
	movq	%r14, %rdi
	movq	%rax, %r13
	call	malloc
	movq	%r14, %rdi
	movq	%rax, %r15
	call	malloc
	testl	%ebp, %ebp
	movq	%rax, %r12
	je	.L3
	movl	%ebp, %eax
	xorl	%ebp, %ebp
	subl	$1, %eax
	movl	%eax, 8(%rsp)
	leaq	8(,%rax,8), %rax
	movq	%rax, (%rsp)
.L4:
	movq	%r14, %rdi
	call	malloc
	movq	%r14, %rdi
	movq	%rax, 0(%r13,%rbp)
	call	malloc
	movq	%r14, %rdi
	movq	%rax, (%r15,%rbp)
	call	malloc
	movq	%rax, (%r12,%rbp)
	addq	$8, %rbp
	cmpq	%rbp, (%rsp)
	jne	.L4
	xorl	%edi, %edi
.L7:
	pxor	%xmm0, %xmm0
	movq	0(%r13,%rdi,8), %rsi
	movq	(%r15,%rdi,8), %rcx
	movq	(%r12,%rdi,8), %rdx
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
	call	clock_gettime
	movl	8(%rsp), %eax
	xorl	%r11d, %r11d
	leaq	8(,%rax,8), %r10
.L9:
	movq	(%r12,%r11,8), %rdi
	movq	0(%r13,%r11,8), %rsi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L13:
	movsd	(%rdi,%rcx), %xmm1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%r15,%rax,8), %rdx
	movsd	(%rdx,%rcx), %xmm0
	mulsd	(%rsi,%rax,8), %xmm0
	addq	$1, %rax
	cmpl	%eax, %ebx
	addsd	%xmm0, %xmm1
	ja	.L10
	movsd	%xmm1, (%rdi,%rcx)
	addq	$8, %rcx
	cmpq	%rcx, %r10
	jne	.L13
	addq	$1, %r11
	cmpl	%r11d, %ebx
	ja	.L9
.L12:
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	8(%rsp), %esi
	pxor	%xmm0, %xmm0
	movq	(%r12), %rdx
	movq	16(%rsp), %rbx
	movl	%esi, %eax
	movq	(%r12,%rax,8), %rcx
	movq	%rax, %rdi
	movq	%rax, 24(%rsp)
	movq	56(%rsp), %rax
	subq	40(%rsp), %rax
	movsd	(%rcx,%rdi,8), %xmm2
	movl	%esi, %ecx
	movl	$1, %edi
	movl	$.LC3, %esi
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
	movl	16(%rsp), %eax
	movq	%r12, 8(%rsp)
	xorl	%ebp, %ebp
	movl	%eax, (%rsp)
.L17:
	movq	8(%rsp), %rax
	xorl	%r14d, %r14d
	movq	(%rax), %rbx
	.p2align 4,,10
	.p2align 3
.L16:
	movsd	(%rbx), %xmm0
	movl	%r14d, %ecx
	movl	%ebp, %edx
	movl	$.LC4, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	addl	$1, %r14d
	addq	$8, %rbx
	cmpl	(%rsp), %r14d
	jne	.L16
	addl	$1, %ebp
	addq	$8, 8(%rsp)
	cmpl	(%rsp), %ebp
	jne	.L17
.L14:
	movq	24(%rsp), %rax
	xorl	%ebx, %ebx
	leaq	8(,%rax,8), %rbp
.L18:
	movq	0(%r13,%rbx), %rdi
	call	free
	movq	(%r15,%rbx), %rdi
	call	free
	movq	(%r12,%rbx), %rdi
	addq	$8, %rbx
	call	free
	cmpq	%rbx, %rbp
	jne	.L18
.L19:
	movq	%r13, %rdi
	call	free
	movq	%r15, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	xorl	%eax, %eax
	movq	72(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L34
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
	movl	$-1, 8(%rsp)
	jmp	.L12
.L33:
	movl	$.LC0, %edi
	call	puts
	orl	$-1, %edi
	call	exit
.L34:
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
