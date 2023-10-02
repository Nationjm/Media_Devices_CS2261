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
	mov	r3, #67108864
	mov	r1, #0
	ldr	r0, .L4+4
	ldr	r2, .L4+8
	strh	r0, [r3]	@ movhi
	ldr	r3, .L4+12
	strb	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	1027
	.word	state
	.word	initPlayer
	.word	initBullet
	.word	initEnemies
	.word	initSound
	.word	initPowerUP
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
	ldr	r3, .L31
	mov	lr, pc
	bx	r3
	mov	r10, #0
	ldr	r6, .L31+4
	ldr	r4, .L31+8
	ldr	r7, .L31+12
	ldr	r5, .L31+16
	ldr	fp, .L31+20
	ldr	r9, .L31+24
	ldr	r8, .L31+28
.L16:
	ldrh	r3, [r4]
	strh	r3, [r6]	@ movhi
	ldrb	r3, [r7]	@ zero_extendqisi2
	ldrh	r2, [r8, #48]
	strh	r2, [r4]	@ movhi
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L7
.L9:
	.word	.L12
	.word	.L11
	.word	.L10
	.word	.L8
.L8:
	ldr	r0, [r5, #12]
	ldr	r3, .L31+32
	mov	lr, pc
	bx	r3
	str	r10, [r5, #12]
.L7:
	mov	lr, pc
	bx	r9
	b	.L16
.L10:
	ldr	r0, [r5, #4]
	cmp	r0, #0
	bne	.L30
.L15:
	ldr	r3, .L31+36
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	str	r10, [r5, #4]
	bne	.L7
	ldrh	r3, [r6]
	tst	r3, #4
	movne	r3, #1
	strne	r3, [r5, #8]
	strbne	r3, [r7]
	b	.L7
.L12:
	ldr	r0, [r5]
	ldr	r3, .L31+40
	mov	lr, pc
	bx	r3
	ldr	r0, [fp]
	ldrh	r3, [r4]
	add	r0, r0, #1
	tst	r3, #8
	str	r10, [r5]
	str	r0, [fp]
	bne	.L7
	ldrh	r3, [r6]
	tst	r3, #8
	beq	.L7
	mov	r3, #2
	strb	r3, [r7]
	ldr	r3, .L31+44
	mov	lr, pc
	bx	r3
	b	.L7
.L11:
	ldr	r3, .L31+48
	ldr	r0, [r5, #8]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	str	r10, [r5, #8]
	bne	.L7
	ldrh	r3, [r6]
	tst	r3, #4
	beq	.L7
	mov	r3, #2
	mov	r2, #1
	strb	r3, [r7]
	ldr	r0, [fp]
	ldr	r3, .L31+44
	str	r2, [r5, #4]
	mov	lr, pc
	bx	r3
	b	.L7
.L30:
	ldr	r3, .L31+52
	mov	lr, pc
	bx	r3
	ldr	r0, [r5, #4]
	b	.L15
.L32:
	.align	2
.L31:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	state
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	waitForVBlank
	.word	67109120
	.word	win
	.word	game
	.word	start
	.word	srand
	.word	pause
	.word	initDangerZone
	.size	main, .-main
	.text
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
	ldr	r3, .L35
	ldr	r2, .L35+4
	ldr	r0, [r3]
	ldr	r3, .L35+8
	strb	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	.LANCHOR1
	.word	state
	.word	srand
	.size	goToGame, .-goToGame
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
	ldr	r3, .L38
	strb	r2, [r3]
	bx	lr
.L39:
	.align	2
.L38:
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #3
	ldr	r3, .L41
	strb	r2, [r3]
	bx	lr
.L42:
	.align	2
.L41:
	.word	state
	.size	goToWin, .-goToWin
	.comm	state,1,1
	.global	rSeed
	.global	gamePause
	.global	drawWin
	.global	drawPause
	.global	drawGame
	.global	drawStart
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	NOTES,2,2
	.comm	dangerZone,28,4
	.comm	powerUP,28,4
	.comm	bullet,36,4
	.comm	enemies,720,4
	.comm	player,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	drawStart, %object
	.size	drawStart, 4
drawStart:
	.word	1
	.type	drawGame, %object
	.size	drawGame, 4
drawGame:
	.word	1
	.type	drawPause, %object
	.size	drawPause, 4
drawPause:
	.word	1
	.type	drawWin, %object
	.size	drawWin, 4
drawWin:
	.word	1
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	rSeed, %object
	.size	rSeed, 4
rSeed:
	.space	4
	.type	gamePause, %object
	.size	gamePause, 4
gamePause:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
