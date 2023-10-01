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
	.word	initEnemies
	.word	initBullet
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
	ldr	r3, .L19
	mov	lr, pc
	bx	r3
	mov	r10, #0
	ldr	r5, .L19+4
	ldr	r4, .L19+8
	ldr	r6, .L19+12
	ldr	r9, .L19+16
	ldr	fp, .L19+20
	ldr	r7, .L19+24
	ldr	r8, .L19+28
.L14:
	ldrh	r3, [r4]
	strh	r3, [r5]	@ movhi
	ldrb	r3, [r6]	@ zero_extendqisi2
	ldrh	r2, [r8, #48]
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
	ldr	r3, .L19+32
	mov	lr, pc
	bx	r3
.L7:
	mov	lr, pc
	bx	r7
	b	.L14
.L10:
	ldr	r3, .L19+36
	mov	lr, pc
	bx	r3
	b	.L7
.L11:
	ldr	r0, [r9, #4]
	ldr	r3, .L19+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+44
	str	r10, [r9, #4]
	mov	lr, pc
	bx	r3
	b	.L7
.L13:
	ldr	r0, [r9]
	mov	lr, pc
	bx	fp
	ldrh	r3, [r4]
	tst	r3, #8
	str	r10, [r9]
	bne	.L7
	ldrh	r3, [r5]
	tst	r3, #8
	movne	r3, #2
	strbne	r3, [r6]
	b	.L7
.L12:
	ldr	r3, .L19+48
	mov	lr, pc
	bx	r3
	b	.L7
.L20:
	.align	2
.L19:
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
	.word	updatePlayer
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
	ldr	r3, .L22
	strb	r2, [r3]
	bx	lr
.L23:
	.align	2
.L22:
	.word	state
	.size	goToGame, .-goToGame
	.comm	state,1,1
	.global	drawLose
	.global	drawWin
	.global	drawPause
	.global	drawGame
	.global	drawStart
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	bullet,24,4
	.comm	enemies,1320,4
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
	.type	drawLose, %object
	.size	drawLose, 4
drawLose:
	.word	1
	.type	drawWin, %object
	.size	drawWin, 4
drawWin:
	.word	1
	.type	drawPause, %object
	.size	drawPause, 4
drawPause:
	.word	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
