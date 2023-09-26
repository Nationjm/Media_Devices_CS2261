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
	.ascii	"Debug logs initialized\000"
	.align	2
.LC1:
	.ascii	"%s\000"
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
	ldr	r3, .L4+4
	ldr	r1, .L4+8
	ldr	r0, .L4+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L4+16
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	mgba_printf
	.word	.LC0
	.word	.LC1
	.word	1027
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"%d\000"
	.text
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L8
	ldr	r1, [r3]
	ldr	r0, .L8+4
	add	r1, r1, #1
	ldr	r2, .L8+8
	str	r1, [r3]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.word	.LC2
	.word	mgba_printf
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #1
	push	{r4, lr}
	beq	.L16
	cmp	r0, #2
	beq	.L17
	cmp	r0, #3
	beq	.L18
	cmp	r0, #4
	beq	.L19
	pop	{r4, lr}
	bx	lr
.L16:
	ldr	r3, .L20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L19:
	ldr	r3, .L20+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	ldr	r3, .L20+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L18:
	ldr	r3, .L20+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	drawFrame1
	.word	drawFrame4
	.word	drawFrame2
	.word	drawFrame3
	.size	drawGame, .-drawGame
	.align	2
	.global	loopingForward
	.syntax unified
	.arm
	.fpu softvfp
	.type	loopingForward, %function
