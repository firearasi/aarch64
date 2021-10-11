	.text
	.file	"hello.c"
	.globl	f                               // -- Begin function f
	.p2align	2
	.type	f,@function
f:                                      // @f
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #16                     // =16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	ldr	x9, [sp, #8]
	mul	x8, x8, x9
	ldr	x9, [sp]
	ldr	x10, [sp]
	mul	x9, x9, x10
	add	x0, x8, x9
	add	sp, sp, #16                     // =16
	ret
.Lfunc_end0:
	.size	f, .Lfunc_end0-f
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #64                     // =64
	stp	x29, x30, [sp, #48]             // 16-byte Folded Spill
	add	x29, sp, #48                    // =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, wzr
	str	w8, [sp, #12]                   // 4-byte Folded Spill
	stur	wzr, [x29, #-4]
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	add	x1, sp, #32                    // =16
	add	x2, sp, #24                     // =24
	bl	scanf
	ldr	x0, [sp, #32]
	ldr	x1, [sp, #24]
	bl	f
	str	x0, [sp, #16]
	ldr	x1, [sp, #32]
	ldr	x2, [sp, #24]
	ldr	x3, [sp, #16]
	adrp	x0, .L.str.1
	add	x0, x0, :lo12:.L.str.1
	bl	printf
	ldr	w0, [sp, #12]                   // 4-byte Folded Reload
	ldp	x29, x30, [sp, #48]             // 16-byte Folded Reload
	add	sp, sp, #64                     // =64
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%ld %ld"
	.size	.L.str, 8

	.type	.L.str.1,@object                // @.str.1
.L.str.1:
	.asciz	"Sqr sum of %ld and %ld is %ld\n"
	.size	.L.str.1, 31

	.ident	"clang version 12.0.1"
	.section	".note.GNU-stack","",@progbits
