.globl hamming
.type hamming, @function
hamming:
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
