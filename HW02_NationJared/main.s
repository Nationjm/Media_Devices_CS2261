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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r0, #0
	mov	r3, #8
	mov	r10, #115
	mov	r9, #141
	mov	r1, #16
	mov	ip, #214
	mov	r8, #21
	mov	r7, #10
	mov	r6, #31
	ldr	fp, .L4+4
	strh	fp, [r2]	@ movhi
	ldr	fp, .L4+8
	ldr	r2, .L4+12
	strb	r0, [fp]
	ldr	fp, .L4+16
	str	fp, [r2, #28]
	ldr	fp, .L4+20
	stmib	r2, {r9, r10}
	str	r10, [r2]
	str	r9, [r2, #12]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	str	r0, [r2, #24]
	str	r2, [fp]
	ldr	r2, .L4+24
	stmib	r2, {r8, ip}
	str	r3, [r2, #16]
	strh	r0, [r2, #32]	@ movhi
	str	ip, [r2]
	str	r8, [r2, #12]
	str	r1, [r2, #20]
	ldr	r2, .L4+28
	stmib	r2, {r6, r7}
	str	r6, [r2, #12]
	mov	r6, #1	@ movhi
	mov	r5, #156
	mov	r4, #41
	str	r1, [r2, #20]
	str	r3, [r2, #16]
	str	r7, [r2]
	strh	r6, [r2, #32]	@ movhi
	ldr	r2, .L4+32
	stmib	r2, {r4, r5}
	str	r4, [r2, #12]
	mov	r4, #60
	str	r1, [r2, #20]
	str	r3, [r2, #16]
	strh	r0, [r2, #32]	@ movhi
	str	r5, [r2]
	ldr	r2, .L4+36
	str	r4, [r2]
	str	r4, [r2, #8]
	ldr	r4, .L4+40
	strh	r0, [r4, #32]	@ movhi
	mov	r0, #51
	str	r1, [r2, #20]
	str	r0, [r2, #4]
	str	r0, [r2, #12]
	strh	r6, [r2, #32]	@ movhi
	str	r3, [r2, #16]
	mov	r2, #106
	str	r2, [r4]
	str	r2, [r4, #8]
	mov	r2, #61
	str	r2, [r4, #4]
	str	r2, [r4, #12]
	ldr	r2, .L4+44
	add	r0, r0, #972
	str	r0, [r2, #32]
	mov	r0, #81
	str	ip, [r2]
	str	ip, [r2, #8]
	str	r1, [r4, #20]
	mov	ip, #23
	str	r3, [r4, #16]
	mov	r4, #101
	str	r1, [r2, #20]
	str	r0, [r2, #4]
	str	r0, [r2, #12]
	str	r3, [r2, #16]
	ldr	r0, .L4+48
	ldr	r2, .L4+52
	mov	lr, #121
	str	r1, [r0, #20]
	str	r3, [r0, #16]
	str	r2, [r0, #32]
	str	ip, [r0]
	str	ip, [r0, #8]
	str	r4, [r0, #4]
	str	r4, [r0, #12]
	mov	r0, #56
	ldr	r2, .L4+56
	str	r1, [r2, #20]
	str	lr, [r2, #4]
	str	lr, [r2, #12]
	str	r0, [r2]
	str	r0, [r2, #8]
	str	r3, [r2, #16]
	mov	r3, #3
	ldr	ip, .L4+60
	ldr	r1, .L4+64
	str	ip, [r2, #32]
	str	r3, [r1]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	1027
	.word	state
	.word	player1
	.word	32767
	.word	player
	.word	log1
	.word	log2
	.word	log3
	.word	log4
	.word	log5
	.word	car1
	.word	car2
	.word	65567
	.word	car3
	.word	32736
	.word	lives
	.size	initialize, .-initialize
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
	ldr	r3, .L27
	ldr	r2, .L27+4
	ldr	r3, [r3]
	ldrh	r2, [r2]
	ldr	r1, [r3]
	ldr	r0, [r3, #4]
	tst	r2, #64
	str	lr, [sp, #-4]!
	str	r1, [r3, #8]
	str	r0, [r3, #12]
	bne	.L7
	cmp	r0, #20
	movle	ip, #0
	movgt	ip, #1
	ldr	lr, .L27+8
	ldrh	lr, [lr]
	ands	ip, ip, lr, lsr #6
	bne	.L24
.L7:
	tst	r2, #128
	beq	.L25
.L8:
	tst	r2, #32
	bne	.L9
	cmp	r1, #20
	movle	r0, #0
	movgt	r0, #1
	ldr	ip, .L27+8
	ldrh	ip, [ip]
	ands	r0, r0, ip, lsr #5
	bne	.L26
.L9:
	tst	r2, #16
	bne	.L6
	cmp	r1, #209
	movgt	r2, #0
	movle	r2, #1
	ldr	r0, .L27+8
	ldrh	r0, [r0]
	ands	r2, r2, r0, lsr #4
	movne	r2, #1
	addne	r1, r1, #10
	strne	r1, [r3]
	strne	r2, [r3, #24]
.L6:
	ldr	lr, [sp], #4
	bx	lr
.L25:
	cmp	r0, #139
	movgt	ip, #0
	movle	ip, #1
	ldr	lr, .L27+8
	ldrh	lr, [lr]
	ands	ip, ip, lr, lsr #7
	movne	ip, #1
	addne	r0, r0, #10
	strne	r0, [r3, #4]
	strne	ip, [r3, #24]
	b	.L8
.L26:
	mov	r2, #1
	sub	r1, r1, #10
	str	r1, [r3]
	str	r2, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L24:
	mov	ip, #1
	sub	r0, r0, #10
	str	r0, [r3, #4]
	str	ip, [r3, #24]
	b	.L8
.L28:
	.align	2
.L27:
	.word	player
	.word	buttons
	.word	oldButtons
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
	ldr	r3, [r0, #24]
	cmp	r3, #0
	mov	r4, r0
	ldr	r2, [r0, #20]
	ldr	r3, [r0, #16]
	sub	sp, sp, #12
	beq	.L42
	ldr	r1, [r0, #12]
	cmp	r1, #139
	bgt	.L40
	cmp	r1, #80
	ldrgt	r0, .L45
	bgt	.L43
	cmp	r1, #70
	bgt	.L40
	cmp	r1, #20
	movgt	r0, #31744
	bgt	.L43
	cmp	r1, #10
	bgt	.L40
.L42:
	ldr	r5, .L45+4
.L30:
	ldrh	r1, [r4, #28]
	str	r1, [sp]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	ldr	r1, [r4, #4]
	sub	r3, r1, #21
	cmp	r3, #48
	bhi	.L35
	ldrh	r3, [r4, #30]
	cmp	r3, #0
	beq	.L44
.L35:
	mov	r2, #0
	ldr	r3, .L45+8
	strh	r2, [r3, #30]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L40:
	mov	r0, #992
.L43:
	str	r0, [sp]
	ldr	r5, .L45+4
	ldr	r0, [r4, #8]
	mov	lr, pc
	bx	r5
	mov	r3, #0
	ldr	r2, [r4, #20]
	str	r3, [r4, #24]
	ldr	r3, [r4, #16]
	b	.L30
.L44:
	mov	r3, #31744
	str	r3, [sp]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	r0, #115
	mov	r1, #141
	ldr	r2, .L45+12
	ldr	r3, [r2]
	sub	r3, r3, #1
	stm	r4, {r0, r1}
	str	r3, [r2]
	b	.L35
.L46:
	.align	2
.L45:
	.word	15855
	.word	drawRectangle
	.word	player1
	.word	lives
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawLogs
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLogs, %function
drawLogs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #31744
	push	{r4, r5, lr}
	mov	r4, r0
	sub	sp, sp, #12
	str	r3, [sp]
	add	r0, r0, #8
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #12]
	ldr	r5, .L61
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldr	ip, .L61+4
	ldr	r3, [r4, #16]
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	ldr	r2, [r4, #20]
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	cmp	r3, #10
	ldrh	ip, [r4, #32]
	bgt	.L59
	cmp	ip, #0
	moveq	r3, #214
	streq	r3, [r4]
	bne	.L51
.L50:
	ldr	r1, .L61+8
	ldr	r0, [r1]
	ldr	r2, [r1, #20]
	add	r2, r0, r2
	cmp	r3, r2
	bge	.L47
	ldr	r2, [r4, #20]
	add	r2, r3, r2
	cmp	r0, r2
	bge	.L47
	ldr	r5, [r1, #4]
	ldr	r2, [r1, #16]
	ldr	lr, [r4, #4]
	add	r2, r5, r2
	cmp	lr, r2
	bge	.L47
	ldr	r2, [r4, #16]
	add	lr, lr, r2
	cmp	r5, lr
	bge	.L47
	cmp	ip, #0
	mov	r2, #1
	beq	.L60
	add	r0, r0, r2
	cmp	r3, #214
	str	r0, [r1]
	strh	r2, [r1, #30]	@ movhi
	str	r2, [r1, #24]
	ble	.L47
.L57:
	mov	r3, #0
	strh	r3, [r1, #30]	@ movhi
.L47:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L59:
	cmp	ip, #0
	subeq	r3, r3, #1
	streq	r3, [r4]
	beq	.L50
	cmp	r3, #213
	ble	.L51
	cmp	ip, #1
	moveq	r2, #10
	moveq	r3, r2
	streq	r2, [r4]
	b	.L50
.L51:
	cmp	ip, #1
	addeq	r3, r3, #1
	streq	r3, [r4]
	b	.L50
.L60:
	sub	r0, r0, #1
	cmp	r3, #9
	str	r0, [r1]
	strh	r2, [r1, #30]	@ movhi
	str	r2, [r1, #24]
	bgt	.L47
	b	.L57
.L62:
	.align	2
.L61:
	.word	drawRectangle
	.word	5460
	.word	player1
	.size	drawLogs, .-drawLogs
	.align	2
	.global	drawCar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCar, %function
drawCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	ip, .L73
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	sub	sp, sp, #8
	add	r0, r0, #8
	ldm	r0, {r0, r1}
	ldr	r6, .L73+4
	str	ip, [sp]
	mov	lr, pc
	bx	r6
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #32]
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	str	r3, [sp]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	mov	lr, pc
	bx	r6
	ldr	r3, [r4]
	cmp	r3, #10
	ldrh	r2, [r4, #34]
	bgt	.L71
	cmp	r2, #0
	moveq	r3, #214
	streq	r3, [r4]
	bne	.L67
.L66:
	ldr	r5, .L73+8
	ldr	r0, [r5]
	ldr	r2, [r5, #20]
	add	r2, r0, r2
	cmp	r3, r2
	bge	.L63
	ldr	r2, [r4, #20]
	add	r3, r3, r2
	cmp	r0, r3
	bge	.L63
	ldr	r1, [r5, #4]
	ldr	r3, [r5, #16]
	ldr	r2, [r4, #4]
	add	r3, r1, r3
	cmp	r2, r3
	bge	.L63
	ldr	r3, [r4, #16]
	add	r2, r2, r3
	cmp	r1, r2
	blt	.L72
.L63:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L71:
	cmp	r2, #0
	subeq	r3, r3, #1
	streq	r3, [r4]
	beq	.L66
	cmp	r3, #213
	ble	.L67
	cmp	r2, #1
	moveq	r2, #10
	moveq	r3, r2
	streq	r2, [r4]
	b	.L66
.L67:
	cmp	r2, #1
	addeq	r3, r3, #1
	streq	r3, [r4]
	b	.L66
.L72:
	mov	r3, #8
	ldr	ip, .L73
	mov	r2, r3
	str	ip, [sp]
	mov	lr, pc
	bx	r6
	mov	r0, #115
	mov	r1, #141
	ldr	r2, .L73+12
	ldr	r3, [r2]
	sub	r3, r3, #1
	stm	r5, {r0, r1}
	str	r3, [r2]
	b	.L63
.L74:
	.align	2
.L73:
	.word	15855
	.word	drawRectangle
	.word	player1
	.word	lives
	.size	drawCar, .-drawCar
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, fp, lr}
	ldr	r3, .L91
	sub	sp, sp, #12
	ldr	r4, .L91+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L91+8
	mov	lr, pc
	bx	r3
	ldr	r10, .L91+12
	ldr	fp, .L91+16
	ldrh	r2, [r4]
	ldr	r6, .L91+20
	ldr	r9, .L91+24
	ldr	r8, .L91+28
	ldr	r7, .L91+32
.L76:
	ldr	r5, .L91+36
.L80:
	strh	r2, [r10]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	fp
	ldr	r3, .L91+40
	mov	lr, pc
	bx	r3
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L77
	cmp	r3, #2
	beq	.L78
	cmp	r3, #0
	beq	.L79
	ldrh	r2, [r4]
	b	.L80
.L77:
	str	r3, [sp, #4]
	ldr	r0, [r9]
	ldr	r3, .L91+44
	mov	lr, pc
	bx	r3
	ldrh	r2, [r4]
	ldr	r3, [sp, #4]
	ands	r5, r2, #1
	str	r3, [r9]
	bne	.L76
	ldrh	r3, [r10]
	tst	r3, #1
	beq	.L76
	ldr	r3, .L91+8
	mov	lr, pc
	bx	r3
	mov	r1, #3
	mov	r2, #115
	mov	r3, #141
	ldr	r0, .L91+48
	str	r1, [r0]
	ldr	r1, .L91+52
	strb	r5, [r6]
	stm	r1, {r2, r3}
	ldrh	r2, [r4]
	b	.L76
.L79:
	str	r3, [sp, #4]
	ldr	r3, .L91+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L91+48
	ldr	r2, [r3]
	ldr	r3, [sp, #4]
	cmp	r2, #0
	str	r3, [r9]
	moveq	r3, #2
	strbeq	r3, [r6]
	ldr	r3, .L91+52
	ldr	r3, [r3, #4]
	cmp	r3, #19
	movle	r3, #1
	ldr	r0, .L91+60
	strble	r3, [r6]
	mov	lr, pc
	bx	r8
	ldr	r0, .L91+64
	mov	lr, pc
	bx	r8
	ldr	r0, .L91+68
	mov	lr, pc
	bx	r8
	ldr	r0, .L91+72
	mov	lr, pc
	bx	r8
	ldr	r0, .L91+76
	mov	lr, pc
	bx	r8
	ldr	r0, .L91+80
	mov	lr, pc
	bx	r7
	ldr	r0, .L91+84
	mov	lr, pc
	bx	r7
	ldr	r0, .L91+88
	mov	lr, pc
	bx	r7
	ldr	r0, .L91+92
	mov	lr, pc
	bx	r7
	ldr	r0, .L91+96
	mov	lr, pc
	bx	r7
	ldr	r3, .L91+100
	ldr	r0, .L91+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L91+48
	ldr	r0, [r3]
	ldr	r3, .L91+104
	mov	lr, pc
	bx	r3
	ldrh	r2, [r4]
	b	.L76
.L78:
	ldr	r3, .L91+108
	ldr	r0, [r9]
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldrh	r2, [r4]
	ands	r5, r2, r3
	str	r3, [r9]
	bne	.L76
	ldrh	r3, [r10]
	tst	r3, #1
	beq	.L76
	ldr	r3, .L91+8
	mov	lr, pc
	bx	r3
	mov	r2, #141
	mov	r1, #115
	mov	r3, #3
	ldr	r0, .L91+52
	stm	r0, {r1, r2}
	ldr	r2, .L91+48
	strb	r5, [r6]
	str	r3, [r2]
	ldrh	r2, [r4]
	b	.L76
.L92:
	.align	2
.L91:
	.word	initialize
	.word	buttons
	.word	backgroundColors
	.word	oldButtons
	.word	update
	.word	state
	.word	.LANCHOR0
	.word	drawLogs
	.word	drawCar
	.word	67109120
	.word	waitForVBlank
	.word	win
	.word	lives
	.word	player1
	.word	game
	.word	log1
	.word	log2
	.word	log3
	.word	log4
	.word	log5
	.word	car1
	.word	car2
	.word	car3
	.word	car4
	.word	car5
	.word	drawPlayer
	.word	lifeDisp
	.word	lose
	.size	main, .-main
	.comm	player1,32,4
	.comm	player,4,4
	.comm	log5,36,4
	.comm	log4,36,4
	.comm	log3,36,4
	.comm	log2,36,4
	.comm	log1,36,4
	.comm	log,4,4
	.comm	car5,36,4
	.comm	car4,36,4
	.comm	car3,36,4
	.comm	car2,36,4
	.comm	car1,36,4
	.comm	car,4,4
	.comm	state,1,1
	.global	draw
	.global	stopDrawing
	.comm	lives,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	stopDrawing, %object
	.size	stopDrawing, 4
stopDrawing:
	.space	4
	.type	draw, %object
	.size	draw, 4
draw:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
