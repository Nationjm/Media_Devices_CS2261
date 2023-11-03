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
	mov	ip, #0
	ldr	r3, .L13
	ldrh	r2, [r3, #2]
	tst	r2, #1
	push	{r4, lr}
	strh	ip, [r3, #8]	@ movhi
	bne	.L12
.L2:
	ldr	r3, .L13
	ldrh	r3, [r3, #2]
	tst	r3, #4096
	movne	r2, #1
	mov	r1, #1
	ldrne	r3, .L13+4
	strne	r2, [r3]
	ldr	r3, .L13
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L12:
	ldr	r0, .L13+8
	ldr	r3, [r0]
	ldr	lr, .L13+12
	add	r3, r3, #1
	str	r3, [r0]
	mov	r2, #1
	mov	r1, #80
	mov	r0, #120
	ldr	r3, .L13+16
	str	ip, [lr]
	mov	lr, pc
	bx	r3
	b	.L2
.L14:
	.align	2
.L13:
	.word	67109376
	.word	logFrames
	.word	vBlanks
	.word	waitingForVBlank
	.word	setPixel4
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	ip, #8
	mov	r1, #1
	ldr	r3, .L17
	str	lr, [sp, #-4]!
	ldr	r0, .L17+4
	strh	ip, [r2, #4]	@ movhi
	ldr	lr, .L17+8
	strh	r1, [r3, #8]	@ movhi
	ldr	r2, .L17+12
	ldr	r1, .L17+16
	add	ip, ip, #16384
	strh	lr, [r3]	@ movhi
	strh	ip, [r0, #50]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #4092]
	bx	lr
.L18:
	.align	2
.L17:
	.word	67109376
	.word	67109120
	.word	4097
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
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
	push	{r4, lr}
	mov	r2, #83886080
	mov	r4, #67108864
	mvn	r1, #48128
	ldr	r3, .L21
	strh	r1, [r2, #2]	@ movhi
	strh	r3, [r4]	@ movhi
	ldr	r3, .L21+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	ip, #8
	mov	r1, #1
	ldr	r3, .L21+8
	ldr	r0, .L21+12
	str	r2, [r3]
	ldr	r3, .L21+16
	str	r2, [r0]
	ldr	lr, .L21+20
	strh	ip, [r4, #4]	@ movhi
	ldr	r0, .L21+24
	strh	r1, [r3, #8]	@ movhi
	ldr	r2, .L21+28
	ldr	r1, .L21+32
	add	ip, ip, #16384
	strh	lr, [r3]	@ movhi
	strh	ip, [r0, #50]	@ movhi
	pop	{r4, lr}
	str	r1, [r2, #4092]
	bx	lr
.L22:
	.align	2
.L21:
	.word	1028
	.word	mgba_open
	.word	vBlanks
	.word	logFrames
	.word	67109376
	.word	4097
	.word	67109120
	.word	50360320
	.word	interruptHandler
	.size	initialize, .-initialize
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"vBlanks: %d\000"
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L33
	mov	lr, pc
	bx	r3
	mov	r10, #0
	ldr	r8, .L33+4
	ldr	r5, .L33+8
	ldr	r6, .L33+12
	ldr	r9, .L33+16
	ldr	r4, .L33+20
	ldr	r7, .L33+24
	ldr	fp, .L33+28
.L26:
	ldrh	r3, [r5]
	strh	r3, [r8]	@ movhi
	ldr	r1, [r6]
	ldrh	r3, [r7, #48]
	cmp	r1, #0
	strh	r3, [r5]	@ movhi
	bne	.L32
.L24:
	mov	r3, #1
	str	r3, [r4]
.L25:
	.syntax divided
@ 31 "main.c" 1
	swi 0x04 << 15
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L25
	b	.L26
.L32:
	mov	r0, fp
	ldr	r1, [r9]
	ldr	r3, .L33+32
	mov	lr, pc
	bx	r3
	str	r10, [r6]
	b	.L24
.L34:
	.align	2
.L33:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	logFrames
	.word	vBlanks
	.word	waitingForVBlank
	.word	67109120
	.word	.LC0
	.word	mgba_printf
	.size	main, .-main
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	waitingForVBlank,4,4
	.comm	logFrames,4,4
	.comm	vBlanks,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
