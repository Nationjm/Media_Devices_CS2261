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
	.global	goToGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L4
	mov	lr, pc
	bx	r5
	ldr	r4, .L4+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+12
	mov	r3, #19200
	mov	r0, #3
	ldr	r2, [r2]
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+40
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	waitForVBlank
	.word	DMANow
	.word	backgroundPal
	.word	videoBuffer
	.word	backgroundBitmap
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
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
	mov	r3, #67108864
	push	{r4, lr}
	ldr	r2, .L8
	strh	r2, [r3]	@ movhi
	bl	goToGame
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	5124
	.word	initGame
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
	mov	r2, #67108864
	ldr	r1, .L15
	push	{r7, lr}
	ldr	r3, .L15+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+8
	mov	lr, pc
	bx	r3
	ldr	r8, .L15+12
	ldr	r4, .L15+16
	ldr	r9, .L15+20
	ldr	r7, .L15+24
	ldr	r6, .L15+28
	ldr	r5, .L15+32
.L12:
	ldr	r2, [r8]
	ldrh	r3, [r4]
.L11:
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r5, #48]
	cmp	r2, #0
	strh	r3, [r4]	@ movhi
	bne	.L11
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L12
.L16:
	.align	2
.L15:
	.word	5124
	.word	goToGame
	.word	initGame
	.word	state
	.word	buttons
	.word	oldButtons
	.word	updateGame
	.word	drawGame
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L19
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	updateGame
	.word	drawGame
	.size	game, .-game
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
