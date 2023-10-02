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
	ldr	r3, .L27
	mov	lr, pc
	bx	r3
	mov	r10, #0
	ldr	r6, .L27+4
	ldr	r4, .L27+8
	ldr	r7, .L27+12
	ldr	r5, .L27+16
	ldr	fp, .L27+20
	ldr	r8, .L27+24
	ldr	r9, .L27+28
.L16:
	ldrh	r3, [r4]
	strh	r3, [r6]	@ movhi
	ldrb	r3, [r7]	@ zero_extendqisi2
	ldrh	r2, [r9, #48]
	strh	r2, [r4]	@ movhi
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L7
.L9:
	.word	.L13
	.word	.L12
	.word	.L11
	.word	.L10
	.word	.L8
.L8:
	ldr	r3, .L27+32
	mov	lr, pc
	bx	r3
.L7:
	mov	lr, pc
	bx	r8
	b	.L16
.L10:
	ldr	r0, [r5, #12]
	ldr	r3, .L27+36
	mov	lr, pc
	bx	r3
	str	r10, [r5, #12]
	b	.L7
.L11:
	ldr	r3, .L27+40
	ldr	r0, [r5, #4]
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
.L13:
	ldr	r0, [r5]
	mov	lr, pc
	bx	fp
	ldrh	r3, [r4]
	tst	r3, #8
	str	r10, [r5]
	bne	.L7
	ldrh	r3, [r6]
	tst	r3, #8
	movne	r3, #2
	strbne	r3, [r7]
	b	.L7
.L12:
	ldr	r3, .L27+44
	ldr	r0, [r5, #8]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	str	r10, [r5, #8]
	bne	.L7
	ldrh	r3, [r6]
	tst	r3, #4
	movne	r3, #2
	movne	r2, #1
	strbne	r3, [r7]
	strne	r2, [r5, #4]
	b	.L7
.L28:
	.align	2
.L27:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	state
	.word	.LANCHOR0
	.word	start
	.word	waitForVBlank
	.word	67109120
	.word	lose
	.word	win
	.word	game
	.word	pause
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
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L30
	strb	r2, [r3]
	bx	lr
.L31:
	.align	2
.L30:
	.word	state
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
	ldr	r3, .L33
	strb	r2, [r3]
	bx	lr
.L34:
	.align	2
.L33:
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
	ldr	r3, .L36
	strb	r2, [r3]
	bx	lr
.L37:
	.align	2
.L36:
	.word	state
	.size	goToWin, .-goToWin
	.comm	state,1,1
	.global	gamePause
	.global	drawLose
	.global	drawWin
	.global	drawPause
	.global	drawGame
	.global	drawStart
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	bullet,36,4
	.comm	enemies,720,4
	.comm	player,28,4
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
	.type	drawLose, %object
	.size	drawLose, 4
drawLose:
	.word	1
	.bss
	.align	2
	.type	gamePause, %object
	.size	gamePause, 4
gamePause:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
