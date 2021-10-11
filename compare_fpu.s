	.arch armv8-a
	.file	"hello.c"
	.text
	.section	.rodata
	.align	3
.LCPrompt:
	.string	"Input two numbers:";
.LCScanf:
	.string	"%llf %llf";
.LCL:
	.string	"%llf is less than %llf\n";
.LCE:
	.string	"%llf is equal to %llf\n";
.LCG:
	.string	"%llf is greater than %llf\n";
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
#comment
    sub sp, sp, 64
	stp	x29, x30, [sp, 48]
    add x29, sp, 48

#prompt
	adrp	x0, .LCPrompt
	add	x0, x0, :lo12:.LCPrompt
	bl	printf
#scanf inputs [sp] [sp, 8]
	adrp	x0, .LCScanf
	add	x0, x0, :lo12:.LCScanf
    mov x1, sp
    add x2, sp, 8
    bl scanf
    
#compare
    ldr d0, [sp]
    ldr d1, [sp, 8]
	bl compare

epilogue:
	ldp	x29, x30, [sp, 48]
    add sp, sp, 64
	ret

	.global	compare
	.type	compare, %function
compare:
	sub sp, sp, 32
	stp x29, x30, [sp, 16]
	add x29, sp, 16
    fcmp d0, d1
    b.ne .L2
	adrp	x0, .LCE
	add	x0, x0, :lo12:.LCE
	b .L4
.L2:
    fcmp d0, d1
    b.lt .L3

	adrp	x0, .LCG
	add	x0, x0, :lo12:.LCG
	b .L4
.L3:
	adrp	x0, .LCL
	add	x0, x0, :lo12:.LCL
	b .L4
.L4:
	fmov x1, d0
	fmov x2, d1
	fmov d2, d1
    bl printf
	ldp x29, x30, [sp, 16]
	add sp, sp, 32
	ret
.LFE0:
	.size	main, .-main
