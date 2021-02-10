	.file	"sort.c"
	.text
	.p2align 4
<<<<<<< HEAD
	.globl	sort
	.type	sort, @function
sort:
.LFB0:
	.cfi_startproc
	endbr64
	cmpl	$1, %esi
	jle	.L1
	leal	-2(%rsi), %r8d
	leaq	8(%rdi), %r9
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%r8d, %edx
	movq	%rdi, %rax
	leaq	(%r9,%rdx,8), %rsi
	.p2align 4,,10
	.p2align 3
.L5:
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	cmpq	%rcx, %rdx
	jle	.L4
	movslq	%edx, %rdx
	movq	%rcx, (%rax)
	movq	%rdx, 8(%rax)
.L4:
	addq	$8, %rax
	cmpq	%rsi, %rax
	jne	.L5
	subl	$1, %r8d
	cmpl	$-1, %r8d
	jne	.L3
.L1:
	ret
	.cfi_endproc
.LFE0:
	.size	sort, .-sort
=======
	.globl	bubble_sort
	.type	bubble_sort, @function
bubble_sort:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$1, %rsi
	je	.L17
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	movq	%rsi, %r11
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%r11, %r10
	subq	%rax, %r10
	je	.L7
	movq	(%rdi), %rcx
	xorl	%edx, %edx
	xorl	%eax, %eax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L18:
	movslq	%ecx, %rcx
	movq	%rsi, (%rdi,%r9,8)
	movq	%rcx, (%r8)
	cmpq	%r10, %rax
	jnb	.L7
.L5:
	addl	$1, %edx
	movq	%rax, %r9
	movl	%edx, %eax
	leaq	(%rdi,%rax,8), %r8
	movq	(%r8), %rsi
	cmpq	%rcx, %rsi
	jl	.L18
	movq	%rsi, %rcx
	cmpq	%r10, %rax
	jb	.L5
.L7:
	leal	1(%rbx), %eax
	movq	%rax, %rbx
	cmpq	%r11, %rax
	jb	.L2
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L17:
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE23:
	.size	bubble_sort, .-bubble_sort
>>>>>>> cee803c8b7597d7c05703342cfc4d5da483fea3b
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
<<<<<<< HEAD
4:
=======
4:
>>>>>>> cee803c8b7597d7c05703342cfc4d5da483fea3b
