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
	ldr	r3, .L18
	mov	lr, pc
	bx	r3
	ldr	r9, .L18+4
	ldr	r4, .L18+8
	ldr	r8, .L18+12
	ldr	r7, .L18+16
	ldr	r6, .L18+20
	ldr	fp, .L18+24
	ldr	r10, .L18+28
	ldr	r5, .L18+32
.L8:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	ldr	r3, [r6]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L8
.L10:
	.word	.L14
	.word	.L13
	.word	.L12
	.word	.L11
	.word	.L9
.L9:
	ldr	r3, .L18+36
	mov	lr, pc
	bx	r3
	b	.L8
.L11:
	ldr	r3, .L18+40
	mov	lr, pc
	bx	r3
	b	.L8
.L12:
	mov	lr, pc
	bx	r10
	b	.L8
.L13:
	ldr	r3, .L18+44
	mov	lr, pc
	bx	r3
	b	.L8
.L14:
	mov	lr, pc
	bx	fp
	b	.L8
.L19:
	.align	2
.L18:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	start
	.word	game
	.word	67109120
	.word	lose
	.word	win
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
	ldr	r3, .L21
	str	r2, [r3]
	bx	lr
.L22:
	.align	2
.L21:
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
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L24
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	state
	.size	goToGame, .-goToGame
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
	ldr	r3, .L27
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	state
	.size	goToWin, .-goToWin
	.comm	state,4,4
	.comm	STATE,1,1
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
