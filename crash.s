	.text
	.file	"crash.c"
	.globl	alter_string                    // -- Begin function alter_string
	.p2align	2
	.type	alter_string,@function
alter_string:                           // @alter_string
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #32                     // =32
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	add	x29, sp, #16                    // =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	adrp	x1, .L.str
	add	x1, x1, :lo12:.L.str
	bl	strcpy
	ldr	x1, [sp, #8]
	adrp	x0, .L.str.1
	add	x0, x0, :lo12:.L.str.1
	bl	printf
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	add	sp, sp, #32                     // =32
	ret
.Lfunc_end0:
	.size	alter_string, .Lfunc_end0-alter_string
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	stp	x29, x30, [sp, #-16]!           // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	bl	alter_string
	mov	w0, wzr
	ldp	x29, x30, [sp], #16             // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Goodbye!"
	.size	.L.str, 9

	.type	.L.str.1,@object                // @.str.1
.L.str.1:
	.asciz	"Result: %s\n"
	.size	.L.str.1, 12

	.type	.L.str.2,@object                // @.str.2
.L.str.2:
	.asciz	"Hello, world!\n"
	.size	.L.str.2, 15

	.ident	"clang version 12.0.1"
	.section	".note.GNU-stack","",@progbits
