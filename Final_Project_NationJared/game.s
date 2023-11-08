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
	.global	start
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L4
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	luffyStartScreenPal
	.word	DMANow
	.word	luffyStartScreenBitmap
	.word	drawFullscreenImage4
	.word	flipPage
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L8+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L8+8
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	wanoInstructionsPal
	.word	DMANow
	.word	wanoInstructionsBitmap
	.word	drawFullscreenImage4
	.word	flipPage
	.size	instructions, .-instructions
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
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	flipPage
	.size	pause, .-pause
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L16
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L16+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L16+8
	ldr	r3, .L16+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	LuffyWinScreenPal
	.word	DMANow
	.word	LuffyWinScreenBitmap
	.word	drawFullscreenImage4
	.word	flipPage
	.size	win, .-win
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
	ldr	r3, .L20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	flipPage
	.size	lose, .-lose
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
	ldr	r3, .L23
	strh	r2, [r3]	@ movhi
	bx	lr
.L24:
	.align	2
.L23:
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L26
	strh	r2, [r3]	@ movhi
	bx	lr
.L27:
	.align	2
.L26:
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #3
	mov	r3, #67108864
	ldr	r1, .L29
	ldr	r2, .L29+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L30:
	.align	2
.L29:
	.word	state
	.word	1044
	.size	goToPause, .-goToPause
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
	mov	r0, #4
	mov	r3, #67108864
	ldr	r1, .L32
	ldr	r2, .L32+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L33:
	.align	2
.L32:
	.word	state
	.word	1044
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #5
	mov	r3, #67108864
	ldr	r1, .L35
	ldr	r2, .L35+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L36:
	.align	2
.L35:
	.word	state
	.word	1044
	.size	goToLose, .-goToLose
	.align	2
	.global	initLuffy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLuffy, %function
