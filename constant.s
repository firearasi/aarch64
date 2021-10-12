.text
.section .rodata
.LC0:
    .string "The constant is 0x%llx\n"

.text
.global main
.type main, @function
main:
    sub sp, sp, 64
    stp x29, x30, [sp, 48]
    add x29, sp, 48

    mov x0, 0xFFFF
    movk x0, 0xEEEE, lsl 16
    movk x0, 0xDDDD, lsl 32
    movk x0, 0xCCCC, lsl 48

    mov x1, x0
    adrp x0, .LC0
    add x0, x0, :lo12:.LC0
    bl printf
    

    ldp x29, x30, [sp, 48]
    add sp, sp, 48
    ret
