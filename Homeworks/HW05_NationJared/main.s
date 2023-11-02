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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	bubbleCollision.part.0, %function
bubbleCollision.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L4
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	sub	sp, sp, #20
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	bubble
	.word	collision
	.size	bubbleCollision.part.0, .-bubbleCollision.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerCollision.part.0, %function
playerCollision.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L8
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	sub	sp, sp, #20
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L8+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.word	collision
	.size	playerCollision.part.0, .-playerCollision.part.0
	.align	2
	.global	initGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame1, %function
initGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r2, #16
	mov	r3, #1
	mov	r1, #0
	mov	ip, #10
	mov	lr, #2
	mov	fp, #128
	mov	r5, #48
	mov	r10, #116
	mov	r9, #60
	ldr	r0, .L12
	stm	r0, {r2, fp}
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	str	lr, [r0, #40]
	str	r3, [r0, #28]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	ip, [r0, #24]
	strb	r1, [r0, #44]
	ldr	r0, .L12+4
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	str	r2, [r0]
	str	r5, [r0, #4]
	str	lr, [r0, #40]
	str	r1, [r0, #28]
	str	ip, [r0, #24]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	strb	r3, [r0, #44]
	str	r3, [r0, #32]
	ldr	r0, .L12+8
	strb	lr, [r0, #44]
	str	r2, [r0, #16]
	ldr	lr, .L12+12
	str	r2, [r0, #20]
	str	r10, [r0]
	str	r9, [r0, #4]
	str	r1, [r0, #28]
	str	ip, [r0, #24]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r3, [r0, #32]
	ldr	r0, .L12+16
	str	r2, [lr, #16]
	str	r5, [r0, #4]
	mov	r5, #3
	mov	r8, #80
	mov	r7, #70
	strb	r5, [lr, #44]
	mov	r5, #5
	str	r2, [lr, #20]
	str	r7, [lr, #4]
	str	r1, [lr, #28]
	str	ip, [lr, #24]
	str	r3, [lr, #8]
	str	r3, [lr, #12]
	str	r3, [lr, #32]
	str	r8, [lr]
	ldr	lr, .L12+20
	str	r2, [lr, #16]
	str	r2, [lr, #20]
	str	r2, [lr, #4]
	strb	r5, [lr, #44]
	str	r2, [lr]
	str	r1, [lr, #28]
	str	ip, [lr, #24]
	str	r3, [lr, #8]
	str	r1, [lr, #12]
	str	r3, [lr, #32]
	ldr	lr, .L12+24
	mov	r4, #208
	str	r2, [lr, #16]
	str	r2, [lr, #20]
	str	r2, [lr, #4]
	mov	r6, #7
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	mov	r2, #6
	str	r4, [r0]
	str	r1, [lr, #28]
	str	ip, [lr, #24]
	str	r3, [lr, #8]
	str	r1, [lr, #12]
	str	r3, [lr, #32]
	strb	r2, [lr, #44]
	str	r4, [lr]
	strb	r6, [r0, #44]
	str	r1, [r0, #28]
	str	ip, [r0, #24]
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	str	r3, [r0, #32]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	player
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	enemy6
	.word	enemy4
	.word	enemy5
	.size	initGame1, .-initGame1
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
	push	{r4, lr}
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L16+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #7168
	strh	r3, [r2]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #16384
	ldr	r2, .L16+16
	ldr	r1, .L16+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L16+24
	ldr	r1, .L16+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	bl	initGame1
	ldr	r3, .L16+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	mgba_open
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	100728832
	.word	BubbleBobbleSpritesheetTiles
	.word	83886592
	.word	BubbleBobbleSpritesheetPal
	.word	goToStart
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
	ldr	r4, .L75
	ldr	r3, .L75+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L75+8
	ldrh	r3, [r4]
	ldr	fp, .L75+12
	ldr	r10, .L75+16
	ldr	r9, .L75+20
	ldr	r6, .L75+24
	ldr	r8, .L75+28
	ldr	r7, .L75+32
.L28:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r8, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	fp
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r7
	mov	r0, #3
	mov	lr, pc
	bx	r10
	ldr	r3, [r9]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L68
.L22:
	.word	.L27
	.word	.L26
	.word	.L25
	.word	.L24
	.word	.L23
	.word	.L21
.L21:
	ldrh	r3, [r5]
	tst	r3, #512
	beq	.L43
	ldrh	r3, [r4]
	tst	r3, #512
	beq	.L72
.L43:
	ldr	r3, .L75+36
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L28
.L23:
	ldr	r3, .L75+40
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #512
	beq	.L68
	ldrh	r3, [r4]
	tst	r3, #512
	bne	.L28
	mov	r3, #3
	mov	r2, #6
	str	r3, [r6, #12]
	ldr	r3, .L75+44
	str	r2, [r6, #4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+48
	mov	lr, pc
	bx	r3
	b	.L68
.L24:
	ldr	r3, .L75+52
	ldr	r0, [r6, #8]
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldrh	r2, [r5]
	tst	r2, #2
	str	r3, [r6, #8]
	beq	.L37
	ldrh	r3, [r4]
	tst	r3, #2
	beq	.L73
.L37:
	ldr	r3, [r6, #4]
	cmp	r3, #0
	beq	.L71
.L38:
	ldr	r3, [r6, #12]
	cmp	r3, #0
	beq	.L39
.L68:
	ldrh	r3, [r4]
	b	.L28
.L25:
	ldr	r3, .L75+56
	ldr	r0, [r6]
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r2, [r6, #4]
	cmp	r2, r3
	str	r3, [r6]
	beq	.L74
	ldrh	r3, [r5]
	tst	r3, #2
	beq	.L38
	ldrh	r3, [r4]
	tst	r3, #2
	bne	.L38
.L45:
	mov	r3, #1
.L70:
	ldr	r2, .L75+60
	str	r3, [r2]
	ldr	r3, .L75+64
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L28
.L27:
	ldr	r3, .L75+68
	mov	lr, pc
	bx	r3
	ldrh	r2, [r5]
	tst	r2, #8
	ldrh	r3, [r4]
	beq	.L30
	tst	r3, #8
	bne	.L30
.L69:
	ldr	r3, .L75+72
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L28
.L26:
	ldr	r3, .L75+76
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L68
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L28
	ldr	r2, .L75+60
	ldr	r2, [r2]
	cmp	r2, #1
	beq	.L69
	cmp	r2, #2
	bne	.L28
	ldr	r3, .L75+80
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L28
.L30:
	tst	r2, #1
	beq	.L28
	tst	r3, #1
	bne	.L28
	b	.L69
.L74:
	mov	r3, #1
	mov	r2, #6
	str	r3, [r6]
	stmib	r6, {r2, r3}
	ldr	r3, .L75+80
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #2
	beq	.L34
	ldrh	r3, [r4]
	tst	r3, #2
	beq	.L45
.L34:
	ldr	r3, [r6, #4]
	cmp	r3, #0
	bne	.L38
.L71:
	ldr	r3, .L75+84
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L28
.L39:
	ldr	r3, .L75+88
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L28
.L73:
	mov	r3, #2
	b	.L70
.L72:
	ldr	r3, .L75+44
	mov	lr, pc
	bx	r3
	mov	r3, #6
	mov	r2, #3
	str	r3, [r6, #4]
	ldr	r3, .L75+48
	str	r2, [r6, #12]
	mov	lr, pc
	bx	r3
	b	.L43
.L76:
	.align	2
.L75:
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	waitForVBlank
	.word	DMANow
	.word	state
	.word	.LANCHOR0
	.word	67109120
	.word	shadowOAM
	.word	lose
	.word	win
	.word	initGame1
	.word	goToStart
	.word	game2
	.word	game1
	.word	.LANCHOR1
	.word	goToPause
	.word	start
	.word	goToGame1
	.word	pause
	.word	goToGame2
	.word	goToWin
	.word	goToLose
	.size	main, .-main
	.text
	.align	2
	.global	initGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame2, %function
initGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r3, #1
	mov	r2, #16
	mov	r1, #0
	mov	ip, #10
	mov	lr, #2
	mov	fp, #112
	mov	r10, #30
	mov	r9, #90
	mov	r7, #100
	ldr	r0, .L79
	stm	r0, {r2, fp}
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	str	lr, [r0, #40]
	str	r3, [r0, #28]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	ip, [r0, #24]
	strb	r1, [r0, #44]
	ldr	r0, .L79+4
	mov	r8, #200
	str	r10, [r0]
	str	r9, [r0, #4]
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	str	lr, [r0, #40]
	str	r1, [r0, #28]
	str	ip, [r0, #24]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	strb	r3, [r0, #44]
	str	r3, [r0, #32]
	ldr	r0, .L79+8
	strb	lr, [r0, #44]
	str	r7, [r0, #4]
	mov	lr, #40
	mov	r7, #80
	str	r8, [r0]
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	str	r1, [r0, #28]
	str	ip, [r0, #24]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r3, [r0, #32]
	ldr	r0, .L79+12
	str	r2, [r0, #16]
	stm	r0, {r7, lr}
	mov	lr, #3
	strb	lr, [r0, #44]
	mov	lr, #5
	str	r2, [r0, #20]
	str	r1, [r0, #28]
	str	ip, [r0, #24]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r3, [r0, #32]
	ldr	r0, .L79+16
	mov	r4, #208
	strb	lr, [r0, #44]
	mov	lr, #6
	mov	r6, #48
	mov	r5, #7
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	str	r2, [r0]
	str	r2, [r0, #4]
	str	r1, [r0, #28]
	str	ip, [r0, #24]
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	str	r3, [r0, #32]
	ldr	r0, .L79+20
	str	r4, [r0]
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	strb	lr, [r0, #44]
	str	r2, [r0, #4]
	str	r1, [r0, #28]
	str	ip, [r0, #24]
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	str	r3, [r0, #32]
	ldr	r0, .L79+24
	str	r4, [r0]
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	str	r6, [r0, #4]
	strb	r5, [r0, #44]
	str	r1, [r0, #28]
	str	ip, [r0, #24]
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	str	r3, [r0, #32]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	player
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.word	enemy5
	.word	enemy6
	.size	initGame2, .-initGame2
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #0
	ldr	r3, .L161
	ldr	ip, .L161+4
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #20]
	ldr	r0, .L161+8
	ldr	lr, [r3]
	ldr	r5, [r3, #16]
	ldrh	r4, [ip]
	ldr	r6, [r3, #12]
	add	r1, r2, r1
	ldrh	ip, [r0]
	sub	r7, r1, #1
	ldr	r0, .L161+12
	add	r8, r5, lr
	sub	sp, sp, #20
	sub	r8, r8, #1
	str	r9, [r3, #32]
	tst	r4, #32
	add	r9, r7, r6
	str	r8, [sp, #4]
	str	r9, [sp, #8]
	ldr	r0, [r0]
	and	r8, r4, #16
	and	ip, ip, #64
	bne	.L82
	ldr	r9, [r3, #8]
	cmp	r0, #2
	sub	r10, lr, r9
	str	r10, [sp, #12]
	beq	.L153
	cmp	r0, #3
	beq	.L154
.L88:
	cmp	r8, #0
	bne	.L91
	ldr	r8, [sp, #4]
	add	r8, r9, r8
	b	.L92
.L154:
	ldr	r10, .L161+16
	sub	fp, lr, r9
	add	fp, fp, r2, lsl #8
	ldrb	fp, [r10, fp]	@ zero_extendqisi2
	cmp	fp, #0
	beq	.L88
.L87:
	ldr	r9, [sp, #12]
	add	r9, r9, r7, lsl #8
	ldrb	r9, [r10, r9]	@ zero_extendqisi2
	cmp	r9, #0
	beq	.L82
	cmp	lr, #0
	ldrgt	r9, [sp, #12]
	mov	r10, #0
	strgt	r9, [r3]
	mov	r9, #1
	str	r10, [r3, #28]
	str	r9, [r3, #32]
.L82:
	cmp	r8, #0
	bne	.L91
	ldr	r9, [r3, #8]
	ldr	r8, [sp, #4]
	cmp	r0, #2
	add	r8, r9, r8
	beq	.L155
.L92:
	cmp	r0, #3
	beq	.L156
	cmp	ip, #0
	beq	.L115
.L100:
	tst	r4, #64
	bne	.L152
	cmp	r0, #2
	sub	r1, r1, #24
	beq	.L157
	cmp	r0, #3
	beq	.L158
.L108:
	cmp	r2, #35
	bgt	.L112
	ldr	r2, [r3, #4]
	b	.L113
.L156:
	ldr	r10, .L161+16
	add	fp, r8, r2, lsl #8
	ldrb	fp, [r10, fp]	@ zero_extendqisi2
	cmp	fp, #0
	beq	.L159
.L96:
	add	r7, r8, r7, lsl #8
	ldrb	r7, [r10, r7]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L91
	ldr	r7, [r3]
	rsb	r5, r5, #240
	cmp	r7, r5
	mov	r5, #1
	addlt	r9, r7, r9
	strlt	r9, [r3]
	str	r5, [r3, #28]
	str	r5, [r3, #32]
.L91:
	cmp	ip, #0
	bne	.L100
.L152:
	ldr	r2, [r3, #4]
.L101:
	cmp	r0, #2
	ldreq	r10, .L161+20
	beq	.L131
.L113:
	cmp	r0, #3
	beq	.L160
.L115:
	cmp	r2, #160
	mvngt	r1, #15
	movgt	r2, #240
	strgt	r1, [r3, #4]
	ldrb	r0, [r3, #44]	@ zero_extendqisi2
	ldr	r1, [r3]
	ldr	ip, .L161+24
	ldr	r3, [r3, #28]
	andle	r2, r2, #255
	cmp	r3, #1
	add	r3, ip, r0, lsl #3
	lsl	r0, r0, #3
	strh	r2, [ip, r0]	@ movhi
	mov	r2, #576
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	orr	lr, r1, #16384
	orreq	r1, r1, #20480
	strh	lr, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strheq	r1, [r3, #2]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L157:
	ldr	r10, .L161+20
	add	ip, lr, r1, lsl #8
	ldrb	ip, [r10, ip]	@ zero_extendqisi2
	cmp	ip, #0
	lsl	r1, r1, #8
	bne	.L107
	cmp	r2, #35
	bgt	.L112
	ldr	r2, [r3, #4]
.L131:
	ldr	r0, [sp, #8]
	add	lr, lr, r0, lsl #8
	ldrb	r1, [r10, lr]	@ zero_extendqisi2
	cmp	r1, #0
	lsl	r1, r0, #8
	beq	.L115
	ldr	r0, [sp, #4]
	add	r1, r0, r1
	ldrb	r1, [r10, r1]	@ zero_extendqisi2
	cmp	r1, #0
	addne	r2, r2, r6
	strne	r2, [r3, #4]
	b	.L115
.L153:
	ldr	r10, .L161+20
	sub	fp, lr, r9
	add	fp, fp, r2, lsl #8
	ldrb	fp, [r10, fp]	@ zero_extendqisi2
	cmp	fp, #0
	lsl	fp, r2, #8
	bne	.L87
	cmp	r8, #0
	bne	.L91
	ldr	r8, [sp, #4]
	add	r8, r9, r8
	b	.L127
.L110:
	cmp	r2, #35
	ble	.L152
.L112:
	sub	r2, r2, #35
	str	r2, [r3, #4]
	b	.L101
.L160:
	ldr	r10, .L161+16
	b	.L131
.L155:
	ldr	r10, .L161+20
	lsl	fp, r2, #8
.L127:
	add	fp, r8, fp
	ldrb	fp, [r10, fp]	@ zero_extendqisi2
	cmp	fp, #0
	bne	.L96
	cmp	ip, #0
	bne	.L100
	b	.L131
.L159:
	cmp	ip, #0
	beq	.L131
	tst	r4, #64
	subeq	r1, r1, #24
	bne	.L152
.L149:
	add	ip, lr, r1, lsl #8
	ldrb	ip, [r10, ip]	@ zero_extendqisi2
	cmp	ip, #0
	lsl	r1, r1, #8
	beq	.L108
.L107:
	ldr	ip, [sp, #4]
	add	r1, ip, r1
	ldrb	r1, [r10, r1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L110
	cmp	r2, #23
	subgt	r2, r2, #23
	strgt	r2, [r3, #4]
	bgt	.L101
	b	.L152
.L158:
	ldr	r10, .L161+16
	b	.L149
.L162:
	.align	2
.L161:
	.word	player
	.word	buttons
	.word	oldButtons
	.word	state
	.word	Level2CollisionBitmapBitmap
	.word	Level1CollisionBitmapBitmap
	.word	shadowOAM
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateEnemy1
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy1, %function
updateEnemy1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L232
	ldr	ip, [r4, #32]
	cmp	ip, #0
	beq	.L163
	ldr	r3, .L232+4
	ldr	r5, [r4]
	ldr	lr, [r3]
	ldr	r1, [r4, #16]
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #20]
	add	r1, r5, r1
	add	r2, r0, r2
	cmp	lr, #2
	sub	r1, r1, #1
	sub	r2, r2, #1
	beq	.L227
	cmp	lr, #3
	beq	.L228
.L170:
	ldr	r3, [r4, #8]
	cmp	lr, #3
	rsb	r3, r3, #0
	str	r3, [r4, #8]
	beq	.L229
	ldr	r6, [r4, #12]
	ldr	r4, .L232
	rsb	r3, r3, #0
	str	r3, [r4, #8]
.L181:
	rsb	r6, r6, #0
	cmp	lr, #3
	str	r6, [r4, #12]
	ldreq	r8, .L232+8
	beq	.L210
.L187:
	rsb	r6, r6, #0
	str	r6, [r4, #12]
.L191:
	mov	lr, #64
	add	r3, r5, r3
	add	r0, r0, r6
	ldrb	r1, [r4, #44]	@ zero_extendqisi2
	ldr	r6, .L232+12
	lsl	r2, r3, #23
	ldr	r5, .L232+16
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	str	r3, [r4]
	add	r3, r6, r1, lsl #3
	strh	r2, [r3, #2]	@ movhi
	ldr	r2, [r5, #32]
	and	r7, r0, #255
	lsl	r1, r1, #3
	tst	ip, r2
	str	r0, [r4, #4]
	strh	r7, [r6, r1]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	beq	.L192
	ldr	r0, .L232
	bl	bubbleCollision.part.0
	cmp	r0, #0
	bne	.L230
.L192:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L163
	ldr	r0, .L232
	bl	playerCollision.part.0
	cmp	r0, #0
	beq	.L163
	mov	ip, #16
	mov	r0, #112
	ldr	r1, .L232+20
	ldr	r3, [r1, #12]
	ldr	r2, .L232+24
	sub	r3, r3, #1
	str	r3, [r1, #12]
	str	ip, [r2]
	str	r0, [r2, #4]
.L163:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L230:
	mov	r2, #0
	mov	r0, #512
	ldr	r1, .L232+20
	ldr	r3, [r1, #4]
	sub	r3, r3, #1
	str	r3, [r1, #4]
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	lsl	r3, r3, #3
	strh	r0, [r6, r3]	@ movhi
	str	r2, [r5, #32]
	str	r2, [r4, #32]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L227:
	ldr	lr, .L232+28
	add	r3, r5, r2, lsl #8
	ldrb	r8, [lr, r3]	@ zero_extendqisi2
	cmp	r8, #0
	lsl	r7, r2, #8
	ldr	r3, [r4, #8]
	lsleq	r2, r0, #8
	beq	.L167
	add	r2, r5, r0, lsl #8
	ldrb	r2, [lr, r2]	@ zero_extendqisi2
	cmp	r2, #0
	lsl	r2, r0, #8
	beq	.L167
.L171:
	add	r6, r1, r7
	ldrb	r6, [lr, r6]	@ zero_extendqisi2
	cmp	r6, #0
	ldr	r6, [r4, #12]
	beq	.L174
	add	r9, r1, r2
	ldrb	r9, [lr, r9]	@ zero_extendqisi2
	cmp	r9, #0
	beq	.L174
	cmp	r8, #0
	bne	.L183
	b	.L182
.L174:
	add	r8, r7, r5
	ldrb	r8, [lr, r8]	@ zero_extendqisi2
	rsb	r3, r3, #0
	cmp	r8, #0
	str	r3, [r4, #8]
	bne	.L231
.L182:
	rsb	r6, r6, #0
	str	r6, [r4, #12]
.L183:
	add	r7, r5, r2
	ldrb	r7, [lr, r7]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L187
	add	r1, r1, r2
	ldrb	r2, [lr, r1]	@ zero_extendqisi2
.L190:
	cmp	r2, #0
	bne	.L191
	b	.L187
.L167:
	rsb	r3, r3, #0
	str	r3, [r4, #8]
	b	.L171
.L228:
	ldr	r8, .L232+8
	add	r3, r5, r2, lsl #8
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	lsl	r7, r2, #8
	beq	.L170
	add	r3, r5, r0, lsl #8
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L172
	b	.L170
.L229:
	ldr	r8, .L232+8
	lsl	r7, r2, #8
.L172:
	add	r3, r1, r7
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L175
	add	r3, r4, #8
	ldm	r3, {r3, r6}
.L176:
	rsb	r3, r3, #0
	str	r3, [r4, #8]
.L179:
	add	r2, r5, r7
	ldrb	r2, [r8, r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L181
	add	r7, r1, r7
	ldrb	r2, [r8, r7]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L181
.L210:
	add	r2, r5, r0, lsl #8
	ldrb	r2, [r8, r2]	@ zero_extendqisi2
	cmp	r2, #0
	lsl	r2, r0, #8
	beq	.L187
	add	r1, r1, r2
	ldrb	r2, [r8, r1]	@ zero_extendqisi2
	b	.L190
.L175:
	add	r3, r1, r0, lsl #8
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, r4, #8
	ldm	r3, {r3, r6}
	beq	.L176
	b	.L179
.L231:
	add	r7, r7, r1
	ldrb	r7, [lr, r7]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L182
	b	.L183
.L233:
	.align	2
.L232:
	.word	enemy1
	.word	state
	.word	Level2CollisionBitmapBitmap
	.word	shadowOAM
	.word	bubble
	.word	.LANCHOR0
	.word	player
	.word	Level1CollisionBitmapBitmap
	.size	updateEnemy1, .-updateEnemy1
	.align	2
	.global	updateEnemy2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy2, %function
updateEnemy2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L303
	ldr	ip, [r4, #32]
	cmp	ip, #0
	beq	.L234
	ldr	r3, .L303+4
	ldr	r5, [r4]
	ldr	lr, [r3]
	ldr	r1, [r4, #16]
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #20]
	add	r1, r5, r1
	add	r2, r0, r2
	cmp	lr, #2
	sub	r1, r1, #1
	sub	r2, r2, #1
	beq	.L298
	cmp	lr, #3
	beq	.L299
.L241:
	ldr	r3, [r4, #8]
	cmp	lr, #3
	rsb	r3, r3, #0
	str	r3, [r4, #8]
	beq	.L300
	ldr	r6, [r4, #12]
	ldr	r4, .L303
	rsb	r3, r3, #0
	str	r3, [r4, #8]
.L252:
	rsb	r6, r6, #0
	cmp	lr, #3
	str	r6, [r4, #12]
	ldreq	r8, .L303+8
	beq	.L281
.L258:
	rsb	r6, r6, #0
	str	r6, [r4, #12]
.L262:
	mov	lr, #64
	add	r3, r5, r3
	add	r0, r0, r6
	ldrb	r1, [r4, #44]	@ zero_extendqisi2
	ldr	r6, .L303+12
	lsl	r2, r3, #23
	ldr	r5, .L303+16
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	str	r3, [r4]
	add	r3, r6, r1, lsl #3
	strh	r2, [r3, #2]	@ movhi
	ldr	r2, [r5, #32]
	and	r7, r0, #255
	lsl	r1, r1, #3
	tst	ip, r2
	str	r0, [r4, #4]
	strh	r7, [r6, r1]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	beq	.L263
	ldr	r0, .L303
	bl	bubbleCollision.part.0
	cmp	r0, #0
	bne	.L301
.L263:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L234
	ldr	r0, .L303
	bl	playerCollision.part.0
	cmp	r0, #0
	beq	.L234
	mov	ip, #16
	mov	r0, #112
	ldr	r1, .L303+20
	ldr	r3, [r1, #12]
	ldr	r2, .L303+24
	sub	r3, r3, #1
	str	r3, [r1, #12]
	str	ip, [r2]
	str	r0, [r2, #4]
.L234:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L301:
	mov	r2, #0
	mov	r0, #512
	ldr	r1, .L303+20
	ldr	r3, [r1, #4]
	sub	r3, r3, #1
	str	r3, [r1, #4]
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	lsl	r3, r3, #3
	strh	r0, [r6, r3]	@ movhi
	str	r2, [r5, #32]
	str	r2, [r4, #32]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L298:
	ldr	lr, .L303+28
	add	r3, r5, r2, lsl #8
	ldrb	r8, [lr, r3]	@ zero_extendqisi2
	cmp	r8, #0
	lsl	r7, r2, #8
	ldr	r3, [r4, #8]
	lsleq	r2, r0, #8
	beq	.L238
	add	r2, r5, r0, lsl #8
	ldrb	r2, [lr, r2]	@ zero_extendqisi2
	cmp	r2, #0
	lsl	r2, r0, #8
	beq	.L238
.L242:
	add	r6, r1, r7
	ldrb	r6, [lr, r6]	@ zero_extendqisi2
	cmp	r6, #0
	ldr	r6, [r4, #12]
	beq	.L245
	add	r9, r1, r2
	ldrb	r9, [lr, r9]	@ zero_extendqisi2
	cmp	r9, #0
	beq	.L245
	cmp	r8, #0
	bne	.L254
	b	.L253
.L245:
	add	r8, r7, r5
	ldrb	r8, [lr, r8]	@ zero_extendqisi2
	rsb	r3, r3, #0
	cmp	r8, #0
	str	r3, [r4, #8]
	bne	.L302
.L253:
	rsb	r6, r6, #0
	str	r6, [r4, #12]
.L254:
	add	r7, r5, r2
	ldrb	r7, [lr, r7]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L258
	add	r1, r1, r2
	ldrb	r2, [lr, r1]	@ zero_extendqisi2
.L261:
	cmp	r2, #0
	bne	.L262
	b	.L258
.L238:
	rsb	r3, r3, #0
	str	r3, [r4, #8]
	b	.L242
.L299:
	ldr	r8, .L303+8
	add	r3, r5, r2, lsl #8
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	lsl	r7, r2, #8
	beq	.L241
	add	r3, r5, r0, lsl #8
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L243
	b	.L241
.L300:
	ldr	r8, .L303+8
	lsl	r7, r2, #8
.L243:
	add	r3, r1, r7
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L246
	add	r3, r4, #8
	ldm	r3, {r3, r6}
.L247:
	rsb	r3, r3, #0
	str	r3, [r4, #8]
.L250:
	add	r2, r5, r7
	ldrb	r2, [r8, r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L252
	add	r7, r1, r7
	ldrb	r2, [r8, r7]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L252
.L281:
	add	r2, r5, r0, lsl #8
	ldrb	r2, [r8, r2]	@ zero_extendqisi2
	cmp	r2, #0
	lsl	r2, r0, #8
	beq	.L258
	add	r1, r1, r2
	ldrb	r2, [r8, r1]	@ zero_extendqisi2
	b	.L261
.L246:
	add	r3, r1, r0, lsl #8
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, r4, #8
	ldm	r3, {r3, r6}
	beq	.L247
	b	.L250
.L302:
	add	r7, r7, r1
	ldrb	r7, [lr, r7]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L253
	b	.L254
.L304:
	.align	2
.L303:
	.word	enemy2
	.word	state
	.word	Level2CollisionBitmapBitmap
	.word	shadowOAM
	.word	bubble
	.word	.LANCHOR0
	.word	player
	.word	Level1CollisionBitmapBitmap
	.size	updateEnemy2, .-updateEnemy2
	.align	2
	.global	updateEnemy3
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy3, %function
updateEnemy3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L374
	ldr	ip, [r4, #32]
	cmp	ip, #0
	beq	.L305
	ldr	r3, .L374+4
	ldr	r5, [r4]
	ldr	lr, [r3]
	ldr	r1, [r4, #16]
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #20]
	add	r1, r5, r1
	add	r2, r0, r2
	cmp	lr, #2
	sub	r1, r1, #1
	sub	r2, r2, #1
	beq	.L369
	cmp	lr, #3
	beq	.L370
.L312:
	ldr	r3, [r4, #8]
	cmp	lr, #3
	rsb	r3, r3, #0
	str	r3, [r4, #8]
	beq	.L371
	ldr	r6, [r4, #12]
	ldr	r4, .L374
	rsb	r3, r3, #0
	str	r3, [r4, #8]
.L323:
	rsb	r6, r6, #0
	cmp	lr, #3
	str	r6, [r4, #12]
	ldreq	r8, .L374+8
	beq	.L352
.L329:
	rsb	r6, r6, #0
	str	r6, [r4, #12]
.L333:
	mov	lr, #64
	add	r3, r5, r3
	add	r0, r0, r6
	ldrb	r1, [r4, #44]	@ zero_extendqisi2
	ldr	r6, .L374+12
	lsl	r2, r3, #23
	ldr	r5, .L374+16
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	str	r3, [r4]
	add	r3, r6, r1, lsl #3
	strh	r2, [r3, #2]	@ movhi
	ldr	r2, [r5, #32]
	and	r7, r0, #255
	lsl	r1, r1, #3
	tst	ip, r2
	str	r0, [r4, #4]
	strh	r7, [r6, r1]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	beq	.L334
	ldr	r0, .L374
	bl	bubbleCollision.part.0
	cmp	r0, #0
	bne	.L372
.L334:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L305
	ldr	r0, .L374
	bl	playerCollision.part.0
	cmp	r0, #0
	beq	.L305
	mov	ip, #16
	mov	r0, #112
	ldr	r1, .L374+20
	ldr	r3, [r1, #12]
	ldr	r2, .L374+24
	sub	r3, r3, #1
	str	r3, [r1, #12]
	str	ip, [r2]
	str	r0, [r2, #4]
.L305:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L372:
	mov	r2, #0
	mov	r0, #512
	ldr	r1, .L374+20
	ldr	r3, [r1, #4]
	sub	r3, r3, #1
	str	r3, [r1, #4]
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	lsl	r3, r3, #3
	strh	r0, [r6, r3]	@ movhi
	str	r2, [r5, #32]
	str	r2, [r4, #32]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L369:
	ldr	lr, .L374+28
	add	r3, r5, r2, lsl #8
	ldrb	r8, [lr, r3]	@ zero_extendqisi2
	cmp	r8, #0
	lsl	r7, r2, #8
	ldr	r3, [r4, #8]
	lsleq	r2, r0, #8
	beq	.L309
	add	r2, r5, r0, lsl #8
	ldrb	r2, [lr, r2]	@ zero_extendqisi2
	cmp	r2, #0
	lsl	r2, r0, #8
	beq	.L309
.L313:
	add	r6, r1, r7
	ldrb	r6, [lr, r6]	@ zero_extendqisi2
	cmp	r6, #0
	ldr	r6, [r4, #12]
	beq	.L316
	add	r9, r1, r2
	ldrb	r9, [lr, r9]	@ zero_extendqisi2
	cmp	r9, #0
	beq	.L316
	cmp	r8, #0
	bne	.L325
	b	.L324
.L316:
	add	r8, r7, r5
	ldrb	r8, [lr, r8]	@ zero_extendqisi2
	rsb	r3, r3, #0
	cmp	r8, #0
	str	r3, [r4, #8]
	bne	.L373
.L324:
	rsb	r6, r6, #0
	str	r6, [r4, #12]
.L325:
	add	r7, r5, r2
	ldrb	r7, [lr, r7]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L329
	add	r1, r1, r2
	ldrb	r2, [lr, r1]	@ zero_extendqisi2
.L332:
	cmp	r2, #0
	bne	.L333
	b	.L329
.L309:
	rsb	r3, r3, #0
	str	r3, [r4, #8]
	b	.L313
.L370:
	ldr	r8, .L374+8
	add	r3, r5, r2, lsl #8
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	lsl	r7, r2, #8
	beq	.L312
	add	r3, r5, r0, lsl #8
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L314
	b	.L312
.L371:
	ldr	r8, .L374+8
	lsl	r7, r2, #8
.L314:
	add	r3, r1, r7
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L317
	add	r3, r4, #8
	ldm	r3, {r3, r6}
.L318:
	rsb	r3, r3, #0
	str	r3, [r4, #8]
.L321:
	add	r2, r5, r7
	ldrb	r2, [r8, r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L323
	add	r7, r1, r7
	ldrb	r2, [r8, r7]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L323
.L352:
	add	r2, r5, r0, lsl #8
	ldrb	r2, [r8, r2]	@ zero_extendqisi2
	cmp	r2, #0
	lsl	r2, r0, #8
	beq	.L329
	add	r1, r1, r2
	ldrb	r2, [r8, r1]	@ zero_extendqisi2
	b	.L332
.L317:
	add	r3, r1, r0, lsl #8
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, r4, #8
	ldm	r3, {r3, r6}
	beq	.L318
	b	.L321
.L373:
	add	r7, r7, r1
	ldrb	r7, [lr, r7]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L324
	b	.L325
.L375:
	.align	2
.L374:
	.word	enemy3
	.word	state
	.word	Level2CollisionBitmapBitmap
	.word	shadowOAM
	.word	bubble
	.word	.LANCHOR0
	.word	player
	.word	Level1CollisionBitmapBitmap
	.size	updateEnemy3, .-updateEnemy3
	.align	2
	.global	updateEnemy4
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy4, %function
updateEnemy4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L416
	ldr	r0, [r4, #32]
	cmp	r0, #0
	beq	.L376
	ldr	r2, .L416+4
	ldr	r5, [r4]
	ldr	lr, [r2]
	ldr	r1, [r4, #16]
	ldr	ip, [r4, #4]
	ldr	r2, [r4, #20]
	add	r1, r5, r1
	add	r2, ip, r2
	cmp	lr, #2
	ldr	r3, [r4, #8]
	sub	r1, r1, #1
	sub	r2, r2, #1
	beq	.L412
	cmp	lr, #3
	beq	.L413
.L383:
	rsb	r3, r3, #0
	cmp	lr, #3
	str	r3, [r4, #8]
	beq	.L414
.L387:
	rsb	r3, r3, #0
	str	r3, [r4, #8]
.L390:
	mov	lr, #256
	add	r3, r5, r3
	ldrb	r1, [r4, #44]	@ zero_extendqisi2
	ldr	r5, .L416+8
	lsl	r2, r3, #23
	ldr	r6, .L416+12
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	str	r3, [r4]
	add	r3, r5, r1, lsl #3
	strh	r2, [r3, #2]	@ movhi
	ldr	r2, [r6, #32]
	and	ip, ip, #255
	lsl	r1, r1, #3
	tst	r0, r2
	strh	ip, [r5, r1]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	beq	.L391
	ldr	r0, .L416
	bl	bubbleCollision.part.0
	cmp	r0, #0
	bne	.L415
.L391:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L376
	ldr	r0, .L416
	bl	playerCollision.part.0
	cmp	r0, #0
	beq	.L376
	mov	ip, #16
	mov	r0, #112
	ldr	r1, .L416+16
	ldr	r3, [r1, #12]
	ldr	r2, .L416+20
	sub	r3, r3, #1
	str	r3, [r1, #12]
	str	ip, [r2]
	str	r0, [r2, #4]
.L376:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L415:
	mov	r2, #0
	mov	r0, #512
	ldr	r1, .L416+16
	ldr	r3, [r1, #4]
	sub	r3, r3, #1
	str	r3, [r1, #4]
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	lsl	r3, r3, #3
	strh	r0, [r5, r3]	@ movhi
	str	r2, [r6, #32]
	str	r2, [r4, #32]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L412:
	ldr	lr, .L416+24
	add	r6, r5, r2, lsl #8
	ldrb	r6, [lr, r6]	@ zero_extendqisi2
	cmp	r6, #0
	lsl	r2, r2, #8
	beq	.L380
	add	r6, r5, ip, lsl #8
	ldrb	r6, [lr, r6]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L380
.L384:
	add	r2, r1, r2
	ldrb	r2, [lr, r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L387
	add	r1, r1, ip, lsl #8
	ldrb	r2, [lr, r1]	@ zero_extendqisi2
.L389:
	cmp	r2, #0
	bne	.L390
	b	.L387
.L380:
	rsb	r3, r3, #0
	str	r3, [r4, #8]
	b	.L384
.L413:
	ldr	r6, .L416+28
	add	r7, r5, r2, lsl #8
	ldrb	r7, [r6, r7]	@ zero_extendqisi2
	cmp	r7, #0
	lsl	r7, r2, #8
	beq	.L383
	add	r8, r5, ip, lsl #8
	ldrb	r8, [r6, r8]	@ zero_extendqisi2
	cmp	r8, #0
	bne	.L385
	b	.L383
.L414:
	ldr	r6, .L416+28
	lsl	r7, r2, #8
.L385:
	add	r7, r1, r7
	ldrb	r2, [r6, r7]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L387
	add	r1, r1, ip, lsl #8
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	b	.L389
.L417:
	.align	2
.L416:
	.word	enemy4
	.word	state
	.word	shadowOAM
	.word	bubble
	.word	.LANCHOR0
	.word	player
	.word	Level1CollisionBitmapBitmap
	.word	Level2CollisionBitmapBitmap
	.size	updateEnemy4, .-updateEnemy4
	.align	2
	.global	updateEnemy5
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy5, %function
updateEnemy5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L458
	ldr	r0, [r4, #32]
	cmp	r0, #0
	beq	.L418
	ldr	r2, .L458+4
	ldr	r5, [r4]
	ldr	lr, [r2]
	ldr	r1, [r4, #16]
	ldr	ip, [r4, #4]
	ldr	r2, [r4, #20]
	add	r1, r5, r1
	add	r2, ip, r2
	cmp	lr, #2
	ldr	r3, [r4, #8]
	sub	r1, r1, #1
	sub	r2, r2, #1
	beq	.L454
	cmp	lr, #3
	beq	.L455
.L425:
	rsb	r3, r3, #0
	cmp	lr, #3
	str	r3, [r4, #8]
	beq	.L456
.L429:
	rsb	r3, r3, #0
	str	r3, [r4, #8]
.L432:
	mov	lr, #256
	add	r3, r5, r3
	ldrb	r1, [r4, #44]	@ zero_extendqisi2
	ldr	r5, .L458+8
	lsl	r2, r3, #23
	ldr	r6, .L458+12
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	str	r3, [r4]
	add	r3, r5, r1, lsl #3
	strh	r2, [r3, #2]	@ movhi
	ldr	r2, [r6, #32]
	and	ip, ip, #255
	lsl	r1, r1, #3
	tst	r0, r2
	strh	ip, [r5, r1]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	beq	.L433
	ldr	r0, .L458
	bl	bubbleCollision.part.0
	cmp	r0, #0
	bne	.L457
.L433:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L418
	ldr	r0, .L458
	bl	playerCollision.part.0
	cmp	r0, #0
	beq	.L418
	mov	ip, #16
	mov	r0, #112
	ldr	r1, .L458+16
	ldr	r3, [r1, #12]
	ldr	r2, .L458+20
	sub	r3, r3, #1
	str	r3, [r1, #12]
	str	ip, [r2]
	str	r0, [r2, #4]
.L418:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L457:
	mov	r2, #0
	mov	r0, #512
	ldr	r1, .L458+16
	ldr	r3, [r1, #4]
	sub	r3, r3, #1
	str	r3, [r1, #4]
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	lsl	r3, r3, #3
	strh	r0, [r5, r3]	@ movhi
	str	r2, [r6, #32]
	str	r2, [r4, #32]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L454:
	ldr	lr, .L458+24
	add	r6, r5, r2, lsl #8
	ldrb	r6, [lr, r6]	@ zero_extendqisi2
	cmp	r6, #0
	lsl	r2, r2, #8
	beq	.L422
	add	r6, r5, ip, lsl #8
	ldrb	r6, [lr, r6]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L422
.L426:
	add	r2, r1, r2
	ldrb	r2, [lr, r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L429
	add	r1, r1, ip, lsl #8
	ldrb	r2, [lr, r1]	@ zero_extendqisi2
.L431:
	cmp	r2, #0
	bne	.L432
	b	.L429
.L422:
	rsb	r3, r3, #0
	str	r3, [r4, #8]
	b	.L426
.L455:
	ldr	r6, .L458+28
	add	r7, r5, r2, lsl #8
	ldrb	r7, [r6, r7]	@ zero_extendqisi2
	cmp	r7, #0
	lsl	r7, r2, #8
	beq	.L425
	add	r8, r5, ip, lsl #8
	ldrb	r8, [r6, r8]	@ zero_extendqisi2
	cmp	r8, #0
	bne	.L427
	b	.L425
.L456:
	ldr	r6, .L458+28
	lsl	r7, r2, #8
.L427:
	add	r7, r1, r7
	ldrb	r2, [r6, r7]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L429
	add	r1, r1, ip, lsl #8
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	b	.L431
.L459:
	.align	2
.L458:
	.word	enemy5
	.word	state
	.word	shadowOAM
	.word	bubble
	.word	.LANCHOR0
	.word	player
	.word	Level1CollisionBitmapBitmap
	.word	Level2CollisionBitmapBitmap
	.size	updateEnemy5, .-updateEnemy5
	.align	2
	.global	updateEnemy6
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy6, %function
updateEnemy6:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L500
	ldr	r0, [r4, #32]
	cmp	r0, #0
	beq	.L460
	ldr	r2, .L500+4
	ldr	r5, [r4]
	ldr	lr, [r2]
	ldr	r1, [r4, #16]
	ldr	ip, [r4, #4]
	ldr	r2, [r4, #20]
	add	r1, r5, r1
	add	r2, ip, r2
	cmp	lr, #2
	ldr	r3, [r4, #8]
	sub	r1, r1, #1
	sub	r2, r2, #1
	beq	.L496
	cmp	lr, #3
	beq	.L497
.L467:
	rsb	r3, r3, #0
	cmp	lr, #3
	str	r3, [r4, #8]
	beq	.L498
.L471:
	rsb	r3, r3, #0
	str	r3, [r4, #8]
.L474:
	mov	lr, #256
	add	r3, r5, r3
	ldrb	r1, [r4, #44]	@ zero_extendqisi2
	ldr	r5, .L500+8
	lsl	r2, r3, #23
	ldr	r6, .L500+12
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	str	r3, [r4]
	add	r3, r5, r1, lsl #3
	strh	r2, [r3, #2]	@ movhi
	ldr	r2, [r6, #32]
	and	ip, ip, #255
	lsl	r1, r1, #3
	tst	r0, r2
	strh	ip, [r5, r1]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	beq	.L475
	ldr	r0, .L500
	bl	bubbleCollision.part.0
	cmp	r0, #0
	bne	.L499
.L475:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L460
	ldr	r0, .L500
	bl	playerCollision.part.0
	cmp	r0, #0
	beq	.L460
	mov	ip, #16
	mov	r0, #112
	ldr	r1, .L500+16
	ldr	r3, [r1, #12]
	ldr	r2, .L500+20
	sub	r3, r3, #1
	str	r3, [r1, #12]
	str	ip, [r2]
	str	r0, [r2, #4]
.L460:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L499:
	mov	r2, #0
	mov	r0, #512
	ldr	r1, .L500+16
	ldr	r3, [r1, #4]
	sub	r3, r3, #1
	str	r3, [r1, #4]
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	lsl	r3, r3, #3
	strh	r0, [r5, r3]	@ movhi
	str	r2, [r6, #32]
	str	r2, [r4, #32]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L496:
	ldr	lr, .L500+24
	add	r6, r5, r2, lsl #8
	ldrb	r6, [lr, r6]	@ zero_extendqisi2
	cmp	r6, #0
	lsl	r2, r2, #8
	beq	.L464
	add	r6, r5, ip, lsl #8
	ldrb	r6, [lr, r6]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L464
.L468:
	add	r2, r1, r2
	ldrb	r2, [lr, r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L471
	add	r1, r1, ip, lsl #8
	ldrb	r2, [lr, r1]	@ zero_extendqisi2
.L473:
	cmp	r2, #0
	bne	.L474
	b	.L471
.L464:
	rsb	r3, r3, #0
	str	r3, [r4, #8]
	b	.L468
.L497:
	ldr	r6, .L500+28
	add	r7, r5, r2, lsl #8
	ldrb	r7, [r6, r7]	@ zero_extendqisi2
	cmp	r7, #0
	lsl	r7, r2, #8
	beq	.L467
	add	r8, r5, ip, lsl #8
	ldrb	r8, [r6, r8]	@ zero_extendqisi2
	cmp	r8, #0
	bne	.L469
	b	.L467
.L498:
	ldr	r6, .L500+28
	lsl	r7, r2, #8
.L469:
	add	r7, r1, r7
	ldrb	r2, [r6, r7]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L471
	add	r1, r1, ip, lsl #8
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	b	.L473
.L501:
	.align	2
.L500:
	.word	enemy6
	.word	state
	.word	shadowOAM
	.word	bubble
	.word	.LANCHOR0
	.word	player
	.word	Level1CollisionBitmapBitmap
	.word	Level2CollisionBitmapBitmap
	.size	updateEnemy6, .-updateEnemy6
	.align	2
	.global	updateBubble
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBubble, %function
updateBubble:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L515
	ldrh	r3, [r3]
	tst	r3, #1
	push	{r4, r5, lr}
	beq	.L503
	ldr	r3, .L515+4
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L503
	mov	r2, #1
	mov	lr, #16
	mov	r4, #4
	ldr	r3, .L515+8
	ldr	ip, [r3, #28]
	ldm	r3, {r1, r5}
	ldr	r0, .L515+12
	ldr	r3, .L515+16
	cmp	ip, #0
	str	r1, [r0, #4]
	str	r5, [r3, #4]
	mov	r0, r1
	str	ip, [r3, #28]
	strb	r4, [r3, #44]
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #32]
	beq	.L513
.L506:
	add	r0, r0, #46
	cmp	r0, #240
	movge	r0, #240
	add	r2, r1, r2
	cmp	r2, r0
	movgt	r1, #0
	str	r2, [r3]
	strgt	r1, [r3, #32]
	b	.L507
.L503:
	ldr	r3, .L515+16
	ldr	r2, [r3, #32]
	cmp	r2, #0
	bne	.L514
	mov	r1, #512
	ldrb	r3, [r3, #44]	@ zero_extendqisi2
	ldr	r2, .L515+20
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L514:
	ldr	ip, [r3, #28]
	ldr	r2, .L515+12
	cmp	ip, #0
	ldr	r0, [r2, #4]
	ldr	r1, [r3]
	ldr	r2, [r3, #8]
	bne	.L506
.L513:
	mvn	lr, #15
	sub	r0, r0, #30
	cmp	r0, lr
	movlt	r0, lr
	sub	r2, r1, r2
	cmp	r2, r0
	str	r2, [r3]
	strlt	ip, [r3, #32]
.L507:
	mov	ip, #780
	ldrb	r1, [r3, #44]	@ zero_extendqisi2
	ldr	r0, .L515+20
	lsl	r2, r2, #23
	ldrb	lr, [r3, #4]	@ zero_extendqisi2
	lsr	r2, r2, #23
	add	r3, r0, r1, lsl #3
	orr	r2, r2, #16384
	lsl	r1, r1, #3
	strh	lr, [r0, r1]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L516:
	.align	2
.L515:
	.word	oldButtons
	.word	buttons
	.word	player
	.word	.LANCHOR1
	.word	bubble
	.word	shadowOAM
	.size	updateBubble, .-updateBubble
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
	mov	r3, #512
	ldr	r4, .L519
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L519+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L520:
	.align	2
.L519:
	.word	DMANow
	.word	shadowOAM
	.size	draw, .-draw
	.align	2
	.global	bubbleCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	bubbleCollision, %function
bubbleCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L524
	ldr	r2, [r0, #32]
	ldr	r3, [r3, #32]
	ands	r3, r3, r2
	bne	.L523
	mov	r0, r3
	bx	lr
.L523:
	b	bubbleCollision.part.0
.L525:
	.align	2
.L524:
	.word	bubble
	.size	bubbleCollision, .-bubbleCollision
	.align	2
	.global	playerCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerCollision, %function
playerCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bne	.L528
	mov	r0, r3
	bx	lr
.L528:
	b	playerCollision.part.0
	.size	playerCollision, .-playerCollision
	.global	hOff
	.global	vOff
	.comm	bubble,48,4
	.comm	enemy6,48,4
	.comm	enemy5,48,4
	.comm	enemy4,48,4
	.comm	enemy3,48,4
	.comm	enemy2,48,4
	.comm	enemy1,48,4
	.comm	player,48,4
	.comm	shadowOAM,1024,4
	.global	lives
	.global	enemies
	.global	tempX
	.global	currentState
	.global	game2Bool
	.global	game1Bool
	.comm	state,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	STATE,1,1
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	game1Bool, %object
	.size	game1Bool, 4
game1Bool:
	.word	1
	.type	enemies, %object
	.size	enemies, 4
enemies:
	.word	6
	.type	game2Bool, %object
	.size	game2Bool, 4
game2Bool:
	.word	1
	.type	lives, %object
	.size	lives, 4
lives:
	.word	3
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.word	2
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.word	2
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	currentState, %object
	.size	currentState, 4
currentState:
	.space	4
	.type	tempX, %object
	.size	tempX, 4
tempX:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
