	.arch armv8-a
	.file	"hello.c"
	.text
	.section	.rodata
	.align	3
.LCPrompt:
	.string	"Input two numbers:";
.LCScanf:
	.string	"%lld %lld";
.LCL:
	.string	"Less\n";
.LCE:
	.string	"Equal\n";
.LCG:
	.string	"Greater\n";
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
    ldr x0, [sp]
    ldr x1, [sp, 8]
	bl compare

	ldp	x29, x30, [sp, 48]
    add sp, sp, 64
	ret

	.global	compare
	.type	compare, %function
compare:
	sub sp, sp, 32
	stp x29, x30, [sp, 16]
	add x29, sp, 16
	adrp	x4, .LCE
	add	x4, x4, :lo12:.LCE

	adrp	x6, .LCG
	add	x6, x6, :lo12:.LCG
	adrp	x8, .LCL
	add	x8, x8, :lo12:.LCL

	cmp x0,x1
	csel x0, x4, x6, eq
	csel x0, x6, x0, gt
	csel x0, x8, x0, lt

	bl puts

	ldp x29, x30, [sp, 16]
	add sp, sp, 32
	ret
.LFE0:
	.size	main, .-main
