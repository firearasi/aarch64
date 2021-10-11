	.text
	.file	"point.c"
	.globl	dist                            // -- Begin function dist
	.p2align	2
	.type	dist,@function
dist:                                   // @dist
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #16                     // =16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	ldr	d0, [x8]
	ldr	x8, [sp, #8]
	ldr	d1, [x8]
	fmul	d0, d0, d1
	ldr	x8, [sp]
	ldr	d1, [x8, #8]
	ldr	x8, [sp]
	ldr	d2, [x8, #8]
	fmul	d1, d1, d2
	fadd	d0, d0, d1
	fsqrt	d0, d0
	add	sp, sp, #16                     // =16
	ret
.Lfunc_end0:
	.size	dist, .Lfunc_end0-dist
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #80                     // =80
	stp	fp, lr, [sp, #64]             // 16-byte Folded Spill
	add	fp, sp, #64                    // =64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, wzr
	str	w8, [sp, #12]                   // 4-byte Folded Spill
	stur	wzr, [fp, #-4]
	sub	x0, fp, #24                    // =24
	mov	x8, #-7378697629483820647
	movk	x8, #39322
	movk	x8, #16369, lsl #48
	stur	x8, [fp, #-24]
	mov	x8, #25690
	movk	x8, #57147, lsl #16
	movk	x8, #36175, lsl #32
	movk	x8, #16371, lsl #48
	stur	x8, [fp, #-16]
	add	x1, sp, #24                     // =24
	mov	x8, #39322
	movk	x8, #39321, lsl #16
	movk	x8, #22937, lsl #32
	movk	x8, #49207, lsl #48
	str	x8, [sp, #24]
	mov	x8, #55050
	movk	x8, #28835, lsl #16
	movk	x8, #43581, lsl #32
	movk	x8, #49224, lsl #48
	str	x8, [sp, #32]
	bl	dist
	str	d0, [sp, #16]
	ldr	d0, [sp, #16]
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	ldr	w0, [sp, #12]                   // 4-byte Folded Reload
	ldp	fp, lr, [sp, #64]             // 16-byte Folded Reload
	add	sp, sp, #80                     // =80
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Distance is %f"
	.size	.L.str, 15

	.ident	"clang version 12.0.1"
	.section	".note.GNU-stack","",@progbits