loopingForward:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	mov	r1, #0
	ldr	r2, .L32
	ldr	r3, .L32+4
	push	{r4, lr}
	ldr	r0, [r3]
	ldr	lr, [r2]
	cmp	lr, r0
	ldr	lr, .L32+8
	ldr	r0, .L32+12
	str	ip, [lr]
	str	r1, [r0]
	ble	.L22
	ldr	r0, [r3, #4]
	cmp	r0, #4
	beq	.L28
	cmp	r0, #1
	beq	.L29
	cmp	r0, #2
	beq	.L30
	cmp	r0, #3
	beq	.L31
.L22:
	pop	{r4, lr}
	bx	lr
.L28:
	ldr	r0, .L32+16
	str	r1, [r2]
	str	ip, [r3, #4]
	mov	lr, pc
	bx	r0
	pop	{r4, lr}
	bx	lr
.L31:
	mov	ip, #4
	ldr	r0, .L32+20
	str	r1, [r2]
	str	ip, [r3, #4]
	mov	lr, pc
	bx	r0
	b	.L22
.L29:
	mov	ip, #2
	ldr	r0, .L32+24
	str	r1, [r2]
	str	ip, [r3, #4]
	mov	lr, pc
	bx	r0
	b	.L22
.L30:
	mov	ip, #3
	ldr	r0, .L32+28
	str	r1, [r2]
	str	ip, [r3, #4]
	mov	lr, pc
	bx	r0
	b	.L22
.L33:
	.align	2
.L32:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	forwardBool
	.word	backwardBool
	.word	drawFrame1
	.word	drawFrame4
	.word	drawFrame2
	.word	drawFrame3
	.size	loopingForward, .-loopingForward
	.align	2
	.global	loopingBackward
	.syntax unified
	.arm
	.fpu softvfp
	.type	loopingBackward, %function
loopingBackward:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	mov	r1, #0
	ldr	r2, .L44
	ldr	r3, .L44+4
	push	{r4, lr}
	ldr	r0, [r3]
	ldr	lr, [r2]
	cmp	lr, r0
	ldr	lr, .L44+8
	ldr	r0, .L44+12
	str	ip, [lr]
	str	r1, [r0]
	ble	.L34
	ldr	r0, [r3, #4]
	cmp	r0, #4
	beq	.L40
	cmp	r0, #3
	beq	.L41
	cmp	r0, #2
	beq	.L42
	cmp	r0, #1
	beq	.L43
.L34:
	pop	{r4, lr}
	bx	lr
.L40:
	mov	ip, #3
	ldr	r0, .L44+16
	str	r1, [r2]
	str	ip, [r3, #4]
	mov	lr, pc
	bx	r0
	pop	{r4, lr}
	bx	lr
.L43:
	mov	ip, #4
	ldr	r0, .L44+20
	str	r1, [r2]
	str	ip, [r3, #4]
	mov	lr, pc
	bx	r0
	b	.L34
.L41:
	mov	ip, #2
	ldr	r0, .L44+24
	str	r1, [r2]
	str	ip, [r3, #4]
	mov	lr, pc
	bx	r0
	b	.L34
.L42:
	ldr	r0, .L44+28
	str	r1, [r2]
	str	ip, [r3, #4]
	mov	lr, pc
	bx	r0
	b	.L34
.L45:
	.align	2
.L44:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	backwardBool
	.word	forwardBool
	.word	drawFrame3
	.word	drawFrame4
	.word	drawFrame2
	.word	drawFrame1
	.size	loopingBackward, .-loopingBackward
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L123
	mov	lr, pc
	bx	r3
	ldr	r10, .L123+4
	ldr	r1, .L123+8
	ldr	r0, .L123+12
	mov	lr, pc
	bx	r10
	mov	r2, #67108864
	mvn	r1, #32768
	ldr	r3, .L123+16
	ldr	r0, .L123+20
	ldr	r3, [r3]
	strh	r0, [r2]	@ movhi
	add	r2, r3, #76800
	add	r2, r2, #480
	add	r3, r3, #480
.L47:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L47
	ldr	r5, .L123+24
	ldr	r3, .L123+28
	mov	lr, pc
	bx	r3
	ldr	r6, .L123+32
	ldrh	r3, [r5]
	ldr	r4, .L123+36
	ldr	r7, .L123+40
	ldr	r8, .L123+44
	ldr	r9, .L123+48
	ldr	fp, .L123+52
.L48:
	ldr	r2, [r6, #4]
	strh	r3, [r4]	@ movhi
	ldr	r3, .L123+56
	str	r2, [r3]
	ldr	r3, .L123+60
	ldr	r1, [r7]
	ldrh	r3, [r3, #48]
	mov	r0, fp
	add	r1, r1, #1
	strh	r3, [r5]	@ movhi
	str	r1, [r7]
	mov	lr, pc
	bx	r10
	ldr	r3, .L123+64
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	ands	r0, r3, #8
	bne	.L50
	ldrh	r2, [r4]
	tst	r2, #8
	ldr	r1, [r8]
	beq	.L51
	ldr	r2, [r9]
	orrs	ip, r2, r1
	moveq	r3, #1
	streq	r3, [r8]
	bne	.L118
.L53:
	ldr	r3, .L123+68
	mov	lr, pc
	bx	r3
.L116:
	ldr	r2, [r9]
.L54:
	cmp	r2, #1
	beq	.L56
.L117:
	ldrh	r3, [r5]
.L57:
	tst	r3, #1
	bne	.L58
	ldrh	r2, [r4]
	tst	r2, #1
	beq	.L58
	ldr	r0, [r6, #4]
	add	r0, r0, #1
	cmp	r0, #4
	movgt	r0, #1
	movgt	r3, r0
	strgt	r3, [r6, #4]
	ldr	r3, .L123+72
	strle	r0, [r6, #4]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
.L58:
	tst	r3, #2
	bne	.L61
	ldrh	r2, [r4]
	tst	r2, #2
	beq	.L61
	ldr	r0, [r6, #4]
	sub	r0, r0, #1
	cmp	r0, #0
	movle	r3, #4
	movle	r0, r3
	strle	r3, [r6, #4]
	ldr	r3, .L123+72
	strgt	r0, [r6, #4]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
.L61:
	tst	r3, #32
	bne	.L64
	ldrh	r2, [r4]
	tst	r2, #32
	bne	.L119
.L64:
	tst	r3, #16
	bne	.L65
	ldrh	r2, [r4]
	tst	r2, #16
	bne	.L120
.L65:
	tst	r3, #4
	bne	.L66
	ldrh	r2, [r4]
	tst	r2, #4
	beq	.L66
	ldr	r3, [r8]
	cmp	r3, #0
	bne	.L82
	ldr	r3, [r9]
	cmp	r3, #0
	bne	.L121
.L82:
	ldr	r3, .L123+76
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
.L66:
	tst	r3, #64
	bne	.L68
	ldrh	r2, [r4]
	tst	r2, #64
	beq	.L68
	ldr	r2, [r6, #8]
	cmp	r2, #4
	bgt	.L68
	add	r1, r2, #1
	str	r1, [r6, #8]
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L68
.L70:
	.word	.L74
	.word	.L73
	.word	.L72
	.word	.L71
	.word	.L69
.L69:
	mov	r2, #10
	str	r2, [r6]
.L68:
	tst	r3, #128
	bne	.L48
	ldrh	r2, [r4]
	tst	r2, #128
	beq	.L48
	ldr	r2, [r6, #8]
	cmp	r2, #1
	ble	.L48
	sub	r2, r2, #1
	sub	r1, r2, #1
	str	r2, [r6, #8]
	cmp	r1, #4
	ldrls	pc, [pc, r1, asl #2]
	b	.L48
.L76:
	.word	.L80
	.word	.L79
	.word	.L78
	.word	.L77
	.word	.L75
.L75:
	mov	r2, #10
	str	r2, [r6]
	b	.L48
.L77:
	mov	r2, #20
	str	r2, [r6]
	b	.L48
.L78:
	mov	r2, #30
	str	r2, [r6]
	b	.L48
.L79:
	mov	r2, #40
	str	r2, [r6]
	b	.L48
.L80:
	mov	r2, #50
	str	r2, [r6]
	b	.L48
.L71:
	mov	r2, #20
	str	r2, [r6]
	b	.L68
.L72:
	mov	r2, #30
	str	r2, [r6]
	b	.L68
.L73:
	mov	r2, #40
	str	r2, [r6]
	b	.L68
.L74:
	mov	r2, #50
	str	r2, [r6]
	b	.L68
.L50:
	ldr	r1, [r8]
.L51:
	cmp	r1, #1
	bne	.L116
	b	.L53
.L118:
	cmp	r1, #1
	beq	.L122
	cmp	r2, #1
	streq	r0, [r9]
	b	.L57
.L56:
	ldr	r3, .L123+76
	mov	lr, pc
	bx	r3
	b	.L117
.L119:
	mov	r3, #1
	str	r3, [r6, #4]
	ldr	r3, .L123+28
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L64
.L120:
	mov	r3, #4
	str	r3, [r6, #4]
	ldr	r3, .L123+80
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L65
.L122:
	str	r0, [r8]
	b	.L54
.L121:
	ldr	r3, .L123+68
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L66
.L124:
	.align	2
.L123:
	.word	mgba_open
	.word	mgba_printf
	.word	.LC0
	.word	.LC1
	.word	videoBuffer
	.word	1027
	.word	buttons
	.word	drawFrame1
	.word	.LANCHOR1
	.word	oldButtons
	.word	.LANCHOR0
	.word	forwardBool
	.word	backwardBool
	.word	.LC2
	.word	oldFrame
	.word	67109120
	.word	waitForVBlank
	.word	loopingForward
	.word	drawGame
	.word	loopingBackward
	.word	drawFrame4
	.size	main, .-main
	.comm	loopBool,4,4
	.global	speed
	.comm	backwardBool,4,4
	.comm	forwardBool,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.global	frameCount
	.global	frameDelay
	.comm	oldFrame,4,4
	.global	frame
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	frameDelay, %object
	.size	frameDelay, 4
frameDelay:
	.word	30
	.type	frame, %object
	.size	frame, 4
frame:
	.word	1
	.type	speed, %object
	.size	speed, 4
speed:
	.word	3
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	frameCount, %object
	.size	frameCount, 4
frameCount:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
