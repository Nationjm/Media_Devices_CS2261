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
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r4, #0
	ldr	r1, .L4+4
	ldr	r3, .L4+8
	strh	r1, [r2]	@ movhi
	ldr	r1, .L4+12
	ldrh	r0, [r3, #48]
	ldr	r2, .L4+16
	ldr	r3, .L4+20
	strh	r4, [r2]	@ movhi
	strh	r0, [r1]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+24
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	1044
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	initGame
	.word	state
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
	mov	fp, #0
	ldr	r4, .L94
	ldr	r3, .L94+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L94+8
	ldrh	r3, [r4]
	ldr	r10, .L94+12
	ldr	r9, .L94+16
	ldr	r6, .L94+20
	ldr	r7, .L94+24
	ldr	r8, .L94+28
.L16:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r8, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r10
	mov	lr, pc
	bx	r9
	ldr	r3, [r6]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L93
.L10:
	.word	.L15
	.word	.L14
	.word	.L13
	.word	.L12
	.word	.L11
	.word	.L9
.L9:
	ldr	r3, .L94+32
	mov	lr, pc
	bx	r3
	ldrh	r2, [r5]
	tst	r2, #4
	ldrh	r3, [r4]
	beq	.L39
	tst	r3, #4
	beq	.L40
.L39:
	tst	r2, #2
	beq	.L16
	tst	r3, #2
	bne	.L16
.L40:
	str	fp, [r6]
	b	.L16
.L11:
	ldr	r3, .L94+36
	mov	lr, pc
	bx	r3
	ldrh	r2, [r5]
	tst	r2, #8
	ldrh	r3, [r4]
	beq	.L36
	tst	r3, #8
	beq	.L40
.L36:
	tst	r2, #1
	beq	.L16
	tst	r3, #1
	bne	.L16
	b	.L40
.L12:
	ldr	r0, [r7, #4]
	ldr	r3, .L94+40
	add	r0, r0, #1
	str	r0, [r7, #4]
	mov	lr, pc
	bx	r3
	ldrh	r2, [r5]
	tst	r2, #8
	ldrh	r3, [r4]
	beq	.L32
	tst	r3, #8
	bne	.L32
.L33:
	mov	r2, #5
	str	r2, [r6]
.L34:
	ldr	r2, [r7, #4]
	cmp	r2, #140
	strgt	fp, [r7, #4]
	b	.L16
.L13:
	ldr	r0, [r7, #4]
	ldr	r3, .L94+44
	add	r0, r0, #1
	str	r0, [r7, #4]
	mov	lr, pc
	bx	r3
	cmp	r0, #3
	str	r0, [r7, #8]
	streq	r0, [r6]
	streq	fp, [r7, #4]
	beq	.L25
	cmp	r0, #0
	movne	r3, #4
	strne	r3, [r6]
.L25:
	ldrh	r2, [r5]
	tst	r2, #4
	ldrh	r3, [r4]
	beq	.L26
	tst	r3, #4
	bne	.L26
.L27:
	mov	r2, #1
	str	r2, [r6]
	b	.L16
.L15:
	ldr	r3, .L94+48
	mov	lr, pc
	bx	r3
	ldr	r0, [r7]
	ldrh	r2, [r5]
	add	r0, r0, #1
	tst	r2, #8
	str	r0, [r7]
	ldrh	r3, [r4]
	beq	.L18
	tst	r3, #8
	bne	.L18
.L19:
	mov	r3, #2
	str	r3, [r6]
	ldr	r3, .L94+52
	mov	lr, pc
	bx	r3
	str	fp, [r7, #4]
	ldrh	r2, [r5]
	ldrh	r3, [r4]
.L20:
	tst	r2, #4
	beq	.L21
	tst	r3, #4
	bne	.L21
.L22:
	mov	r2, #5
	str	r2, [r6]
	b	.L16
.L14:
	ldr	r3, .L94+56
	mov	lr, pc
	bx	r3
	ldrh	r2, [r5]
	tst	r2, #4
	ldrh	r3, [r4]
	beq	.L29
	tst	r3, #4
	bne	.L29
.L30:
	mov	r3, #2
	ldr	r0, [r7]
	str	r3, [r6]
	ldr	r3, .L94+52
	mov	lr, pc
	bx	r3
	str	fp, [r7, #4]
.L93:
	ldrh	r3, [r4]
	b	.L16
.L29:
	tst	r2, #2
	beq	.L16
	tst	r3, #2
	bne	.L16
	b	.L30
.L32:
	tst	r2, #1
	beq	.L34
	tst	r3, #1
	bne	.L34
	b	.L33
.L26:
	tst	r2, #2
	beq	.L16
	tst	r3, #2
	bne	.L16
	b	.L27
.L21:
	tst	r2, #2
	beq	.L16
	tst	r3, #2
	bne	.L16
	b	.L22
.L18:
	tst	r2, #1
	beq	.L20
	tst	r3, #1
	bne	.L20
	b	.L19
.L95:
	.align	2
.L94:
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	.LANCHOR0
	.word	67109120
	.word	scoreboard
	.word	lose
	.word	highScore
	.word	game
	.word	start
	.word	srand
	.word	pause
	.size	main, .-main
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L97
	str	r2, [r3]
	bx	lr
.L98:
	.align	2
.L97:
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #2
	push	{r4, lr}
	ldr	r4, .L101
	ldr	r2, .L101+4
	ldr	r0, [r4]
	ldr	r3, .L101+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r4, #4]
	pop	{r4, lr}
	bx	lr
.L102:
	.align	2
.L101:
	.word	.LANCHOR0
	.word	state
	.word	srand
	.size	goToGame, .-goToGame
	.align	2
	.global	goToHighScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToHighScore, %function
goToHighScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #3
	mov	r2, #0
	ldr	r1, .L104
	ldr	r3, .L104+4
	str	r0, [r1]
	str	r2, [r3, #4]
	bx	lr
.L105:
	.align	2
.L104:
	.word	state
	.word	.LANCHOR0
	.size	goToHighScore, .-goToHighScore
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #4
	ldr	r3, .L107
	str	r2, [r3]
	bx	lr
.L108:
	.align	2
.L107:
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L110
	str	r2, [r3]
	bx	lr
.L111:
	.align	2
.L110:
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToScoreBoard
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToScoreBoard, %function
goToScoreBoard:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #5
	ldr	r3, .L113
	str	r2, [r3]
	bx	lr
.L114:
	.align	2
.L113:
	.word	state
	.size	goToScoreBoard, .-goToScoreBoard
	.global	gameOver
	.global	frameCount
	.global	rSeed
	.comm	state,4,4
	.comm	STATE,1,1
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	cones,168,4
	.comm	car,24,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	rSeed, %object
	.size	rSeed, 4
rSeed:
	.space	4
	.type	frameCount, %object
	.size	frameCount, 4
frameCount:
	.space	4
	.type	gameOver, %object
	.size	gameOver, 4
gameOver:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
