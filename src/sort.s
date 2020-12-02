	.file	"sort.c"
	.text
	.p2align 4
	.globl	bubble_sort
	.type	bubble_sort, @function
bubble_sort:
.LFB50:
	.cfi_startproc
	endbr64
	movl	(%rsi), %edx
	subl	$1, %edx
	testl	%edx, %edx
	jle	.L1
	leaq	8(%rdi), %r9
	.p2align 4,,10
	.p2align 3
.L3:
	subl	$1, %edx
	movq	%rdi, %rax
	movq	%rdx, %r8
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
	cmpq	%rax, %rsi
	jne	.L5
	movl	%r8d, %edx
	testl	%r8d, %r8d
	jne	.L3
.L1:
	ret
	.cfi_endproc
.LFE50:
	.size	bubble_sort, .-bubble_sort
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"--from="
.LC1:
	.string	"--to="
	.text
	.p2align 4
	.globl	count
	.type	count, @function
count:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	cmpl	$1, %edi
	jle	.L16
	leal	-2(%rdi), %eax
	leaq	8(%rsi), %r8
	xorl	%edx, %edx
	leaq	16(%rsi,%rax,8), %rbx
	leaq	.LC0(%rip), %r11
	leaq	.LC1(%rip), %r10
	.p2align 4,,10
	.p2align 3
.L15:
	movq	(%r8), %r9
	movl	$7, %ecx
	movq	%r11, %rdi
	movq	%r9, %rsi
	repz cmpsb
	movl	$5, %ecx
	movq	%r9, %rsi
	movq	%r10, %rdi
	seta	%al
	sbbb	$0, %al
	movsbl	%al, %eax
	cmpl	$1, %eax
	adcl	$0, %edx
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	movsbl	%al, %eax
	cmpl	$1, %eax
	adcl	$0, %edx
	addq	$8, %r8
	cmpq	%rbx, %r8
	jne	.L15
	leal	-1(%rdx,%rbp), %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
	xorl	%edx, %edx
	popq	%rbx
	.cfi_def_cfa_offset 16
	leal	-1(%rdx,%rbp), %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE51:
	.size	count, .-count
	.p2align 4
	.globl	array_format
	.type	array_format, @function
array_format:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leal	-1(%rdi), %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	cmpl	$1, %edi
	jle	.L20
	leal	-2(%rdi), %eax
	leaq	8(%rsi), %r8
	xorl	%edx, %edx
	leaq	16(%rsi,%rax,8), %r10
	leaq	.LC0(%rip), %rbx
	leaq	.LC1(%rip), %r9
	.p2align 4,,10
	.p2align 3
.L23:
	movq	(%r8), %r11
	movl	$7, %ecx
	movq	%rbx, %rdi
	movq	%r11, %rsi
	repz cmpsb
	movl	$5, %ecx
	movq	%r11, %rsi
	movq	%r9, %rdi
	seta	%al
	sbbb	$0, %al
	movsbl	%al, %eax
	cmpl	$1, %eax
	adcl	$0, %edx
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	movsbl	%al, %eax
	cmpl	$1, %eax
	adcl	$0, %edx
	addq	$8, %r8
	cmpq	%r8, %r10
	jne	.L23
	addl	%edx, %ebp
	movslq	%ebp, %rdi
	salq	$3, %rdi
	call	malloc@PLT
	movq	%rax, %r14
.L31:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L25:
	movl	$10, %edi
	call	malloc@PLT
	movq	%rax, (%r14,%rbx,8)
	addq	$1, %rbx
	cmpl	%ebx, %ebp
	jg	.L25
	cmpl	$1, %r12d
	jle	.L19
	leal	-2(%r12), %eax
	leaq	8(%r13), %rbp
	movl	$-1, %r15d
	leaq	16(%r13,%rax,8), %r12
	leaq	.LC0(%rip), %rbx
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L38:
	movl	$61, %eax
	movl	$1869884717, (%r11)
	addl	$2, %r15d
	movw	%ax, 4(%r11)
	movq	0(%rbp), %rax
	movq	8(%r14,%r10), %rdi
	leaq	5(%rax), %rsi
	call	strcpy@PLT
.L28:
	addq	$8, %rbp
	cmpq	%rbp, %r12
	je	.L19
