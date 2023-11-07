	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L11
	ldrh	r1, [r3, #2]
	tst	r1, #8
	strh	r2, [r3, #8]	@ movhi
	beq	.L2
	ldr	r0, .L11+4
	ldr	r3, [r0]
	ldr	r1, .L11+8
	add	r3, r3, #1
	smull	r2, r1, r3, r1
	asr	r2, r3, #31
	add	r1, r1, r3
	rsb	r2, r2, r1, asr #5
	rsb	r2, r2, r2, lsl #4
	sub	r3, r3, r2, lsl #2
	str	r3, [r0]
.L2:
	ldr	r3, .L11
	ldrh	r3, [r3, #2]
	tst	r3, #16
	beq	.L3
	mvn	r0, #59
	ldr	r2, .L11+12
	ldr	r3, [r2]
	ldr	r1, .L11+16
	add	r3, r3, #1
	str	r3, [r2]
	strh	r0, [r1, #4]	@ movhi
.L3:
	mov	r1, #1
	ldr	r3, .L11
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	bx	lr
.L12:
	.align	2
.L11:
	.word	67109376
	.word	seconds
	.word	-2004318071
	.word	minutes
	.word	67109120
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L15
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L15+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L15+12
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #7936
	strh	r3, [r2]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #16384
	ldr	r2, .L15+16
	ldr	r1, .L15+20
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r4, #83886080
	mov	r5, #31
	mov	r2, #194
	mvn	r1, #59
	mov	lr, #196
	mov	ip, #24
	mov	r0, #1
	strh	r3, [r4]	@ movhi
	add	r4, r4, #512
	strh	r5, [r4, #2]	@ movhi
	ldr	r4, .L15+24
	str	r3, [r4]
	ldr	r4, .L15+28
	str	r3, [r4]
	ldr	r3, .L15+32
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r2, .L15+36
	strh	lr, [r3, #6]	@ movhi
	ldr	r1, .L15+40
	ldr	r3, .L15+44
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	pop	{r4, r5, r6, lr}
	str	r3, [r1, #4092]
	bx	lr
.L16:
	.align	2
.L15:
	.word	mgba_open
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	100728832
	.word	numbersTiles
	.word	minutes
	.word	seconds
	.word	67109120
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	initialize, .-initialize
	.align	2
	.global	setupTimers
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupTimers, %function
setupTimers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #194
	mvn	r1, #59
	mov	lr, #196
	mov	ip, #24
	mov	r0, #1
	ldr	r3, .L19
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r2, .L19+4
	strh	lr, [r3, #6]	@ movhi
	ldr	r1, .L19+8
	ldr	r3, .L19+12
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	ldr	lr, [sp], #4
	str	r3, [r1, #4092]
	bx	lr
.L20:
	.align	2
.L19:
	.word	67109120
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupTimers, .-setupTimers
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L23
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r2, [r3]
	ldr	r5, .L23+4
	smull	r1, r8, r5, r2
	ldr	r3, .L23+8
	ldr	r3, [r3]
	smull	r1, r5, r3, r5
	asr	r6, r2, #31
	rsb	r0, r6, r8, asr #2
	add	r1, r0, r0, lsl #2
	sub	r2, r2, r1, lsl #1
	rsbs	r1, r0, #0
	and	r1, r1, #7
	and	lr, r0, #7
	rsbpl	lr, r1, #0
	cmp	r2, #0
	asr	r7, r3, #31
	add	r0, r2, #7
	movge	r0, r2
	rsbs	r1, r2, #0
	rsb	ip, r7, r5, asr #2
	and	r1, r1, #7
	and	r2, r2, #7
	rsbpl	r2, r1, #0
	rsbs	r4, ip, #0
	add	r1, ip, ip, lsl #2
	sub	r3, r3, r1, lsl #1
	and	r4, r4, #7
	and	r1, ip, #7
	rsbpl	r1, r4, #0
	cmp	r3, #0
	add	r4, r3, #7
	movge	r4, r3
	mov	ip, #264
	asr	r0, r0, #3
	rsb	r6, r6, r8, asr #5
	add	r0, r2, r0, lsl #6
	rsbs	r2, r3, #0
	add	lr, lr, r6, lsl #6
	and	r2, r2, #7
	and	r3, r3, #7
	lsl	lr, lr, #2
	rsbpl	r3, r2, #0
	ldr	r2, .L23+12
	rsb	r5, r7, r5, asr #5
	asr	r4, r4, #3
	and	lr, lr, #1020
	lsl	r0, r0, #2
	add	r1, r1, r5, lsl #6
	add	r3, r3, r4, lsl #6
	and	r0, r0, #1020
	ldr	r4, .L23+16
	strh	lr, [r2, #4]	@ movhi
	ldr	lr, .L23+20
	ldr	r5, .L23+24
	strh	r0, [r2, #12]	@ movhi
	lsl	r1, r1, #2
	ldr	r0, .L23+28
	lsl	r3, r3, #2
	strh	r4, [r2, #2]	@ movhi
	strh	lr, [r2, #10]	@ movhi
	add	r4, r4, #140
	add	lr, lr, #34
	and	r1, r1, #1020
	and	r3, r3, #1020
	strh	r5, [r2, #18]	@ movhi
	strh	r4, [r2, #26]	@ movhi
	strh	lr, [r2, #34]	@ movhi
	strh	r1, [r2, #20]	@ movhi
	strh	r3, [r2, #28]	@ movhi
	strh	ip, [r2, #36]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	r0, [r2, #16]	@ movhi
	strh	r0, [r2, #24]	@ movhi
	strh	r0, [r2, #32]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	minutes
	.word	1717986919
	.word	seconds
	.word	shadowOAM
	.word	-16350
	.word	-16310
	.word	-16250
	.word	-32720
	.size	update, .-update
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, lr}
	ldr	r3, .L28
	mov	lr, pc
	bx	r3
	ldr	r7, .L28+4
	ldr	r6, .L28+8
	ldr	r5, .L28+12
	ldr	r4, .L28+16
.L26:
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r4
	mov	r0, #3
	mov	lr, pc
	bx	r5
	b	.L26
.L29:
	.align	2
.L28:
	.word	initialize
	.word	update
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	main, .-main
	.comm	minutes,4,4
	.comm	seconds,4,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
