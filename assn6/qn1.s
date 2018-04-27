	.file	"qn1.c"
	.text
	.globl	function
	.type	function, @function
function:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movsd	%xmm0, -24(%rbp)
	movl	$2, -4(%rbp)
	jmp	.L2
.L5:
	movsd	-24(%rbp), %xmm0
	cvttsd2si	%xmm0, %eax
	cltd
	idivl	-4(%rbp)
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L3
	movl	$0, %eax
	jmp	.L4
.L3:
	addl	$1, -4(%rbp)
.L2:
	cvtsi2sd	-4(%rbp), %xmm1
	movsd	%xmm1, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	call	sqrt
	ucomisd	-32(%rbp), %xmm0
	ja	.L5
	movq	-24(%rbp), %rax
.L4:
	movq	%rax, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	function, .-function
	.globl	find_max
	.type	find_max, @function
find_max:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm0
	call	function
	movsd	%xmm0, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rax, 32(%rdx)
	movq	-16(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 40(%rax)
	movq	-16(%rbp), %rax
	movl	20(%rax), %eax
	addl	%eax, -20(%rbp)
	jmp	.L7
.L10:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm0
	call	function
	movsd	%xmm0, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movsd	32(%rax), %xmm1
	movsd	-8(%rbp), %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	.L8
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, 32(%rdx)
	movq	-16(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 40(%rax)
.L8:
	movq	-16(%rbp), %rax
	movl	20(%rax), %eax
	addl	%eax, -20(%rbp)
.L7:
	movq	-16(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	-20(%rbp), %eax
	jg	.L10
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	find_max, .-find_max
	.section	.rodata
.LC1:
	.string	"not enough parameters"
	.align 8
.LC2:
	.string	"Usage: %s <# of elements> <# of threads> \n %s\n"
.LC3:
	.string	"invalid num elements"
.LC4:
	.string	"invalid num of threads"
	.align 8
.LC5:
	.string	"invalid num elements, not enough memory"
.LC6:
	.string	"pthread_create"
	.align 8
.LC7:
	.string	"It seems that no randomly generated number was prime"
	.align 8
.LC8:
	.string	"Max prime occurs for %d at index=%d\n"
.LC9:
	.string	"Time taken = %ld microsecs\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movl	%edi, -116(%rbp)
	movq	%rsi, -128(%rbp)
	cmpl	$3, -116(%rbp)
	je	.L14
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movl	$.LC1, %edx
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$-1, %edi
	call	exit
.L14:
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -96(%rbp)
	cmpl	$0, -96(%rbp)
	jg	.L15
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movl	$.LC3, %edx
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$-1, %edi
	call	exit
.L15:
	movq	-128(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -92(%rbp)
	cmpl	$0, -92(%rbp)
	jle	.L16
	cmpl	$64, -92(%rbp)
	jle	.L17
.L16:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movl	$.LC4, %edx
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$-1, %edi
	call	exit
.L17:
	movl	-96(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L18
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movl	$.LC5, %edx
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$-1, %edi
	call	exit
.L18:
	movl	$0, %edi
	call	time
	movl	%eax, %edi
	call	srand
	movl	$0, -104(%rbp)
	jmp	.L19
.L20:
	movl	-104(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	call	random
	movl	%eax, (%rbx)
	addl	$1, -104(%rbp)
.L19:
	movl	-104(%rbp), %eax
	cmpl	-96(%rbp), %eax
	jl	.L20
	movl	-92(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -72(%rbp)
	movl	-92(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	bzero
	leaq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movl	$0, -104(%rbp)
	jmp	.L21
.L23:
	movl	-104(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	-96(%rbp), %edx
	movl	%edx, 16(%rax)
	movq	-64(%rbp), %rax
	movl	-92(%rbp), %edx
	movl	%edx, 20(%rax)
	movq	-64(%rbp), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-64(%rbp), %rax
	movl	-104(%rbp), %edx
	movl	%edx, 24(%rax)
	movq	-64(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$find_max, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create
	testl	%eax, %eax
	je	.L22
	movl	$.LC6, %edi
	call	perror
	movl	$-1, %edi
	call	exit
.L22:
	addl	$1, -104(%rbp)
.L21:
	movl	-104(%rbp), %eax
	cmpl	-92(%rbp), %eax
	jl	.L23
	movl	$0, -104(%rbp)
	jmp	.L24
.L28:
	movl	-104(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join
	cmpl	$0, -104(%rbp)
	je	.L25
	cmpl	$0, -104(%rbp)
	jle	.L26
	movq	-56(%rbp), %rax
	movsd	32(%rax), %xmm0
	ucomisd	-88(%rbp), %xmm0
	jbe	.L26
.L25:
	movq	-56(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -88(%rbp)
	movq	-56(%rbp), %rax
	movl	40(%rax), %eax
	movl	%eax, -100(%rbp)
.L26:
	addl	$1, -104(%rbp)
.L24:
	movl	-104(%rbp), %eax
	cmpl	-92(%rbp), %eax
	jl	.L28
	xorpd	%xmm0, %xmm0
	ucomisd	-88(%rbp), %xmm0
	jp	.L29
	xorpd	%xmm0, %xmm0
	ucomisd	-88(%rbp), %xmm0
	jne	.L29
	movl	$.LC7, %edi
	call	puts
	jmp	.L31
.L29:
	movl	-100(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	-100(%rbp), %edx
	movl	%eax, %esi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
.L31:
	leaq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	imulq	$1000000, %rax, %rdx
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %rax
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	movl	$.LC9, %edi
	movl	$0, %eax
	call	printf
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	free
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
