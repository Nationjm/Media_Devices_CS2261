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
	mov	r2, #0
	ldr	r3, .L12
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r3, .L12+4
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L3
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	blt	.L3
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L11
	ldr	r0, .L12+8
	ldr	r1, .L12+12
	ldr	r0, [r0]
	str	r2, [r3, #8]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L3:
	mov	r1, #1
	ldr	r3, .L12
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L11:
	ldm	r3, {r0, r1}
	ldr	r3, .L12+16
	mov	lr, pc
	bx	r3
	b	.L3
.L13:
	.align	2
.L12:
	.word	67109376
	.word	song
	.word	dma
	.word	67109120
	.word	playSong
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
	mov	r5, #67108864
	mov	r4, #0
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	ldr	r2, .L16+4
	ldr	r3, .L16+8
	strh	r2, [r5]	@ movhi
	ldr	r1, .L16+12
	ldrh	r0, [r3, #48]
	ldr	r2, .L16+16
	ldr	r3, .L16+20
	strh	r0, [r1]	@ movhi
	strh	r4, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r1, #8
	mov	r2, #1
	ldr	r3, .L16+24
	ldr	r0, .L16+28
	ldr	ip, .L16+32
	strh	r1, [r5, #4]	@ movhi
	ldr	r1, .L16+36
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	str	ip, [r0, #4092]
	ldr	r3, .L16+40
	str	r4, [r1]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	mgba_open
	.word	1044
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	setupSounds
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.word	state
	.word	goToStart
	.size	initialize, .-initialize
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
	ldr	r3, .L40
	mov	lr, pc
	bx	r3
	ldr	r4, .L40+4
	ldr	r2, .L40+8
	ldrh	r3, [r4]
	ldr	fp, [r2]
	ldr	r5, .L40+12
	ldr	r10, .L40+16
	ldr	r9, .L40+20
	ldr	r8, .L40+24
	ldr	r7, .L40+28
	ldr	r6, .L40+32
.L28:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r7, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r10
	mov	r1, fp
	mov	r0, r6
	mov	lr, pc
	bx	r9
	ldr	r3, [r8]
	cmp	r3, #8
	ldrls	pc, [pc, r3, asl #2]
	b	.L29
.L22:
	.word	.L27
	.word	.L26
	.word	.L25
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L24
	.word	.L23
	.word	.L21
.L23:
	ldr	r3, .L40+36
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #4
	bne	.L35
.L29:
	ldrh	r3, [r4]
	b	.L28
.L21:
	ldr	r3, .L40+40
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L29
.L35:
	ldrh	r3, [r4]
	tst	r3, #4
	bne	.L28
	ldr	r3, .L40+44
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L28
.L24:
	ldr	r3, .L40+48
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L29
	ldrh	r3, [r4]
	tst	r3, #4
	bne	.L28
.L38:
	ldr	r3, .L40+52
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L28
.L25:
	ldr	r3, .L40+56
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L29
	ldrh	r3, [r4]
	tst	r3, #4
	bne	.L28
	ldr	r3, .L40+60
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L28
.L26:
	ldr	r3, .L40+64
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L29
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L28
	b	.L38
.L27:
	ldr	r3, .L40+68
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L29
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L28
	ldr	r3, .L40+72
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L28
.L41:
	.align	2
.L40:
	.word	initialize
	.word	buttons
	.word	BinksBrew_length
	.word	oldButtons
	.word	waitForVBlank
	.word	playSong
	.word	state
	.word	67109120
	.word	BinksBrew_data
	.word	win
	.word	lose
	.word	goToStart
	.word	pause
	.word	goToKaido1
	.word	kaido1
	.word	goToPause
	.word	instructions
	.word	start
	.word	goToInstructions
	.size	main, .-main
	.text
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
	str	lr, [sp, #-4]!
	mov	r2, #1
	mov	lr, #8
	mov	ip, #67108864
	ldr	r3, .L44
	ldr	r1, .L44+4
	ldr	r0, .L44+8
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	str	r0, [r1, #4092]
	ldr	lr, [sp], #4
	bx	lr
.L45:
	.align	2
.L44:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	state,4,4
	.comm	STATE,1,1
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	soundEffect,24,4
	.comm	song,24,4
	.comm	fireball,24,4
	.comm	kaido,52,4
	.comm	luffy,64,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