.L30:
	movq	0(%rbp), %r8
	movl	$7, %ecx
	movq	%rbx, %rdi
	leal	1(%r15), %r13d
	movq	%r8, %rsi
	repz cmpsb
	movslq	%r13d, %rcx
	movq	(%r14,%rcx,8), %r11
	leaq	0(,%rcx,8), %r10
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	je	.L37
	movl	$5, %ecx
	movq	%r8, %rsi
	leaq	.LC1(%rip), %rdi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	je	.L38
	movq	%r8, %rsi
	movq	%r11, %rdi
	addq	$8, %rbp
	movl	%r13d, %r15d
	call	strcpy@PLT
	cmpq	%rbp, %r12
	jne	.L30
.L19:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r14, %rax
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
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_restore_state
	movabsq	$17290299007446317, %rax
	addl	$2, %r15d
	movq	%rax, (%r11)
	movq	0(%rbp), %rax
	movq	8(%r14,%r10), %rdi
	leaq	7(%rax), %rsi
	call	strcpy@PLT
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L20:
	movslq	%ebp, %rdi
	salq	$3, %rdi
	call	malloc@PLT
	movq	%rax, %r14
	testl	%ebp, %ebp
	jle	.L19
	jmp	.L31
	.cfi_endproc
.LFE52:
	.size	array_format, .-array_format
	.section	.rodata.str1.1
.LC2:
	.string	"-1"
.LC3:
	.string	"-2"
.LC4:
	.string	"-3"
.LC5:
	.string	"-4"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"From %d to %d\nIts correct.\nYou may write your array:\n"
	.section	.rodata.str1.1
.LC7:
	.string	"%ld%c"
.LC8:
	.string	"Data is spelled incorrectly"
.LC9:
	.string	"Nothing to sort"
.LC10:
	.string	"\nStdout: "
.LC11:
	.string	"%ld "
.LC12:
	.string	"\nStderr: "
.LC13:
	.string	"\nReduced: "
.LC14:
	.string	"\nSorted: "
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB53:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	movq	%rsi, %r14
	pushq	%r13
	.cfi_offset 13, -40
	movl	%edi, %r13d
	pushq	%r12
	pushq	%rbx
	subq	$920, %rsp
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	array_format
	movq	%r14, %rsi
	movl	%r13d, %edi
	movq	%rax, %r12
	call	count
	testl	%eax, %eax
	jle	.L51
	movl	$0, -944(%rbp)
	leal	-1(%rax), %r11d
	xorl	%ebx, %ebx
	xorl	%r13d, %r13d
	movl	$0, -940(%rbp)
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	xorl	%r10d, %r10d
	movl	$0, -936(%rbp)
	xorl	%r9d, %r9d
	movl	$0, -932(%rbp)
	movl	$0, -920(%rbp)
	movl	$0, -948(%rbp)
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L46:
	leaq	1(%rbx), %rax
	cmpq	%r11, %rbx
	je	.L139
	movq	%rax, %rbx
.L50:
	movq	(%r12,%rbx,8), %r8
	movl	$8, %ecx
	leaq	.LC0(%rip), %rdi
	leal	1(%rbx), %eax
	movq	%r8, %rsi
	repz cmpsb
	seta	%dl
	sbbb	$0, %dl
	testb	%dl, %dl
	jne	.L42
	movl	$1, -936(%rbp)
	addl	$1, %r14d
	movl	%eax, %r10d
.L42:
	movl	$6, %ecx
	movq	%r8, %rsi
	leaq	.LC1(%rip), %rdi
	repz cmpsb
	seta	%dl
	sbbb	$0, %dl
	testb	%dl, %dl
	jne	.L43
	movl	$1, -932(%rbp)
	addl	$1, %r13d
	movl	%eax, %r9d
.L43:
	cmpb	$45, (%r8)
	jne	.L45
	movzbl	1(%r8), %eax
	subl	$45, %eax
	cmpl	$1, %eax
	adcl	$0, %r15d
.L45:
	movl	%ebx, -904(%rbp)
	testq	%rbx, %rbx
	je	.L46
	movl	$10, %edx
	leaq	-880(%rbp), %rsi
	movq	%r8, %rdi
	movq	%r11, -928(%rbp)
	movl	%r10d, -916(%rbp)
	movl	%r9d, -912(%rbp)
	call	strtol@PLT
	movq	-880(%rbp), %rdx
	movl	-912(%rbp), %r9d
	movl	-916(%rbp), %r10d
	movq	-928(%rbp), %r11
	cmpb	$0, (%rdx)
	movl	-904(%rbp), %ecx
	je	.L47
	cmpl	%ecx, %r10d
	jne	.L48
	addl	$1, -948(%rbp)
	addl	$1, -920(%rbp)
	movl	$0, -940(%rbp)
.L48:
	cmpl	%ecx, %r9d
	jne	.L46
	addl	$1, -948(%rbp)
	addl	$1, -920(%rbp)
	movl	$0, -944(%rbp)
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L47:
	cmpl	%ecx, %r10d
	jne	.L49
	addl	$1, -920(%rbp)
	movl	%eax, -940(%rbp)
.L49:
	cmpl	%ecx, %r9d
	jne	.L46
	addl	$1, -920(%rbp)
	movl	%eax, -944(%rbp)
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L139:
	movl	-920(%rbp), %ecx
	testl	%ecx, %ecx
	je	.L51
	cmpl	$2, %r15d
	jg	.L140
	cmpl	$1, %r14d
	setg	%bl
	cmpl	$1, %r13d
	setg	%al
	orb	%al, %bl
	jne	.L141
	cmpl	$1, -948(%rbp)
	jg	.L142
	cmpl	$1, -920(%rbp)
	jne	.L55
	cmpl	$0, -936(%rbp)
	movl	$32767, %eax
	cmove	-944(%rbp), %eax
	cmpl	$0, -932(%rbp)
	movl	%eax, -944(%rbp)
	movl	$-32767, %eax
	cmove	-940(%rbp), %eax
	movl	%eax, -940(%rbp)
.L55:
	movl	-944(%rbp), %ecx
	movl	-940(%rbp), %edx
	leaq	.LC6(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	movl	$-1, %r12d
	leaq	-885(%rbp), %r15
	call	__printf_chk@PLT
	leaq	-872(%rbp), %r14
	leaq	.LC7(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L61:
	xorl	%eax, %eax
	movq	%r15, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	__isoc99_scanf@PLT
	cmpl	$2, %eax
	je	.L57
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	cmpb	$10, -885(%rbp)
	jne	.L61
	movl	$0, -884(%rbp)
	cmpl	$-1, %r12d
	je	.L62
	movslq	%r12d, %rdx
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L57:
	addl	$1, %r12d
	movq	-872(%rbp), %rax
	cmpb	$10, -885(%rbp)
	movslq	%r12d, %rdx
	movq	%rax, -864(%rbp,%rdx,8)
	jne	.L61
	movl	$0, -884(%rbp)
.L92:
	leaq	-864(%rbp), %rax
	xorl	%r9d, %r9d
	xorl	%r15d, %r15d
	xorl	%r13d, %r13d
	leaq	-856(%rbp,%rdx,8), %rsi
	movslq	-940(%rbp), %rcx
	movq	%rax, %rdx
	movslq	-944(%rbp), %rdi
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L144:
	cmpq	%rdi, %r8
	jge	.L64
	addl	$1, %r9d
	movl	$1, %ebx
.L65:
	addq	$8, %rdx
	cmpq	%rsi, %rdx
	je	.L143
.L66:
	movq	(%rdx), %r8
	cmpq	%r8, %rcx
	jl	.L144
	addl	$1, %r15d
	cmpq	%rdi, %r8
	jl	.L65
.L64:
	addq	$8, %rdx
	addl	$1, %r13d
	cmpq	%rsi, %rdx
	jne	.L66
.L143:
	testb	%bl, %bl
	je	.L62
	movl	%r9d, -884(%rbp)
	testl	%r9d, %r9d
	je	.L62
	movslq	%r9d, %r9
	movq	%rsp, %rbx
	movq	%rsp, -904(%rbp)
	leaq	15(,%r9,8), %rdx
	movq	%rdx, %r8
	andq	$-4096, %rdx
	subq	%rdx, %rbx
	andq	$-16, %r8
	movq	%rbx, %rdx
.L82:
	cmpq	%rdx, %rsp
	je	.L83
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L82
.L83:
	andl	$4095, %r8d
	subq	%r8, %rsp
	testq	%r8, %r8
	jne	.L145
.L84:
	movslq	%r15d, %rdx
	movq	%rsp, %rbx
	movq	%rsp, %r12
	leaq	15(,%rdx,8), %rdx
	movq	%rdx, %r8
	andq	$-4096, %rdx
	subq	%rdx, %rbx
	andq	$-16, %r8
	movq	%rbx, %rdx
.L85:
	cmpq	%rdx, %rsp
	je	.L86
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L85
.L62:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	xorl	%eax, %eax
.L39:
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L146
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L145:
	.cfi_restore_state
	orq	$0, -8(%rsp,%r8)
	jmp	.L84
.L86:
	andl	$4095, %r8d
	subq	%r8, %rsp
	testq	%r8, %r8
	jne	.L147
.L87:
	movslq	%r13d, %rdx
	movq	%rsp, %rbx
	movq	%rsp, %r14
	leaq	15(,%rdx,8), %rdx
	movq	%rdx, %r8
	andq	$-4096, %rdx
	subq	%rdx, %rbx
	andq	$-16, %r8
	movq	%rbx, %rdx
.L88:
	cmpq	%rdx, %rsp
	je	.L89
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L88
.L51:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	orl	$-1, %eax
	jmp	.L39
.L147:
	orq	$0, -8(%rsp,%r8)
	jmp	.L87
.L89:
	andl	$4095, %r8d
	subq	%r8, %rsp
	testq	%r8, %r8
	je	.L90
	orq	$0, -8(%rsp,%r8)
.L90:
	movq	%rsp, %rbx
	orl	$-1, %r9d
	orl	$-1, %r8d
	orl	$-1, %r11d
	movq	%rbx, -912(%rbp)
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L149:
	cmpq	%rdi, %rdx
	jge	.L69
	addl	$1, %r11d
	movslq	%r11d, %r10
	movq	%rdx, (%r12,%r10,8)
.L70:
	addq	$8, %rax
	cmpq	%rax, %rsi
	je	.L148
.L71:
	movq	(%rax), %rdx
	cmpq	%rdx, %rcx
	jl	.L149
	addl	$1, %r8d
	movslq	%r8d, %r10
	movq	%rdx, (%r14,%r10,8)
	cmpq	%rdi, %rdx
	jl	.L70
.L69:
	addl	$1, %r9d
	addq	$8, %rax
	movslq	%r9d, %r10
	movq	%rdx, (%rbx,%r10,8)
	cmpq	%rax, %rsi
	jne	.L71
.L148:
	xorl	%eax, %eax
	leaq	.LC10(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	testl	%r15d, %r15d
	je	.L150
	leal	-1(%r15), %eax
	movq	%r14, %rbx
	leaq	.LC11(%rip), %r15
	leaq	8(%r14,%rax,8), %r14
	.p2align 4,,10
	.p2align 3
.L74:
	movq	(%rbx), %rcx
	movq	stdout(%rip), %rdi
	movq	%r15, %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	addq	$8, %rbx
	call	__fprintf_chk@PLT
	cmpq	%rbx, %r14
	jne	.L74
.L73:
	xorl	%eax, %eax
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	testl	%r13d, %r13d
	je	.L151
	movq	-912(%rbp), %rbx
	leal	-1(%r13), %eax
	leaq	.LC11(%rip), %r13
	leaq	8(%rbx,%rax,8), %r14
	.p2align 4,,10
	.p2align 3
.L77:
	movq	(%rbx), %rcx
	movq	stderr(%rip), %rdi
	movq	%r13, %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	addq	$8, %rbx
	call	__fprintf_chk@PLT
	cmpq	%rbx, %r14
	jne	.L77
.L76:
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	__printf_chk@PLT
	movl	-884(%rbp), %edx
	leaq	.LC11(%rip), %r13
	testl	%edx, %edx
	jle	.L81
	.p2align 4,,10
	.p2align 3
.L78:
	movq	(%r12,%rbx,8), %rdx
	movq	%r13, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	__printf_chk@PLT
	cmpl	%ebx, -884(%rbp)
	jg	.L78
.L81:
	leaq	-884(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%ebx, %ebx
	call	bubble_sort
	leaq	.LC14(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	-884(%rbp), %eax
	leaq	.LC11(%rip), %r13
	testl	%eax, %eax
	jle	.L80
	.p2align 4,,10
	.p2align 3
.L79:
	movq	(%r12,%rbx,8), %rdx
	movq	%r13, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	__printf_chk@PLT
	cmpl	%ebx, -884(%rbp)
	jg	.L79
.L80:
	xorl	%eax, %eax
	movq	-904(%rbp), %rsp
	jmp	.L39
.L151:
	movl	$45, %edi
	call	putchar@PLT
	jmp	.L76
.L150:
	movl	$45, %edi
	call	putchar@PLT
	jmp	.L73
.L142:
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movl	$-4, %eax
	jmp	.L39
.L140:
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movl	$-2, %eax
	jmp	.L39
.L141:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$-3, %eax
	jmp	.L39
.L146:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE53:
	.size	main, .-main
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
