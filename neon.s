.text
.section .rodata
.LC0:
    .string "%u\n"
.text
.global main
.type	main, @function

main:
    stp x29, x30, [sp, -16]!
    mov x29, sp
    sub sp, sp, 32

    
    mov x10, 4
    mov w0, 0
    mov w2, 4 
    mov x1, sp
    add x3, sp, 16
    
loop1:
    add w0, w0, 1
    add w2, w2, 1
    str w0, [x1], 4
    str w2, [x3], 4
    sub x10, x10, 1
    tst x10, x10
    b.ne loop1

    adrp x0, .LC0
    add x0, x0, :lo12:.LC0

    ldr q0, [sp]
    add x5, sp, 16
    ldr q1, [x5]
    add v0.2D, v0.2D, v1.2D
    sub sp, sp, 16
    str q0, [sp]


    

    add sp, sp, 48
    ldp x29, x30, [sp], 16
    ret
