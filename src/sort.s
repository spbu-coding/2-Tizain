	.file	"sort.c"
	.text
	.p2align 4
	.globl	sort
	.type	sort, @function
sort:
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
	.size	sort, .-sort
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
4:
