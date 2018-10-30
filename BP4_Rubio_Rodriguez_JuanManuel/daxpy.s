	.file	"daxpy.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	daxpy
	.type	daxpy, @function
daxpy:
.LFB38:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%ecx, %r14d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%r8, %rsi
	movq	%rdi, %rbx
	xorl	%edi, %edi
	movl	%edx, %r13d
	movq	%r9, %rbp
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	call	clock_gettime
	testl	%r14d, %r14d
	je	.L10
	leaq	16(%r12), %rax
	cmpq	%rax, %rbx
	leaq	16(%rbx), %rax
	setnb	%dl
	cmpq	%rax, %r12
	setnb	%al
	orb	%al, %dl
	je	.L3
	cmpl	$6, %r14d
	jbe	.L3
	movq	%rbx, %rax
	andl	$15, %eax
	shrq	$2, %rax
	negq	%rax
	andl	$3, %eax
	cmpl	%r14d, %eax
	cmova	%r14, %rax
	xorl	%edx, %edx
	testl	%eax, %eax
	je	.L4
	movl	(%r12), %edx
	imull	%r13d, %edx
	addl	%edx, (%rbx)
	cmpl	$1, %eax
	movl	$1, %edx
	je	.L4
	movl	4(%r12), %edx
	imull	%r13d, %edx
	addl	%edx, 4(%rbx)
	cmpl	$3, %eax
	movl	$2, %edx
	jne	.L4
	movl	8(%r12), %edx
	imull	%r13d, %edx
	addl	%edx, 8(%rbx)
	movl	$3, %edx
.L4:
	movl	%r14d, %edi
	movl	%r13d, 12(%rsp)
	xorl	%ecx, %ecx
	subl	%eax, %edi
	movd	12(%rsp), %xmm4
	salq	$2, %rax
	leal	-4(%rdi), %esi
	leaq	(%rbx,%rax), %r10
	xorl	%r9d, %r9d
	pshufd	$0, %xmm4, %xmm2
	addq	%r12, %rax
	shrl	$2, %esi
	addl	$1, %esi
	movdqa	%xmm2, %xmm3
	leal	0(,%rsi,4), %r8d
	psrlq	$32, %xmm3
.L6:
	movdqu	(%rax,%rcx), %xmm0
	addl	$1, %r9d
	movdqa	%xmm0, %xmm1
	psrlq	$32, %xmm0
	pmuludq	%xmm3, %xmm0
	pshufd	$8, %xmm0, %xmm0
	pmuludq	%xmm2, %xmm1
	pshufd	$8, %xmm1, %xmm1
	punpckldq	%xmm0, %xmm1
	movdqa	(%r10,%rcx), %xmm0
	paddd	%xmm1, %xmm0
	movaps	%xmm0, (%r10,%rcx)
	addq	$16, %rcx
	cmpl	%esi, %r9d
	jb	.L6
	addl	%r8d, %edx
	cmpl	%r8d, %edi
	je	.L10
	movl	%edx, %eax
	movl	(%r12,%rax,4), %ecx
	imull	%r13d, %ecx
	addl	%ecx, (%rbx,%rax,4)
	leal	1(%rdx), %eax
	cmpl	%eax, %r14d
	jbe	.L10
	movl	(%r12,%rax,4), %ecx
	addl	$2, %edx
	imull	%r13d, %ecx
	addl	%ecx, (%rbx,%rax,4)
	cmpl	%edx, %r14d
	jbe	.L10
	movl	%edx, %eax
	imull	(%r12,%rax,4), %r13d
	addl	%r13d, (%rbx,%rax,4)
.L10:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movq	%rbp, %rsi
	xorl	%edi, %edi
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	clock_gettime
	.p2align 4,,10
	.p2align 3
