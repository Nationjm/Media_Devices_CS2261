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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Debugger Opened\000"
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
	mov	r3, #67108864
	push	{r4, lr}
	ldr	r2, .L4
	ldr	r0, .L4+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	mov	r0, #1
	ldr	r1, .L4+16
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	32767
	.word	fillScreen
	.word	mgba_open
	.word	.LC0
	.word	mgba_printf_level
	.size	initialize, .-initialize
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
	push	{r4, r5, lr}
	ldr	ip, .L8
	ldr	r4, .L8+4
	ldr	r1, .L8+8
	ldr	r0, .L8+12
	sub	sp, sp, #12
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r1, [r1]
	ldr	r0, [r0]
	ldr	r5, .L8+16
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	ip, #31744
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	32767
	.word	.LANCHOR0
	.word	oldPlayerY
	.word	oldPlayerX
	.word	drawRect
	.size	draw, .-draw
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"User is trying to go down!\000"
	.align	2
.LC2:
	.ascii	"User is trying to go up!\000"
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
	ldr	r3, .L19
	ldr	r2, .L19+4
	ldr	r1, .L19+8
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	push	{r4, lr}
	orr	r3, r3, r2
	ldr	lr, [r1, #12]
	ldr	ip, .L19+12
	ldr	r2, [r1, #8]
	ldr	r0, .L19+16
	tst	r3, #128
	str	lr, [ip]
	str	r2, [r0]
	bne	.L11
	ldr	r0, [r1]
	add	r0, r2, r0
	cmp	r0, #159
	ble	.L17
.L11:
	lsr	r3, r3, #6
	eor	r3, r3, #1
	cmp	r2, #0
	movle	r3, #0
	andgt	r3, r3, #1
	cmp	r3, #0
	bne	.L18
.L10:
	pop	{r4, lr}
	bx	lr
.L17:
	add	r2, r2, #1
	ldr	r0, .L19+20
	ldr	r3, .L19+24
	str	r2, [r1, #8]
	mov	lr, pc
	bx	r3
	b	.L10
.L18:
	sub	r2, r2, #1
	ldr	r0, .L19+28
	ldr	r3, .L19+24
	str	r2, [r1, #8]
	mov	lr, pc
	bx	r3
	b	.L10
.L20:
	.align	2
.L19:
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.word	oldPlayerX
	.word	oldPlayerY
	.word	.LC1
	.word	mgba_printf
	.word	.LC2
	.size	update, .-update
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
	ldr	r3, .L24
	mov	lr, pc
	bx	r3
	ldr	r9, .L24+4
	ldr	r4, .L24+8
	ldr	r8, .L24+12
	ldr	r7, .L24+16
	ldr	r6, .L24+20
	ldr	r5, .L24+24
.L22:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L22
.L25:
	.align	2
.L24:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	canMoveUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveUp, %function
canMoveUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L27
	ldr	r0, [r3, #8]
	cmp	r0, #0
	movle	r0, #0
	movgt	r0, #1
	bx	lr
.L28:
	.align	2
.L27:
	.word	.LANCHOR0
	.size	canMoveUp, .-canMoveUp
	.align	2
	.global	canMoveDown
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveDown, %function
canMoveDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L30
	ldr	r0, [r3, #8]
	ldr	r3, [r3]
	add	r0, r0, r3
	cmp	r0, #159
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L31:
	.align	2
.L30:
	.word	.LANCHOR0
	.size	canMoveDown, .-canMoveDown
	.comm	oldPlayerY,4,4
	.comm	oldPlayerX,4,4
	.global	playerY
	.global	playerX
	.global	playerHeight
	.global	playerWidth
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	playerHeight, %object
	.size	playerHeight, 4
playerHeight:
	.word	20
	.type	playerWidth, %object
	.size	playerWidth, 4
playerWidth:
	.word	20
	.type	playerY, %object
	.size	playerY, 4
playerY:
	.word	20
	.type	playerX, %object
	.size	playerX, 4
playerX:
	.word	20
	.ident	"GCC: (devkitARM release 53) 9.1.0"
