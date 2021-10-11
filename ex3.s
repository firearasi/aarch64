	.text
	.file	"ex3.c"
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #32                     // =32
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	add	x29, sp, #16                    // =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	adrp	x0, .L.str.1
	add	x0, x0, :lo12:.L.str.1
	add	x1, sp, #8                      // =8
	bl	scanf
	subs	w8, w0, #1                      // =1
	beq	.LBB0_2
	adrp	x0, .L.str.3
	add	x0, x0, :lo12:.L.str.3
	bl	printf
	b	.LBB0_3
.LBB0_2:
// %bb.1:
	ldr	w1, [sp, #8]
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	bl	printf
.LBB0_3:
	mov	w0, wzr
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	add	sp, sp, #32                     // =32
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Enter X:\n"
	.size	.L.str, 10

	.type	.L.str.1,@object                // @.str.1
.L.str.1:
	.asciz	"%d"
	.size	.L.str.1, 3

	.type	.L.str.2,@object                // @.str.2
.L.str.2:
	.asciz	"You entered %d...\n"
	.size	.L.str.2, 19

	.type	.L.str.3,@object                // @.str.3
.L.str.3:
	.asciz	"What you entered? Huh?\n"
	.size	.L.str.3, 24

	.ident	"clang version 12.0.1"
	.section	".note.GNU-stack","",@progbits
