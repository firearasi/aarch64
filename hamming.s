.text
.section .rodata
.LC0:
	.string "Input an unsigned long long int:\n"
.LC1:
	.string "%lld"
.LC2:
	.string "Hamming of %lld is %lld\n"
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

#compute hamming
	ldr x0, [sp]
	bl hamming

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

.globl hamming
.type hamming, @function
hamming:
.cfi_startproc
	eor x2, x2, x2
	b .hamming.check
.hamming.loop:
	add x2, x2, 1 
		#add one to the result
	sub x1, x0, 1
	and x0, x0, x1 
		# x0 = x0 & (x0 - 1)
.hamming.check:
	cmp x0,0
	b.ne .hamming.loop
	
	mov x0, x2
	ret
.cfi_endproc