initLuffy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r1, #2
	mov	r8, #200
	mov	r7, #110
	mov	r6, #44
	mov	r5, #32
	mov	r4, #10
	mov	lr, #4
	mov	ip, #22
	mov	r0, #20
	ldr	r3, .L39
	strb	r2, [r3, #60]
	str	r8, [r3]
	str	r7, [r3, #4]
	str	r6, [r3, #12]
	str	r5, [r3, #8]
	str	r4, [r3, #36]
	str	lr, [r3, #28]
	str	ip, [r3, #48]
	str	r0, [r3, #56]
	str	r1, [r3, #20]
	str	r1, [r3, #24]
	str	r2, [r3, #40]
	str	r2, [r3, #32]
	str	r2, [r3, #16]
	str	r2, [r3, #44]
	str	r2, [r3, #52]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	luffy
	.size	initLuffy, .-initLuffy
	.align	2
	.global	goToKaido1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToKaido1, %function
goToKaido1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	ip, #2
	mov	r2, #4352
	mov	r0, #7168
	push	{r4, lr}
	ldr	r3, .L43
	ldr	r4, .L43+4
	strh	ip, [r3]	@ movhi
	strh	r2, [r1]	@ movhi
	mov	r3, #512
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L43+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	initLuffy
.L44:
	.align	2
.L43:
	.word	state
	.word	DMANow
	.word	shadowOAM
	.size	goToKaido1, .-goToKaido1
	.align	2
	.global	luffyPunching
	.syntax unified
	.arm
	.fpu softvfp
	.type	luffyPunching, %function
luffyPunching:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L64
	push	{r4, r5, r6, r7, r8, lr}
	ldr	ip, [r0]
	ldr	r5, .L64+4
	and	r6, ip, r5
	mvn	r1, r6, lsl #18
	mvn	r1, r1, lsr #18
	mov	r8, #227
	ldrb	r2, [r0, #60]	@ zero_extendqisi2
	ldr	r3, .L64+8
	ldr	r7, [r0, #40]
	ldrh	lr, [r0, #4]
	add	r4, r3, r2, lsl #3
	strh	r1, [r4, #2]	@ movhi
	cmp	r7, #1
	and	r1, lr, #255
	lsl	r7, r2, #3
	strh	r1, [r3, r7]	@ movhi
	strh	r8, [r4, #4]	@ movhi
	ldr	r1, [r0, #48]
	beq	.L63
	cmp	r1, #19
	bgt	.L62
	add	r4, r2, #1
	lsl	ip, ip, #16
	add	lr, lr, #16
	lsl	r6, r4, #3
	lsr	ip, ip, #16
	and	lr, lr, #255
	strh	lr, [r3, r6]	@ movhi
	sub	r7, ip, #8
	ldr	r6, .L64+12
	add	r4, r3, r4, lsl #3
	and	r7, r7, r5
	cmp	r1, #17
	strh	r7, [r4, #2]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	bgt	.L62
	add	r4, r2, #2
	sub	r7, ip, #12
	lsl	r8, r4, #3
	and	r7, r7, r5
	add	r4, r3, r4, lsl #3
	cmp	r1, #15
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	strh	r7, [r4, #2]	@ movhi
	bgt	.L62
	add	r4, r2, #3
	sub	r7, ip, #16
	lsl	r8, r4, #3
	and	r7, r7, r5
	add	r4, r3, r4, lsl #3
	cmp	r1, #13
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	strh	r7, [r4, #2]	@ movhi
	bgt	.L62
	add	r4, r2, #4
	sub	r7, ip, #20
	lsl	r8, r4, #3
	and	r7, r7, r5
	add	r4, r3, r4, lsl #3
	cmp	r1, #11
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	strh	r7, [r4, #2]	@ movhi
	bgt	.L62
	add	r4, r2, #5
	sub	r7, ip, #24
	lsl	r8, r4, #3
	and	r7, r7, r5
	add	r4, r3, r4, lsl #3
	cmp	r1, #9
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	strh	r7, [r4, #2]	@ movhi
	bgt	.L62
	mov	r6, #288
	sub	ip, ip, #36
	add	r2, r2, #6
	and	ip, ip, r5
	add	r4, r3, r2, lsl #3
	orr	ip, ip, #16384
	lsl	r2, r2, #3
	cmp	r1, #0
	strh	ip, [r4, #2]	@ movhi
	strh	lr, [r3, r2]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	bge	.L62
.L54:
	mov	r3, #0
	mov	r1, #21
	str	r3, [r0, #44]
	str	r1, [r0, #48]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L63:
	orr	r6, r6, #53248
	cmp	r1, #19
	strh	r6, [r4, #2]	@ movhi
	ble	.L47
.L62:
	sub	r1, r1, #1
	str	r1, [r0, #48]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L47:
	ldr	r4, [r0, #8]
	add	ip, ip, r4
	lsl	r4, ip, #16
	add	lr, lr, #16
	add	ip, r2, #1
	lsl	r6, ip, #3
	lsr	r4, r4, #16
	and	lr, lr, #255
	strh	lr, [r3, r6]	@ movhi
	add	r7, r4, #32
	ldr	r6, .L64+12
	add	ip, r3, ip, lsl #3
	and	r7, r7, r5
	cmp	r1, #17
	strh	r7, [ip, #2]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	bgt	.L62
	add	ip, r2, #2
	add	r7, r4, #36
	lsl	r8, ip, #3
	and	r7, r7, r5
	add	ip, r3, ip, lsl #3
	cmp	r1, #15
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	bgt	.L62
	add	ip, r2, #3
	add	r7, r4, #40
	lsl	r8, ip, #3
	and	r7, r7, r5
	add	ip, r3, ip, lsl #3
	cmp	r1, #13
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	bgt	.L62
	add	ip, r2, #4
	add	r7, r4, #44
	lsl	r8, ip, #3
	and	r7, r7, r5
	add	ip, r3, ip, lsl #3
	cmp	r1, #11
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	bgt	.L62
	add	ip, r2, #5
	add	r7, r4, #48
	lsl	r8, ip, #3
	and	r7, r7, r5
	add	ip, r3, ip, lsl #3
	cmp	r1, #9
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	bgt	.L62
	mov	r6, #288
	add	r4, r4, #52
	add	r2, r2, #6
	and	r5, r5, r4
	add	ip, r3, r2, lsl #3
	orr	r5, r5, #20480
	lsl	r2, r2, #3
	cmp	r1, #0
	strh	r5, [ip, #2]	@ movhi
	strh	lr, [r3, r2]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	blt	.L54
	b	.L62
.L65:
	.align	2
.L64:
	.word	luffy
	.word	511
	.word	shadowOAM
	.word	290
	.size	luffyPunching, .-luffyPunching
	.global	__aeabi_idivmod
	.align	2
	.global	luffyUpdate
	.syntax unified
	.arm
	.fpu softvfp
	.type	luffyUpdate, %function
luffyUpdate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, .L107
	ldrh	r5, [r7]
	ldr	r4, .L107+4
	tst	r5, #32
	str	r3, [r4, #16]
	ldr	r3, [r4, #44]
	bne	.L67
	cmp	r3, #0
	bne	.L68
	ldr	r2, [r4]
	cmp	r2, #0
	str	r3, [r4, #40]
	ldrgt	r3, [r4, #20]
	subgt	r2, r2, r3
	strgt	r2, [r4]
.L70:
	mov	r3, #1
	str	r3, [r4, #16]
.L71:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L76
	ldr	r3, [r4]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r1, r3, lsl #18
	mvn	r2, r2, lsl #17
	mvn	r1, r1, lsr #18
	mvn	r2, r2, lsr #17
	ldr	lr, [r4, #40]
	ldrb	r0, [r4, #60]	@ zero_extendqisi2
	ldr	r8, .L107+8
	cmp	lr, #1
	orreq	r3, r3, #53248
	add	ip, r8, r0, lsl #3
	lsl	r6, r0, #3
	strh	r1, [ip, #2]	@ movhi
	strh	r2, [r8, r6]	@ movhi
	strheq	r3, [ip, #2]	@ movhi
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #36]
	orrs	r1, r3, r2
	beq	.L103
	cmp	r3, #0
	bne	.L77
	cmp	r2, #1
	beq	.L104
.L76:
	ldr	r6, .L107+12
	ldrh	r3, [r6]
	tst	r3, #1
	beq	.L82
.L88:
	tst	r5, #1
	moveq	r3, #1
	streq	r3, [r4, #44]
	bne	.L105
.L80:
	bl	luffyPunching
.L101:
	ldrh	r3, [r6]
.L82:
	tst	r3, #64
	beq	.L83
	ldrh	r3, [r7]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #52]
	bne	.L83
.L84:
	ldr	r3, [r4, #56]
	cmp	r3, #0
	movlt	r2, #0
	movlt	r3, #19
	subge	r3, r3, #1
	strlt	r2, [r4, #52]
	str	r3, [r4, #56]
.L85:
	ldr	r3, [r4, #36]
	sub	r3, r3, #1
	str	r3, [r4, #36]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L67:
	tst	r5, #16
	beq	.L106
	cmp	r3, #0
	beq	.L71
.L68:
	ldr	r6, .L107+12
	ldrh	r3, [r6]
	tst	r3, #1
	beq	.L80
	tst	r5, #1
	moveq	r3, #1
	streq	r3, [r4, #44]
	beq	.L80
	b	.L105
.L106:
	cmp	r3, #0
	bne	.L68
	mov	r1, #1
	ldr	r3, [r4, #8]
	ldr	r2, [r4]
	rsb	r3, r3, #240
	cmp	r2, r3
	str	r1, [r4, #40]
	ldrlt	r3, [r4, #20]
	addlt	r2, r3, r2
	strlt	r2, [r4]
	b	.L70
.L105:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L101
	b	.L80
.L83:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L85
	b	.L84
.L103:
	mov	r2, #10
	ldr	r0, [r4, #32]
	ldr	r3, .L107+16
	str	r2, [r4, #36]
	ldr	r1, [r4, #28]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	add	r3, r8, r6
	ldr	r6, .L107+12
	lsl	r2, r1, #2
	strh	r2, [r3, #4]	@ movhi
	ldrh	r3, [r6]
	tst	r3, #1
	str	r1, [r4, #32]
	beq	.L82
	b	.L88
.L77:
	movlt	r3, #10
	strlt	r3, [r4, #36]
	b	.L76
.L104:
	mov	r0, #10
	ldr	r3, [r4, #32]
	ldr	r2, .L107+20
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	sub	r2, r3, r2
	add	r1, r2, #4
	add	r3, r8, r6
	lsl	r1, r1, #2
	str	r2, [r4, #32]
	strh	r1, [r3, #4]	@ movhi
	str	r0, [r4, #36]
	b	.L76
.L108:
	.align	2
.L107:
	.word	buttons
	.word	luffy
	.word	shadowOAM
	.word	oldButtons
	.word	__aeabi_idivmod
	.word	1431655766
	.size	luffyUpdate, .-luffyUpdate
	.align	2
	.global	kaido1
	.syntax unified
	.arm
	.fpu softvfp
	.type	kaido1, %function
kaido1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L111
	ldr	r4, .L111+4
	mov	lr, pc
	bx	r3
	bl	luffyUpdate
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L111+8
	mov	lr, pc
	bx	r4
	mov	r3, #9600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L111+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L111+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L111+20
	ldr	r1, .L111+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L111+28
	ldr	r1, .L111+32
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L111+36
	ldr	r1, .L111+40
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L112:
	.align	2
.L111:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	Rooftop_Ground_TilesetBitmapTiles
	.word	Rooftop_Ground_TilesetBitmapPal
	.word	100720640
	.word	RooftopGroundBackgroundMap
	.word	83886592
	.word	LuffyandKaidoSpritesPal
	.word	100728832
	.word	LuffyandKaidoSpritesTiles
	.size	kaido1, .-kaido1
	.align	2
	.global	luffyJumping
	.syntax unified
	.arm
	.fpu softvfp
	.type	luffyJumping, %function
luffyJumping:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L116
	ldr	r3, [r2, #56]
	cmp	r3, #0
	movlt	r1, #0
	movlt	r3, #19
	subge	r3, r3, #1
	strlt	r1, [r2, #52]
	str	r3, [r2, #56]
	bx	lr
.L117:
	.align	2
.L116:
	.word	luffy
	.size	luffyJumping, .-luffyJumping
	.align	2
	.global	initKaido
	.syntax unified
	.arm
	.fpu softvfp
	.type	initKaido, %function
initKaido:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #7
	mov	r2, #0
	mov	r1, #1
	mov	ip, #20
	mov	r0, #10
	ldr	r3, .L120
	strb	lr, [r3, #48]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #28]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #16]
	str	r2, [r3, #24]
	str	r2, [r3, #40]
	str	ip, [r3, #44]
	str	r0, [r3, #32]
	str	r1, [r3, #36]
	str	r1, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L121:
	.align	2
.L120:
	.word	kaido
	.size	initKaido, .-initKaido
	.align	2
	.global	kaidoUpdate
	.syntax unified
	.arm
	.fpu softvfp
	.type	kaidoUpdate, %function
kaidoUpdate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	kaidoUpdate, .-kaidoUpdate
	.comm	shadowOAM,1024,4
	.comm	DIRECTION,1,1
	.comm	STATE,1,1
	.comm	kaido,52,4
	.comm	luffy,64,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
