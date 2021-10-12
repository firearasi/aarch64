.text
.section .rodata
.LC0:
	.string "Input an unsigned long long int:\n"
.LC1:
	.string "%lld"
.LC2:
	.string "factorial of %lld is %lld\n"
.text
.globl main
.type main, @function

main:
#prologue
	sub sp, sp, 64
	stp x29, x30, [sp, 48]
	add x29, sp, 48

#prompt
	adrp x0, .LC0
	add x0, x0, :lo12:.LC0
	bl printf

#get input
	adrp x0, .LC1
	add x0, x0, :lo12:.LC1
	mov x1, sp
	bl scanf
	# Now the input is in [sp]

#compute factorial
	ldr x0, [sp]
	bl factorial

#show result
	mov x2, x0
	adrp x0, .LC2
	add x0, x0, :lo12:.LC2
	ldr x1, [sp]
	bl printf 

#epilogue
	ldp x29, x30, [sp, 48]
	add sp, sp, 64
	ret

.globl factorial
.type factorial, @function
factorial:
    cmp x0, 1
    b.ne .factorial.not1
    ret
.factorial.not1:
    sub sp, sp, 32
    stp x29, x30, [sp, 16]
    str x1, [sp, 8]
    add x29, sp, 32

    mov x1, x0
    sub x0, x0, 1
    bl factorial
    mul x0, x0, x1

    ldr x1, [sp, 8]
    ldp x29, x30, [sp, 16]
    add sp, sp, 32

	ret
