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
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	lr, .L6
	sub	sp, sp, #24
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #4
	stmia	ip!, {r0, r1, r2, r3}
	ldr	lr, [lr]
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L6+4
	ldr	r4, .L6+8
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	ldr	r0, .L6+12
	add	r2, sp, #24
	add	r3, sp, #2
	sub	r0, r0, r2
	add	ip, sp, #22
.L2:
	add	r2, r0, r3
	ldrh	r1, [r3, #2]!
	cmp	r3, ip
	strh	r1, [r2]	@ movhi
	bne	.L2
	ldr	r3, .L6+16
	mov	lr, pc
	bx	r3
	add	sp, sp, #24
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.word	roadPal
	.word	DMANow
	.word	83886594
	.word	initSound
	.size	initGame, .-initGame
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"PAUSED\000"
	.align	2
.LC2:
	.ascii	"Press Select to Continue\000"
	.text
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #252
	ldr	r3, .L10
	mov	lr, pc
	bx	r3
	ldr	r4, .L10+4
	mov	r3, #248
	mov	r1, #70
	mov	r0, #100
	ldr	r2, .L10+8
	mov	lr, pc
	bx	r4
	mov	r3, #248
	mov	r1, #85
	mov	r0, #50
	ldr	r2, .L10+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	fillScreen4
	.word	drawString4
	.word	.LC1
	.word	.LC2
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"New High Score!\000"
	.align	2
.LC4:
	.ascii	"Press Start to Continue\000"
	.text
	.align	2
	.global	highScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	highScore, %function
highScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	sub	sp, sp, #12
	mov	r0, #250
	ldr	r3, .L21
	mov	lr, pc
	bx	r3
	ldr	r5, .L21+4
	mov	r3, #246
	mov	r1, #70
	mov	r0, #80
	ldr	r2, .L21+8
	mov	lr, pc
	bx	r5
	mov	r3, #246
	mov	r1, #85
	mov	r0, #50
	ldr	r2, .L21+12
	mov	lr, pc
	bx	r5
	cmp	r4, #29
	ble	.L18
	sub	r3, r4, #31
	cmp	r3, #28
	bls	.L19
	sub	r3, r4, #61
	cmp	r3, #28
	bls	.L20
.L16:
	sub	r4, r4, #91
	cmp	r4, #28
	bhi	.L12
	mov	r3, #64
	ldr	r1, .L21+16
	mov	r2, r3
	mvn	r0, #2
	str	r1, [sp]
	ldr	r4, .L21+20
	mov	r1, #14
	mov	lr, pc
	bx	r4
	mov	r0, #17
	ldr	r3, .L21+24
	mov	lr, pc
	bx	r3
.L12:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L20:
	mov	r3, #32
	ldr	r1, .L21+28
	mov	r2, r3
	str	r1, [sp]
	mov	r0, #10
	mov	r1, #30
	ldr	r4, .L21+20
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L19:
	mov	r3, #32
	ldr	r1, .L21+32
	mov	r2, r3
	str	r1, [sp]
	mov	r0, #10
	mov	r1, #60
	ldr	r4, .L21+20
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L18:
	mov	r3, #32
	ldr	r1, .L21+32
	mov	r2, r3
	str	r1, [sp]
	mov	r0, #10
	mov	r1, #100
	ldr	r5, .L21+20
	mov	lr, pc
	bx	r5
	sub	r3, r4, #61
	cmp	r3, #28
	bhi	.L16
	b	.L20
.L22:
	.align	2
.L21:
	.word	fillScreen4
	.word	drawString4
	.word	.LC3
	.word	.LC4
	.word	explosion2Bitmap
	.word	drawImage4
	.word	playAnalogSound
	.word	explosionBitmap
	.word	rocketBitmap
	.size	highScore, .-highScore
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"Game Over\000"
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #249
	ldr	r3, .L25
	mov	lr, pc
	bx	r3
	ldr	r4, .L25+4
	mov	r3, #246
	mov	r1, #70
	mov	r0, #85
	ldr	r2, .L25+8
	mov	lr, pc
	bx	r4
	mov	r3, #246
	mov	r1, #85
	mov	r0, #50
	ldr	r2, .L25+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	fillScreen4
	.word	drawString4
	.word	.LC5
	.word	.LC4
	.size	lose, .-lose
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"%d\000"
	.align	2
.LC7:
	.ascii	"High Score: \000"
	.align	2
.LC8:
	.ascii	"Press Select to Return to Start\000"
	.text
	.align	2
	.global	scoreboard
	.syntax unified
	.arm
	.fpu softvfp
	.type	scoreboard, %function
scoreboard:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #254
	ldr	r3, .L29
	mov	lr, pc
	bx	r3
	ldr	r5, .L29+4
	ldr	r3, .L29+8
	mov	r0, r5
	ldr	r2, [r3]
	ldr	r1, .L29+12
	ldr	r3, .L29+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L29+20
	mov	r2, r5
	mov	r3, #246
	mov	r1, #70
	mov	r0, #140
	mov	lr, pc
	bx	r4
	mov	r1, #70
	mov	r3, #246
	mov	r0, r1
	ldr	r2, .L29+24
	mov	lr, pc
	bx	r4
	mov	r3, #246
	mov	r1, #85
	mov	r0, #35
	ldr	r2, .L29+28
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	fillScreen4
	.word	printHighScore
	.word	.LANCHOR1
	.word	.LC6
	.word	sprintf
	.word	drawString4
	.word	.LC7
	.word	.LC8
	.size	scoreboard, .-scoreboard
	.align	2
	.global	initCar
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCar, %function
initCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #20
	mov	r1, #2
	mov	r0, #80
	ldr	r3, .L32
	str	r2, [r3]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r0, [r3, #4]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	bx	lr
.L33:
	.align	2
.L32:
	.word	car
	.size	initCar, .-initCar
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
	push	{r4, r5, lr}
	ldr	r3, .L38
	ldr	r3, [r3, #4]
	ldr	r4, .L38+4
	cmp	r3, #99
	sub	sp, sp, #12
	ldm	r4, {r0, r1, r2, r3}
	bgt	.L35
	mov	ip, #2
	ldr	lr, .L38+8
	ldr	r5, .L38+12
	str	lr, [sp]
	str	ip, [r4, #16]
	str	ip, [r4, #20]
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L35:
	ldr	ip, .L38+16
	ldr	r5, .L38+12
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #3
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	.LANCHOR1
	.word	car
	.word	carBitmap
	.word	drawImage4
	.word	car2Bitmap
	.size	drawCar, .-drawCar
	.align	2
	.global	updateCar
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCar, %function
updateCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L46
	ldrh	r3, [r3]
	tst	r3, #32
	bne	.L41
	ldr	r1, .L46+4
	ldr	r2, [r1]
	cmp	r2, #2
	ble	.L41
	ldr	r0, [r1, #16]
	sub	r2, r2, r0
	str	r2, [r1]
.L42:
	tst	r3, #64
	bne	.L43
.L45:
	ldr	r1, .L46+4
	ldr	r2, [r1, #4]
	cmp	r2, #0
	ble	.L43
	ldr	r3, [r1, #20]
	sub	r2, r2, r3
	str	r2, [r1, #4]
.L44:
	b	drawCar
.L41:
	tst	r3, #16
	bne	.L42
	ldr	r1, .L46+4
	ldr	r0, [r1]
	ldr	r2, [r1, #8]
	add	r2, r0, r2
	cmp	r2, #99
	ldrle	r2, [r1, #16]
	addle	r0, r2, r0
	strle	r0, [r1]
	tst	r3, #64
	beq	.L45
.L43:
	tst	r3, #128
	bne	.L44
	ldr	r3, .L46+4
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #12]
	add	r2, r1, r2
	cmp	r2, #159
	ldrle	r2, [r3, #20]
	addle	r1, r2, r1
	strle	r1, [r3, #4]
	b	drawCar
.L47:
	.align	2
.L46:
	.word	buttons
	.word	car
	.size	updateCar, .-updateCar
	.align	2
	.global	carCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	carCollision, %function
carCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	add	r1, r0, #8
	ldm	r1, {r1, lr}
	ldr	r2, [r0, #4]
	ldr	r3, [r0]
	ldr	ip, .L50
	sub	sp, sp, #16
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	str	lr, [sp, #12]
	ldm	ip, {r0, r1, r2, r3}
	ldr	r4, .L50+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	car
	.word	collision
	.size	carCollision, .-carCollision
	.align	2
	.global	initGamePal
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGamePal, %function
initGamePal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L54
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L54+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	DMANow
	.word	roadPal
	.size	initGamePal, .-initGamePal
	.align	2
	.global	initCones
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCones, %function
initCones:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #230
	mov	r8, #0
	ldr	r4, .L60
	ldr	r7, .L60+4
	ldr	r6, .L60+8
	add	r5, r4, #168
.L57:
	str	r9, [r4]
	mov	lr, pc
	bx	r7
	mov	r1, #1
	mov	r2, #12
	smull	r3, ip, r6, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl r1
	str	r8, [r4, #20]
	str	r0, [r4, #4]
	str	r2, [r4, #12]
	str	r2, [r4, #8]
	str	r1, [r4, #16]
	add	r4, r4, #24
	cmp	r4, r5
	bne	.L57
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	cones
	.word	rand
	.word	2114445439
	.size	initCones, .-initCones
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"Press Start to Begin!\000"
	.align	2
.LC10:
	.ascii	"Press Select to View High Score!\000"
	.text
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	initCones
	mov	r2, #20
	mov	lr, #2
	mov	ip, #0
	mov	r4, #80
	ldr	r3, .L64
	ldr	r1, .L64+4
	str	r2, [r3]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	mov	r0, #255
	ldr	r2, .L64+8
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r1, #4]
	str	ip, [r1, #8]
	str	r4, [r3, #4]
	mov	lr, pc
	bx	r2
	ldr	r4, .L64+12
	mov	r3, #246
	mov	r1, #70
	mov	r0, #60
	ldr	r2, .L64+16
	mov	lr, pc
	bx	r4
	mov	r3, #246
	mov	r1, #85
	mov	r0, #35
	ldr	r2, .L64+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	car
	.word	.LANCHOR1
	.word	fillScreen4
	.word	drawString4
	.word	.LC9
	.word	.LC10
	.size	start, .-start
	.align	2
	.global	updateCones
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCones, %function
updateCones:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L79
	mov	fp, #0
	mov	r10, #230
	ldr	r7, .L79+4
	ldr	r6, .L79+8
	ldr	r9, .L79+12
	ldr	r8, .L79+16
	sub	sp, sp, #12
	add	r5, r4, #168
	b	.L72
.L77:
	ldr	r3, [r4]
	cmp	r3, #0
	blt	.L75
.L71:
	add	r4, r4, #24
	cmp	r4, r5
	beq	.L76
.L72:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L77
	mov	r0, r4
	bl	carCollision
	cmp	r0, #0
	bne	.L78
	ldm	r4, {r0, r1, r2, r3}
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	ldr	r3, [r4]
	ldr	r2, [r4, #16]
	sub	r3, r3, r2
	cmp	r3, #0
	str	r3, [r4]
	bge	.L71
.L75:
	str	fp, [r4, #20]
	mov	lr, pc
	bx	r9
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl #1
	str	r10, [r4]
	str	r0, [r4, #4]
	add	r4, r4, #24
	cmp	r4, r5
	bne	.L72
.L76:
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L78:
	mov	r0, #2
	ldr	r3, .L79+20
	mov	lr, pc
	bx	r3
	mov	r0, #1
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	cones
	.word	coneBitmap
	.word	drawImage4
	.word	rand
	.word	2114445439
	.word	playAnalogSound
	.size	updateCones, .-updateCones
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"Score: \000"
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
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r3, .L98
	ldr	r0, .L98+4
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	bl	updateCar
	bl	updateCones
	ldr	r3, .L98+8
	smull	r2, r3, r4, r3
	asr	r2, r4, #31
	add	r3, r3, r4
	rsb	r2, r2, r3, asr #6
	rsb	r2, r2, r2, lsl #4
	subs	r2, r4, r2, lsl #3
	mov	r5, r0
	ldr	r6, .L98+12
	bne	.L82
	ldm	r6, {r1, r3}
	add	r3, r3, #10
	cmp	r3, r1
	movgt	r1, #1
	mov	ip, #1
	str	r3, [r6, #4]
	strgt	r3, [r6]
	ldr	r3, .L98+16
	strgt	r1, [r6, #8]
	add	r0, r3, #168
.L85:
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bne	.L84
	cmp	r2, #1
	str	ip, [r3, #20]
	beq	.L82
	mov	r2, #1
.L84:
	add	r3, r3, #24
	cmp	r3, r0
	bne	.L85
.L82:
	add	r0, r4, r4, lsl #1
	add	r0, r0, r0, lsl #4
	add	r0, r0, r0, lsl #8
	ldr	r3, .L98+20
	add	r0, r0, r0, lsl #16
	ldr	r2, .L98+24
	add	r4, r4, r0, lsl #2
	add	r3, r4, r3
	cmp	r2, r3, ror #7
	bcc	.L86
	ldr	r3, .L98+16
	add	r1, r3, #168
.L87:
	ldr	r2, [r3, #16]
	add	r2, r2, #1
	str	r2, [r3, #16]
	add	r3, r3, #24
	cmp	r1, r3
	bne	.L87
.L86:
	mov	r2, #246
	mov	r3, #10
	str	r2, [sp]
	mov	r1, #150
	mov	r2, #60
	mov	r0, #180
	ldr	r4, .L98+28
	mov	lr, pc
	bx	r4
	ldr	r4, .L98+32
	mov	r3, #247
	mov	r1, #151
	mov	r0, #180
	ldr	r2, .L98+36
	mov	lr, pc
	bx	r4
	ldr	r2, [r6, #4]
	ldr	r1, .L98+40
	ldr	r3, .L98+44
	ldr	r0, .L98+48
	mov	lr, pc
	bx	r3
	mov	r0, #220
	mov	r3, #247
	mov	r1, #151
	ldr	r2, .L98+48
	mov	lr, pc
	bx	r4
	ldr	r3, [r6, #8]
	cmp	r3, #0
	cmpne	r5, #0
	moveq	r0, r5
	movne	r0, #3
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L99:
	.align	2
.L98:
	.word	drawFullscreenImage4
	.word	roadBitmap
	.word	-2004318071
	.word	.LANCHOR1
	.word	cones
	.word	429496704
	.word	6710886
	.word	drawRectangle4
	.word	drawString4
	.word	.LC11
	.word	.LC6
	.word	sprintf
	.word	printScore
	.size	game, .-game
	.align	2
	.global	drawCone
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCone, %function
drawCone:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	ip, .L102
	sub	sp, sp, #8
	ldm	r0, {r0, r1, r2, r3}
	ldr	r4, .L102+4
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L103:
	.align	2
.L102:
	.word	coneBitmap
	.word	drawImage4
	.size	drawCone, .-drawCone
	.comm	printHighScore,41,4
	.comm	printScore,41,4
	.global	highscoreUpdate
	.global	highscore
	.global	score
	.comm	NOTES,2,2
	.comm	cones,168,4
	.comm	car,24,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.short	0
	.short	32767
	.short	15855
	.short	31
	.short	992
	.short	31744
	.short	32736
	.short	31775
	.short	1023
	.short	671
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	highscore, %object
	.size	highscore, 4
highscore:
	.space	4
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.type	highscoreUpdate, %object
	.size	highscoreUpdate, 4
highscoreUpdate:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
