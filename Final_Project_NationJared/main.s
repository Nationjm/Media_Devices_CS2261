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
	ldr	r3, .L15
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r4, .L15+4
	ldr	r3, [r4, #8]
	cmp	r3, r2
	beq	.L4
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #16]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r4, #24]
	blt	.L5
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L13
	ldr	r1, .L15+8
	ldr	r2, .L15+12
	ldr	r1, [r1]
	str	r3, [r4, #8]
	str	r3, [r1, #20]
	strh	r3, [r2, #2]	@ movhi
.L5:
	ldr	r3, .L15+16
	ldr	r2, [r4, #20]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L14
.L3:
	mov	r1, #1
	ldr	r3, .L15
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L4:
	ldr	r2, .L15+20
	ldr	r1, [r2, #8]
	cmp	r1, #0
	beq	.L3
	ldr	r1, [r2, #24]
	ldr	r0, [r2, #16]
	add	r1, r1, #1
	cmp	r1, r0
	str	r1, [r2, #24]
	blt	.L3
	ldr	r0, .L15+8
	ldr	r1, .L15+12
	ldr	r0, [r0]
	str	r3, [r2, #8]
	str	r3, [r0, #32]
	strh	r3, [r1, #6]	@ movhi
	b	.L3
.L14:
	ldr	r3, .L15+24
	mov	lr, pc
	bx	r3
	b	.L3
.L13:
	mov	r2, #7
	ldm	r4, {r0, r1}
	ldr	r3, .L15+28
	mov	lr, pc
	bx	r3
	b	.L5
.L16:
	.align	2
.L15:
	.word	67109376
	.word	song
	.word	dma
	.word	67109120
	.word	state
	.word	soundEffect
	.word	stopSong
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
	ldr	r3, .L19
	mov	lr, pc
	bx	r3
	ldr	r2, .L19+4
	ldr	r3, .L19+8
	strh	r2, [r5]	@ movhi
	ldr	r1, .L19+12
	ldrh	r0, [r3, #48]
	ldr	r2, .L19+16
	ldr	r3, .L19+20
	strh	r0, [r1]	@ movhi
	strh	r4, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r1, #8
	mov	r2, #1
	ldr	r3, .L19+24
	ldr	r0, .L19+28
	ldr	ip, .L19+32
	strh	r1, [r5, #4]	@ movhi
	ldr	r1, .L19+36
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	str	ip, [r0, #4092]
	ldr	r3, .L19+40
	str	r4, [r1]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	.align	2
.L19:
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
	ldr	r4, .L43
	ldr	r3, .L43+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L43+8
	ldrh	r3, [r4]
	ldr	r8, .L43+12
	ldr	r7, .L43+16
	ldr	fp, .L43+20
	ldr	r10, .L43+24
	ldr	r9, .L43+28
	ldr	r6, .L43+32
.L31:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r6, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	ldr	r3, [r7]
	cmp	r3, #8
	ldrls	pc, [pc, r3, asl #2]
	b	.L32
.L25:
	.word	.L30
	.word	.L29
	.word	.L28
	.word	.L32
	.word	.L32
	.word	.L32
	.word	.L27
	.word	.L26
	.word	.L24
.L26:
	ldr	r3, .L43+36
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	bne	.L38
.L32:
	ldrh	r3, [r4]
	b	.L31
.L24:
	ldr	r3, .L43+40
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L32
.L38:
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L31
	ldr	r3, .L43+44
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L31
.L27:
	mov	lr, pc
	bx	r9
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L32
	ldrh	r3, [r4]
	tst	r3, #4
	bne	.L31
.L41:
	ldr	r3, .L43+48
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L31
.L28:
	ldr	r3, .L43+52
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L32
	ldrh	r3, [r4]
	tst	r3, #4
	bne	.L31
	ldr	r3, .L43+56
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L31
.L29:
	mov	lr, pc
	bx	r10
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L32
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L31
	b	.L41
.L30:
	mov	lr, pc
	bx	fp
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L32
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L31
	ldr	r3, .L43+60
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L31
.L44:
	.align	2
.L43:
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	waitForVBlank
	.word	state
	.word	start
	.word	instructions
	.word	pause
	.word	67109120
	.word	win
	.word	lose
	.word	goToStart
	.word	goToKaido1
	.word	kaido1
	.word	goToPause
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
	ldr	r3, .L47
	ldr	r1, .L47+4
	ldr	r0, .L47+8
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	str	r0, [r1, #4092]
	ldr	lr, [sp], #4
	bx	lr
.L48:
	.align	2
.L47:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	state,4,4
	.comm	STATE,1,1
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	soundEffect,28,4
	.comm	song,28,4
	.comm	fireball,36,4
	.comm	kaido,52,4
	.comm	luffyFist,20,4
	.comm	luffy,64,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
