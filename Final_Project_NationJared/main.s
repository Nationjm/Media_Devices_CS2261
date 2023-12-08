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
	ldr	r3, .L24
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, r5, r6, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r4, .L24+4
	ldr	r3, [r4, #8]
	cmp	r3, r2
	beq	.L5
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #16]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r4, #24]
	blt	.L6
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L20
	ldr	r1, .L24+8
	ldr	r2, .L24+12
	ldr	r1, [r1]
	str	r3, [r4, #8]
	str	r3, [r1, #20]
	strh	r3, [r2, #2]	@ movhi
.L6:
	ldr	r5, .L24+16
	ldr	r2, [r4, #20]
	ldr	r3, [r5]
	cmp	r2, r3
	cmpne	r3, #6
	bne	.L21
.L8:
	cmp	r3, #6
	beq	.L22
.L5:
	ldr	r3, .L24+20
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L3
	ldr	r2, [r3, #24]
	ldr	r1, [r3, #16]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #24]
	blt	.L11
	mov	r2, #0
	ldr	r0, .L24+8
	ldr	r1, .L24+12
	ldr	r0, [r0]
	str	r2, [r3, #8]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
.L11:
	ldr	r3, .L24+16
	ldr	r3, [r3]
	sub	r3, r3, #2
	cmp	r3, #1
	bhi	.L23
.L3:
	mov	r1, #1
	ldr	r3, .L24
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	ldr	r3, .L24+24
	mov	lr, pc
	bx	r3
	b	.L3
.L21:
	ldr	r3, .L24+28
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	b	.L8
.L22:
	ldr	r3, .L24+32
	mov	lr, pc
	bx	r3
	b	.L5
.L20:
	mov	r2, #7
	ldm	r4, {r0, r1}
	ldr	r3, .L24+36
	mov	lr, pc
	bx	r3
	b	.L6
.L25:
	.align	2
.L24:
	.word	67109376
	.word	song
	.word	dma
	.word	67109120
	.word	state
	.word	soundEffect
	.word	stopSoundEffect
	.word	stopSong
	.word	pauseSong
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
	ldr	r3, .L28
	mov	lr, pc
	bx	r3
	ldr	r2, .L28+4
	ldr	r3, .L28+8
	strh	r2, [r5]	@ movhi
	ldr	r1, .L28+12
	ldrh	r0, [r3, #48]
	ldr	r2, .L28+16
	ldr	r3, .L28+20
	strh	r0, [r1]	@ movhi
	strh	r4, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r1, #8
	mov	r2, #1
	ldr	r3, .L28+24
	ldr	r0, .L28+28
	ldr	ip, .L28+32
	strh	r1, [r5, #4]	@ movhi
	ldr	r1, .L28+36
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	str	ip, [r0, #4092]
	ldr	r3, .L28+40
	str	r4, [r1]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	.align	2
.L28:
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
	ldr	r4, .L63
	ldr	r3, .L63+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L63+8
	ldrh	r3, [r4]
	ldr	r8, .L63+12
	ldr	r7, .L63+16
	ldr	fp, .L63+20
	ldr	r10, .L63+24
	ldr	r9, .L63+28
	ldr	r6, .L63+32
.L42:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r6, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	ldr	r3, [r7]
	cmp	r3, #9
	ldrls	pc, [pc, r3, asl #2]
	b	.L43
.L34:
	.word	.L41
	.word	.L40
	.word	.L39
	.word	.L38
	.word	.L43
	.word	.L43
	.word	.L37
	.word	.L36
	.word	.L35
	.word	.L33
.L36:
	ldr	r3, .L63+36
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	bne	.L52
.L43:
	ldrh	r3, [r4]
	b	.L42
.L33:
	ldr	r3, .L63+40
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L43
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L42
	ldr	r3, .L63+44
	mov	r2, #3
	ldr	r1, [r3]
	ldr	r0, .L63+48
	ldr	r3, .L63+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+68
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+72
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L42
.L35:
	ldr	r3, .L63+76
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L43
.L52:
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L42
	ldr	r3, .L63+80
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L42
.L37:
	ldr	r3, .L63+84
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L43
	ldrh	r3, [r4]
	tst	r3, #4
	bne	.L42
	ldr	r2, .L63+88
	ldr	r2, [r2]
	cmp	r2, #2
	beq	.L61
	cmp	r2, #3
	bne	.L42
	ldr	r3, .L63+92
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+72
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L42
.L38:
	ldr	r3, .L63+96
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r9
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L43
	ldrh	r3, [r4]
	tst	r3, #4
	bne	.L42
	mov	r2, #3
	ldr	r3, .L63+88
	str	r2, [r3]
	ldr	r3, .L63+100
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L42
.L39:
	ldr	r3, .L63+104
	mov	lr, pc
	bx	r3
	ldrh	r2, [r5]
	tst	r2, #4
	ldrh	r3, [r4]
	beq	.L49
	tst	r3, #4
	beq	.L62
.L49:
	tst	r2, #256
	beq	.L42
	tst	r3, #768
	bne	.L42
	mov	lr, pc
	bx	r9
	ldrh	r3, [r4]
	b	.L42
.L40:
	mov	lr, pc
	bx	r10
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L43
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L42
	ldr	r3, .L63+44
	mov	r2, #2
	ldr	r1, [r3]
	ldr	r0, .L63+48
	ldr	r3, .L63+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+108
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+60
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L42
.L41:
	mov	lr, pc
	bx	fp
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L43
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L42
	ldr	r3, .L63+112
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L42
.L62:
	mov	r3, #2
	ldr	r2, .L63+88
	str	r3, [r2]
	ldr	r3, .L63+100
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	ldrh	r2, [r5]
	b	.L49
.L61:
	ldr	r3, .L63+92
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+108
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L42
.L64:
	.align	2
.L63:
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	waitForVBlank
	.word	state
	.word	start
	.word	instructions
	.word	gearFive
	.word	67109120
	.word	win
	.word	betweenFight
	.word	DrumsOfLiberation_length
	.word	DrumsOfLiberation_data
	.word	playSong
	.word	initLuffy
	.word	initKaido
	.word	initLightning
	.word	initFireball2
	.word	goToKaido2
	.word	lose
	.word	goToStart
	.word	pause
	.word	.LANCHOR0
	.word	unpauseSong
	.word	kaido2
	.word	goToPause
	.word	kaido1
	.word	goToKaido1
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
	ldr	r3, .L67
	ldr	r1, .L67+4
	ldr	r0, .L67+8
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	str	r0, [r1, #4092]
	ldr	lr, [sp], #4
	bx	lr
.L68:
	.align	2
.L67:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.global	lastState
	.comm	state,4,4
	.comm	STATE,1,1
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	soundEffect,28,4
	.comm	song,28,4
	.comm	lightning,144,4
	.comm	fireballs,220,4
	.comm	fireball,44,4
	.comm	kaido,52,4
	.comm	luffyFist,20,4
	.comm	luffy,68,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	lastState, %object
	.size	lastState, 4
lastState:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
