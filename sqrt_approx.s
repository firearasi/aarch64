.globl sqrt_approx
.type sqrt, @function
sqrt_approx:
	#and sp, sp, 0xFFFFFFFFFFFFFFF0
	sub sp, sp, 64
	stp x29, x30, [sp, 48]
	add x29, sp, 48
	
	str s0, [sp]
	ldr w0, [sp]
	mov w1, 1
	lsl w1, w1, 23
	sub w0, w0, w1
	lsr w0, w0, 1
	mov w1, 1
	lsl w1, w1, 29
	add w0, w0, w1
	str w0, [sp, 8]
	ldr s0, [sp, 8]

	ldp x29, x30, [sp, 48]
	add sp, sp, 64
	ret
