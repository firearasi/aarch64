.global add_neon
.type add_neon, @function


#void add_neon(uint32_t size, uint32_t *a, uint32_t *b, uint32_t *c);

#void add_neon(uint32_t size, uint32_t *a, uint32_t *b, uint32_t *c);
#x0 #x19 size
#x1 #x20 a
#x2 #x21 b
#x3 #x22 c
add_neon:
	sub sp, sp, 128
	stp x29, x30, [sp,  112]
	add x29, sp, 112
	stp x19, x20, [sp, 96]
	stp x21, x22, [sp, 80]
	stp x24, x26, [sp, 64]

	mov x19, x0
	mov x20, x1
	mov x21, x2
	mov x22, x3
	
	mov x4, x19
	lsr x4, x4, 2
	lsl x4, x4, 2
	subs x5, x19, x4
	b.eq .add_neon_L1
	mov x0, x5
	add x1, x1, x4, lsl 2
	add x2, x2, x4, lsl 2
	add x3, x3, x4, lsl 2
	bl add_byte
	mov x19, x4
	b .add_neon_L1
.add_neon_L0:
	ldr q0, [x20], 16
	ldr q1, [x21], 16
	add v0.4S, v0.4S, v1.4S
	str q0, [x22], 16
	sub x19, x19, 4
.add_neon_L1:
	tst x19, x19
	b.ne .add_neon_L0

	ldp x19, x20, [sp, 96]
	ldp x21, x22, [sp, 80]
	ldp x24, x26, [sp, 64]
	ldp x29, x30, [sp,  112]
	add sp, sp, 128

    ret


.global add_byte
#void add_byte(uint32_t size, uint32_t *a, uint32_t *b, uint32_t *c);
#x0 #x19 size
#x1 #x20 a
#x2 #x21 b
#x3 #x22 c
add_byte:
	sub sp, sp, 128
	stp x29, x30, [sp,  112]
	add x29, sp, 112
	stp x19, x20, [sp, 96]
	stp x21, x22, [sp, 80]
	stp x24, x26, [sp, 64]

	mov x19, x0
	mov x20, x1
	mov x21, x2
	mov x22, x3
	b .add_byte.L1
.add_byte.L0:
	sub x19, x19, 1
	ldr w24, [x20], 4
	ldr w26, [x21], 4
	add w24, w24, w26
	str w24, [x22], 4

.add_byte.L1:
	tst x19, x19
	b.ne .add_byte.L0

	ldp x19, x20, [sp, 96]
	ldp x21, x22, [sp, 80]
	ldp x24, x26, [sp, 64]
	ldp x29, x30, [sp,  112]
	add sp, sp, 128

    ret
