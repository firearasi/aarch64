.text
.section .rodata
.LC0:
    .string "You successfully called this function\n"

.text
.global main
.type main, @function
main:
    sub sp, sp, 64
    stp x29, x30, [sp, 48]
    add x29, sp, 48

    adrp x2, f
    add x2, x2, :lo12:f
    blr x2

    ldp x29, x30, [sp, 48]
    add sp, sp, 64
    ret

.global f
.type f, @function
f:
    adrp x0, .LC0
    add	x0, x0, :lo12:.LC0
    b printf
    
