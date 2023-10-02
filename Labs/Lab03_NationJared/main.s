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
	mov	ip, #67108864
	mvn	r2, #64512
	push	{r4, r5, r6, lr}
	mvn	r1, #59904
	mov	lr, #992
	mvn	r0, #32768
	ldr	r4, .L4
	ldr	r3, .L4+4
	strh	r4, [ip]	@ movhi
	ldr	ip, .L4+8
	ldrh	r4, [r3]
	strh	r4, [ip]	@ movhi
	ldr	ip, .L4+12
	ldrh	ip, [ip, #48]
	strh	ip, [r3]	@ movhi
	ldr	r3, .L4+16
	ldr	ip, .L4+20
	strh	r2, [r3]	@ movhi
	ldr	r2, .L4+24
	ldr	r3, .L4+28
	strh	lr, [ip]	@ movhi
	strh	r1, [r2]	@ movhi
	ldr	ip, .L4+32
	ldr	lr, .L4+36
	ldr	r2, .L4+40
	ldr	r1, .L4+44
	strh	r0, [r3]	@ movhi
	ldr	r3, .L4+48
	add	r0, r0, #65536
	strh	lr, [ip]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #30
	mov	r4, #180
	mov	lr, #100
	mov	ip, #15
	mov	r0, #73
	mov	r1, #113
	mov	r2, #1
	ldr	r5, .L4+52
	str	r3, [r5]
	ldr	r5, .L4+56
	str	r3, [r5]
	ldr	r5, .L4+60
	str	r3, [r5]
	ldr	r5, .L4+64
	str	r3, [r5]
	ldr	r5, .L4+68
	str	r3, [r5]
	ldr	r5, .L4+72
	str	r3, [r5]
	ldr	r3, .L4+76
	str	r4, [r3]
	ldr	r3, .L4+80
	str	r4, [r3]
	ldr	r3, .L4+84
	str	lr, [r3]
	ldr	r3, .L4+88
	str	lr, [r3]
	ldr	r3, .L4+92
	ldr	lr, .L4+96
	str	ip, [r3]
	ldr	r4, .L4+100
	ldr	r3, .L4+104
	str	ip, [lr]
	str	r0, [r3]
	ldr	lr, .L4+108
	str	r0, [r4]
	ldr	ip, .L4+112
	ldr	r0, .L4+116
	ldr	r3, .L4+120
	str	r1, [lr]
	str	r1, [ip]
	str	r2, [r0]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	buttons
	.word	oldButtons
	.word	67109120
	.word	pColor
	.word	r1Color
	.word	r3Color
	.word	bgColor
	.word	r2Color
	.word	22707
	.word	r4Color
	.word	32736
	.word	fillScreen
	.word	rHeight
	.word	rWidth
	.word	r1Y
	.word	r1X
	.word	r2Y
	.word	r4X
	.word	r2X
	.word	r3X
	.word	r3Y
	.word	r4Y
	.word	pWidth
	.word	pHeight
	.word	pY
	.word	pOldY
	.word	pX
	.word	pOldX
	.word	pYVel
	.word	pXVel
	.size	initialize, .-initialize
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Player has moved!\000"
	.align	2
.LC1:
	.ascii	"Current Position: (%d, %d)\000"
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L31
	ldrh	r1, [r3]
	tst	r1, #1
	sub	sp, sp, #16
	bne	.L7
	ldr	r3, .L31+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L7
.L8:
	ldr	r2, .L31+8
	ldrh	r3, [r2]
	eor	r3, r3, #1020
	eor	r3, r3, #3
	strh	r3, [r2]	@ movhi
.L9:
	ldr	r5, .L31+12
	ldr	r3, [r5]
	tst	r1, #32
	subeq	r3, r3, #1
	ldr	r4, .L31+16
	streq	r3, [r5]
	tst	r1, #16
	ldr	r2, [r4]
	addeq	r3, r3, #1
	streq	r3, [r5]
	tst	r1, #64
	subeq	r2, r2, #1
	streq	r2, [r4]
	tst	r1, #128
	addeq	r2, r2, #1
	streq	r2, [r4]
	cmp	r3, #0
	movlt	r1, #0
	movlt	r3, r1
	ldr	r8, .L31+20
	strlt	r1, [r5]
	ldr	r1, [r8]
	add	r0, r1, r3
	cmp	r0, #239
	rsbgt	r3, r1, #240
	strgt	r3, [r5]
	cmp	r2, #0
	movlt	r0, #0
	movlt	r2, r0
	ldr	r9, .L31+24
	strlt	r0, [r4]
	ldr	r0, [r9]
	add	ip, r0, r2
	cmp	ip, #159
	rsbgt	r2, r0, #160
	str	r2, [sp, #4]
	str	r3, [sp]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	ldr	lr, .L31+28
	ldr	ip, .L31+32
	ldr	r7, .L31+36
	ldr	r6, .L31+40
	strgt	r2, [r4]
	ldr	r3, [r7]
	ldr	r2, [r6]
	ldr	r1, [lr]
	ldr	r0, [ip]
	ldr	r10, .L31+44
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L18
	ldr	r2, .L31+48
	ldr	r3, .L31+8
	ldrh	r2, [r2]
	strh	r2, [r3]	@ movhi
.L19:
	ldr	r2, .L31+52
	ldr	r3, [r4]
	ldr	r2, [r2]
	cmp	r2, r3
	bne	.L22
	ldr	r2, .L31+56
	ldr	r3, [r5]
	ldr	r2, [r2]
	cmp	r2, r3
	beq	.L6
.L22:
	mov	r0, #4
	ldr	r1, .L31+60
	ldr	r3, .L31+64
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, [r5]
	ldr	r0, .L31+68
	ldr	r3, .L31+72
	mov	lr, pc
	bx	r3
.L6:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L7:
	tst	r1, #2
	bne	.L9
	ldr	r3, .L31+4
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L9
	b	.L8
.L18:
	ldr	r3, [r9]
	ldr	r1, .L31+76
	ldr	r0, .L31+80
	ldr	r1, [r1]
	ldr	r0, [r0]
	ldr	r2, [r4]
	ldr	ip, [r8]
	str	r3, [sp, #12]
	ldr	r3, [r5]
	stmib	sp, {r2, ip}
	str	r3, [sp]
	ldr	r2, [r6]
	ldr	r3, [r7]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L20
	ldr	r2, .L31+84
	ldr	r3, .L31+8
	ldrh	r2, [r2]
	strh	r2, [r3]	@ movhi
	b	.L19
.L20:
	ldr	r3, [r9]
	ldr	r1, .L31+88
	ldr	r0, .L31+92
	ldr	r1, [r1]
	ldr	r0, [r0]
	ldr	r2, [r4]
	ldr	ip, [r8]
	str	r3, [sp, #12]
	ldr	r3, [r5]
	stmib	sp, {r2, ip}
	str	r3, [sp]
	ldr	r2, [r6]
	ldr	r3, [r7]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L21
	ldr	r2, .L31+96
	ldr	r3, .L31+8
	ldrh	r2, [r2]
	strh	r2, [r3]	@ movhi
	b	.L19
.L21:
	ldr	r2, [r9]
	ldr	r3, [r8]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	ldr	lr, [r4]
	ldr	ip, [r5]
	ldr	r1, .L31+100
	ldr	r0, .L31+104
	ldr	r2, [r6]
	ldr	r3, [r7]
	ldr	r1, [r1]
	ldr	r0, [r0]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	ldrne	r2, .L31+108
	ldrne	r3, .L31+8
	ldrhne	r2, [r2]
	strhne	r2, [r3]	@ movhi
	b	.L19
.L32:
	.align	2
.L31:
	.word	buttons
	.word	oldButtons
	.word	pColor
	.word	pX
	.word	pY
	.word	pWidth
	.word	pHeight
	.word	r1Y
	.word	r1X
	.word	rHeight
	.word	rWidth
	.word	collision
	.word	r1Color
	.word	pOldY
	.word	pOldX
	.word	.LC0
	.word	mgba_printf_level
	.word	.LC1
	.word	mgba_printf
	.word	r2Y
	.word	r2X
	.word	r2Color
	.word	r3Y
	.word	r3X
	.word	r3Color
	.word	r4Y
	.word	r4X
	.word	r4Color
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L39
	ldrh	r3, [r3]
	ldr	r6, .L39+4
	ldr	r5, .L39+8
	tst	r3, #4
	ldr	r2, [r6]
	ldr	r3, [r5]
	sub	sp, sp, #8
	bne	.L37
	ldr	r10, .L39+12
	ldr	r9, .L39+16
	ldr	r4, .L39+20
.L34:
	ldr	r1, .L39+24
	ldr	r8, .L39+28
	ldrh	r1, [r1]
	ldr	r7, .L39+32
	str	r1, [sp]
	ldr	r0, [r7]
	ldr	r1, [r8]
	mov	lr, pc
	bx	r4
	ldr	r3, .L39+36
	ldrh	r3, [r3]
	ldr	r6, .L39+40
	str	r3, [sp]
	ldr	r5, .L39+44
	ldr	r1, .L39+48
	ldr	r0, .L39+52
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L39+56
	ldrh	r3, [r3]
	ldr	r1, .L39+60
	str	r3, [sp]
	ldr	r0, .L39+64
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L39+68
	ldrh	r3, [r3]
	ldr	r1, .L39+72
	str	r3, [sp]
	ldr	r0, .L39+76
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L39+80
	ldrh	ip, [r3]
	ldr	r2, [r5]
	ldr	r3, [r6]
	ldr	r1, .L39+84
	str	ip, [sp]
	ldr	r0, .L39+88
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r2, [r8]
	ldr	r3, [r7]
	str	r2, [r10]
	str	r3, [r9]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L37:
	ldr	r1, .L39+92
	ldr	r10, .L39+12
	ldrh	r1, [r1]
	ldr	r9, .L39+16
	str	r1, [sp]
	ldr	r0, [r9]
	ldr	r1, [r10]
	ldr	r4, .L39+20
	mov	lr, pc
	bx	r4
	ldr	r2, [r6]
	ldr	r3, [r5]
	b	.L34
.L40:
	.align	2
.L39:
	.word	buttons
	.word	pWidth
	.word	pHeight
	.word	pOldY
	.word	pOldX
	.word	drawRect
	.word	pColor
	.word	pY
	.word	pX
	.word	r1Color
	.word	rHeight
	.word	rWidth
	.word	r1Y
	.word	r1X
	.word	r2Color
	.word	r2Y
	.word	r2X
	.word	r3Color
	.word	r3Y
	.word	r3X
	.word	r4Color
	.word	r4Y
	.word	r4X
	.word	bgColor
	.size	draw, .-draw
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"Debugging Initialized\000"
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
	ldr	r3, .L44
	mov	lr, pc
	bx	r3
	ldr	r0, .L44+4
	ldr	r3, .L44+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+12
	mov	lr, pc
	bx	r3
	ldr	r9, .L44+16
	ldr	r4, .L44+20
	ldr	r8, .L44+24
	ldr	r7, .L44+28
	ldr	r6, .L44+32
	ldr	r5, .L44+36
.L42:
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
	b	.L42
.L45:
	.align	2
.L44:
	.word	mgba_open
	.word	.LC2
	.word	mgba_printf
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.comm	pColor,2,2
	.comm	pWidth,4,4
	.comm	pHeight,4,4
	.comm	pXVel,4,4
	.comm	pYVel,4,4
	.comm	pOldX,4,4
	.comm	pOldY,4,4
	.comm	pX,4,4
	.comm	pY,4,4
	.comm	r4Color,2,2
	.comm	r4X,4,4
	.comm	r4Y,4,4
	.comm	r3Color,2,2
	.comm	r3X,4,4
	.comm	r3Y,4,4
	.comm	r2Color,2,2
	.comm	r2X,4,4
	.comm	r2Y,4,4
	.comm	r1Color,2,2
	.comm	r1X,4,4
	.comm	r1Y,4,4
	.comm	rWidth,4,4
	.comm	rHeight,4,4
	.comm	bgColor,2,2
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
