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
	.global	init
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mvn	r1, #32768
	ldr	r0, .L4
	ldr	r2, .L4+4
	push	{r4, lr}
	strh	r0, [r3]	@ movhi
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r1, #0
	ldr	r2, .L4+16
	ldr	r3, .L4+20
	strh	r1, [r2]	@ movhi
	ldr	r2, .L4+24
	ldrh	r1, [r3, #48]
	ldr	r3, .L4+28
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	backgroundColor
	.word	32767
	.word	fillScreen
	.word	oldButtons
	.word	67109120
	.word	buttons
	.word	initPlayer
	.word	mgba_open
	.size	init, .-init
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
	push	{r7, lr}
	ldr	r3, .L9
	mov	lr, pc
	bx	r3
	ldr	r10, .L9+4
	ldr	r4, .L9+8
	ldr	r9, .L9+12
	ldr	r8, .L9+16
	ldr	r7, .L9+20
	ldr	r6, .L9+24
	ldr	r5, .L9+28
.L7:
	ldrh	r3, [r4]
	strh	r3, [r10]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r9
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L7
.L10:
	.align	2
.L9:
	.word	init
	.word	oldButtons
	.word	buttons
	.word	updatePlayer
	.word	updateBullets
	.word	waitForVBlank
	.word	drawGame
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	updatePlayer
	.word	updateBullets
	.size	update, .-update
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L17
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	drawGame
	.size	draw, .-draw
	.comm	backgroundColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
