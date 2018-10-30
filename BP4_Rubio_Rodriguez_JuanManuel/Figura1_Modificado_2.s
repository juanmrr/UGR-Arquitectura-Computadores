	.file	"Figura1_Modificado_2.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"R[0] = %d R[39999] = %d\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Tiempo total empleado en el c\303\241lculo: %11.9f \n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB3:
	.section	.text.startup,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$s+40000, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$160072, %rsp
	.cfi_def_cfa_offset 160112
	movq	%fs:40, %rax
	movq	%rax, 160056(%rsp)
	xorl	%eax, %eax
	movl	$s, %eax
	.p2align 4,,10
	.p2align 3
.L2:
	movl	$1, (%rax)
	movl	$1, 4(%rax)
	addq	$8, %rax
	cmpq	%rax, %r13
	jne	.L2
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%edi, %edx
	movl	$s, %eax
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rax), %ecx
	addq	$16, %rax
	leal	(%rdx,%rcx,2), %ecx
	addl	%ecx, %ebx
	movl	-8(%rax), %ecx
	leal	(%rdx,%rcx,2), %ecx
	addl	%ecx, %ebp
	movl	-12(%rax), %ecx
	leal	(%rcx,%rcx,2), %ecx
	subl	%edx, %ecx
	addl	%ecx, %r12d
	movl	-4(%rax), %ecx
	leal	(%rcx,%rcx,2), %ecx
	subl	%edx, %ecx
	addl	%ecx, %esi
	cmpq	%rax, %r13
	jne	.L4
	leal	(%rbx,%rbp), %eax
	addl	%r12d, %esi
	cmpl	%esi, %eax
	cmovl	%eax, %esi
	movl	%esi, 48(%rsp,%rdi,4)
	addq	$1, %rdi
	cmpq	$40000, %rdi
	jne	.L3
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	movl	$.LC1, %esi
	pxor	%xmm0, %xmm0
	movl	160044(%rsp), %ecx
	movl	48(%rsp), %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC0(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	xorl	%eax, %eax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	__printf_chk
	movsd	8(%rsp), %xmm0
	movl	$1, %edi
	movl	$.LC2, %esi
	movl	$1, %eax
	call	__printf_chk
	xorl	%eax, %eax
	movq	160056(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L13
	addq	$160072, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L13:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE3:
	.section	.text.startup
.LHOTE3:
	.comm	s,40000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
