.text
.section .rodata
.LC0:
	.string "The register is %lld\n"
.text
.globl main
.type main, @function

main:
#prologue
	sub sp, sp, 64
	stp x29, x30, [sp, 48]
	add x29, sp, 48

    adrp	x0, .LC0
    add x0, x0, :lo12:.LC0
    mrs x1, CNTFRQ_EL0
    bl printf

	ldp x29, x30, [sp, 48]
	add sp, sp, 64
	ret