.L3:
	.cfi_restore_state
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L11:
	movl	(%r12,%rax,4), %edx
	imull	%r13d, %edx
	addl	%edx, (%rbx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %r14d
	ja	.L11
	jmp	.L10
	.cfi_endproc
.LFE38:
	.size	daxpy, .-daxpy
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"ERROR: falta tam del vector y constante\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"x[0] = %i, x[%i] = %i\n"
.LC3:
	.string	"y[0] = %i, y[%i] = %i\n"
.LC5:
	.string	"\nTiempo : %11.9f\n"
	.section	.text.unlikely
.LCOLDB9:
	.section	.text.startup,"ax",@progbits
.LHOTB9:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB39:
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jle	.L58
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	16(%rbx), %rdi
	movq	%rax, %r13
	xorl	%esi, %esi
	movl	%r13d, %r12d
	movl	$10, %edx
	salq	$2, %r12
	call	strtol
	movq	%r12, %rdi
	movq	%rax, (%rsp)
	call	malloc
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	malloc
	testl	%r13d, %r13d
	movq	%rax, %r12
	je	.L59
	movq	%rbx, %rax
	andl	$15, %eax
	shrq	$2, %rax
	negq	%rax
	andl	$3, %eax
	cmpl	%r13d, %eax
	cmova	%r13d, %eax
	cmpl	$5, %r13d
	ja	.L60
	movl	%r13d, %eax
.L33:
	cmpl	$1, %eax
	movl	$1, (%rbx)
	movl	$0, (%r12)
	je	.L46
	cmpl	$2, %eax
	movl	$2, 4(%rbx)
	movl	$2, 4(%r12)
	je	.L47
	cmpl	$3, %eax
	movl	$3, 8(%rbx)
	movl	$4, 8(%r12)
	je	.L48
	cmpl	$5, %eax
	movl	$4, 12(%rbx)
	movl	$6, 12(%r12)
	jne	.L49
	movl	$5, 16(%rbx)
	movl	$8, 16(%r12)
	movl	$5, %edx
.L35:
	cmpl	%eax, %r13d
	leal	-1(%r13), %r14d
	je	.L42
.L34:
	movl	%r13d, %r8d
	leal	-1(%r13), %r14d
	movl	%eax, %esi
	subl	%eax, %r8d
	leal	-4(%r8), %ecx
	movl	%r14d, %edi
	subl	%eax, %edi
	shrl	$2, %ecx
	addl	$1, %ecx
	cmpl	$2, %edi
	leal	0(,%rcx,4), %r9d
	jbe	.L37
	movl	%edx, 12(%rsp)
	salq	$2, %rsi
	xorl	%eax, %eax
	movd	12(%rsp), %xmm5
	leaq	(%rbx,%rsi), %r10
	xorl	%edi, %edi
	movdqa	.LC7(%rip), %xmm3
	addq	%r12, %rsi
	pshufd	$0, %xmm5, %xmm0
	movdqa	.LC8(%rip), %xmm2
	paddd	.LC6(%rip), %xmm0
.L38:
	movdqa	%xmm0, %xmm1
	addl	$1, %edi
	movdqa	%xmm0, %xmm4
	pslld	$1, %xmm0
	paddd	%xmm2, %xmm1
	movups	%xmm0, (%rsi,%rax)
	paddd	%xmm3, %xmm4
	movaps	%xmm1, (%r10,%rax)
	addq	$16, %rax
	cmpl	%edi, %ecx
	jbe	.L61
	movdqa	%xmm4, %xmm0
	jmp	.L38
.L61:
	addl	%r9d, %edx
	cmpl	%r9d, %r8d
	je	.L42
.L37:
	leal	1(%rdx), %ecx
	leal	(%rdx,%rdx), %esi
	movl	%edx, %eax
	cmpl	%ecx, %r13d
	movl	%ecx, (%rbx,%rax,4)
	movl	%esi, (%r12,%rax,4)
	jbe	.L42
	leal	2(%rdx), %eax
	movl	%ecx, %esi
	addl	%ecx, %ecx
	movl	%ecx, (%r12,%rsi,4)
	cmpl	%eax, %r13d
	movl	%eax, (%rbx,%rsi,4)
	jbe	.L42
	movl	%eax, %ecx
	addl	$3, %edx
	addl	%eax, %eax
	movl	%edx, (%rbx,%rcx,4)
	movl	%eax, (%r12,%rcx,4)
.L42:
	movl	%r14d, %r15d
	movl	(%r12), %edx
	movl	%r14d, %ecx
	salq	$2, %r15
	movl	$.LC2, %esi
	movl	$1, %edi
	leaq	(%r12,%r15), %rbp
	xorl	%eax, %eax
	addq	%rbx, %r15
	movl	0(%rbp), %r8d
	call	__printf_chk
	movl	(%r15), %r8d
	movl	(%rbx), %edx
	movl	%r14d, %ecx
	movl	$.LC3, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	(%rsp), %edx
	leaq	32(%rsp), %r9
	leaq	16(%rsp), %r8
	movl	%r13d, %ecx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	daxpy
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	movl	%r14d, %ecx
	pxor	%xmm0, %xmm0
	movl	0(%rbp), %r8d
	pxor	%xmm1, %xmm1
	movl	(%r12), %edx
	movl	$.LC2, %esi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	xorl	%eax, %eax
	divsd	.LC4(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rsp)
	call	__printf_chk
	movl	(%rbx), %edx
	movl	%r14d, %ecx
	movl	$.LC3, %esi
	movl	(%r15), %r8d
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movsd	(%rsp), %xmm0
	movl	$.LC5, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movq	%rbx, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	xorl	%eax, %eax
	movq	56(%rsp), %rdx
	xorq	%fs:40, %rdx
	jne	.L62
	addq	$72, %rsp
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
.L60:
	.cfi_restore_state
	xorl	%edx, %edx
	testl	%eax, %eax
	je	.L34
	jmp	.L33
.L49:
	movl	$4, %edx
	jmp	.L35
.L48:
	movl	$3, %edx
	jmp	.L35
.L46:
	movl	$1, %edx
	jmp	.L35
.L47:
	movl	$2, %edx
	jmp	.L35
.L59:
	orl	$-1, %r14d
	jmp	.L42
.L62:
	call	__stack_chk_fail
.L58:
	movq	stderr(%rip), %rcx
	movl	$.LC1, %edi
	movl	$40, %edx
	movl	$1, %esi
	call	fwrite
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE9:
	.section	.text.startup
.LHOTE9:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	0
	.long	1104006501
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC6:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC7:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC8:
	.long	1
	.long	1
	.long	1
	.long	1
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
