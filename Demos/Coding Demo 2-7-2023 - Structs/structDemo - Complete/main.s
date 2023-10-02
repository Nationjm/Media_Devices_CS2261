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
	ldr	r2, .L4
	push	{r4, r5, r6, lr}
	ldr	r0, .L4+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	mov	r1, #0
	mov	r2, #100
	mov	r5, #31
	mov	lr, #20
	mov	r4, #31744
	mov	ip, #40
	mov	r0, #1
	ldr	r3, .L4+12
	ldr	r6, .L4+16
	strh	r1, [r3]	@ movhi
	ldr	r3, .L4+20
	ldrh	r6, [r6, #48]
	strh	r6, [r3]	@ movhi
	ldr	r3, .L4+24
	str	r5, [r3, #24]
	str	r2, [r3]
	ldr	r5, .L4+28
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	ldr	r2, .L4+32
	str	r3, [r5]
	str	lr, [r3, #16]
	str	lr, [r2, #20]
	str	r4, [r2, #24]
	str	r1, [r3, #32]
	str	r1, [r2]
	str	r1, [r2, #4]
	str	r1, [r2, #8]
	str	r1, [r2, #12]
	str	r1, [r2, #32]
	str	ip, [r3, #20]
	str	ip, [r2, #16]
	str	r0, [r3, #28]
	str	r0, [r2, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	32767
	.word	fillScreen
	.word	oldButtons
	.word	67109120
	.word	buttons
	.word	player1
	.word	player
	.word	player2
	.size	init, .-init
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
	@ link register save eliminated.
	ldr	r2, .L21
	ldr	r1, .L21+4
	ldr	r3, [r2]
	ldrh	r1, [r1]
	ldr	ip, [r3]
	ldr	r0, [r3, #4]
	tst	r1, #1
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	beq	.L7
	ldr	r3, .L21+8
	ldrh	r3, [r3, #48]
	tst	r3, #1
	bne	.L7
	ldr	r3, .L21+12
	str	r3, [r2]
.L8:
	ldr	r3, .L21+8
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L9
.L19:
	ldr	r1, [r2]
	ldr	r3, [r1, #4]
	cmp	r3, #0
	ble	.L9
	mov	r0, #1
	sub	r3, r3, #1
	str	r3, [r1, #4]
	str	r0, [r1, #28]
.L10:
	ldr	r3, .L21+8
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L11
.L20:
	ldr	r3, [r2]
	ldr	r1, [r3, #16]
	ldr	r0, [r3]
	rsb	r1, r1, #240
	cmp	r0, r1
	bge	.L11
	mov	r2, #1
	add	r0, r0, r2
	str	r0, [r3]
	str	r2, [r3, #28]
	bx	lr
.L7:
	tst	r1, #2
	beq	.L8
	ldr	r3, .L21+8
	ldrh	r3, [r3, #48]
	tst	r3, #2
	ldreq	r3, .L21+16
	streq	r3, [r2]
	ldr	r3, .L21+8
	ldrh	r3, [r3, #48]
	tst	r3, #64
	beq	.L19
.L9:
	ldr	r3, .L21+8
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L10
	ldr	r3, [r2]
	ldr	r1, [r3, #20]
	ldr	r0, [r3, #4]
	rsb	r1, r1, #160
	cmp	r0, r1
	movlt	r1, #1
	addlt	r0, r0, r1
	strlt	r0, [r3, #4]
	strlt	r1, [r3, #28]
	ldr	r3, .L21+8
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L20
.L11:
	ldr	r3, .L21+8
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bxne	lr
	ldr	r2, [r2]
	ldr	r3, [r2]
	cmp	r3, #0
	movgt	r1, #1
	subgt	r3, r3, #1
	strgt	r3, [r2]
	strgt	r1, [r2, #28]
	bx	lr
.L22:
	.align	2
.L21:
	.word	player
	.word	oldButtons
	.word	67109120
	.word	player1
	.word	player2
	.size	update, .-update
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #28]
	add	r2, r0, #16
	cmp	r3, #0
	mov	r4, r0
	ldm	r2, {r2, r3}
	sub	sp, sp, #12
	bne	.L27
	ldr	r5, .L29
.L24:
	ldrh	r1, [r4, #24]
	str	r1, [sp]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L27:
	ldr	r1, .L29+4
	str	r1, [sp]
	add	r0, r0, #8
	ldm	r0, {r0, r1}
	ldr	r5, .L29
	mov	lr, pc
	bx	r5
	mov	r3, #0
	ldr	r2, [r4, #16]
	str	r3, [r4, #28]
	ldr	r3, [r4, #20]
	b	.L24
.L30:
	.align	2
.L29:
	.word	drawRect
	.word	32767
	.size	drawPlayer, .-drawPlayer
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
	ldr	r0, .L33
	bl	drawPlayer
	ldr	r0, .L33+4
	pop	{r4, lr}
	b	drawPlayer
.L34:
	.align	2
.L33:
	.word	player1
	.word	player2
	.size	draw, .-draw
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
	ldr	r3, .L38
	mov	lr, pc
	bx	r3
	ldr	fp, .L38+4
	ldr	r5, .L38+8
	ldr	r10, .L38+12
	ldr	r9, .L38+16
	ldr	r4, .L38+20
	ldr	r8, .L38+24
	ldr	r7, .L38+28
	ldr	r6, .L38+32
.L36:
	ldrh	r3, [r5]
	strh	r3, [fp]	@ movhi
	ldrh	r3, [r8, #48]
	strh	r3, [r5]	@ movhi
	mov	lr, pc
	bx	r10
	mov	lr, pc
	bx	r9
	mov	r0, r7
	mov	lr, pc
	bx	r4
	mov	r0, r6
	mov	lr, pc
	bx	r4
	b	.L36
.L39:
	.align	2
.L38:
	.word	init
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	drawPlayer
	.word	67109120
	.word	player1
	.word	player2
	.size	main, .-main
	.comm	player2,36,4
	.comm	player1,36,4
	.comm	player,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
