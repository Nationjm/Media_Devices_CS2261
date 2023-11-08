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
	.global	goToKaido1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToKaido1, %function
goToKaido1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r0, #67108864
	mov	r4, #2
	mov	ip, #7168
	mov	r1, #4352
	ldr	r2, .L30
	mov	r3, #512
	strh	r4, [r2]	@ movhi
	ldr	r5, .L30+4
	strh	r1, [r0]	@ movhi
	mov	r2, #117440512
	strh	ip, [r0, #8]	@ movhi
	ldr	r1, .L30+8
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #0
	mov	r7, #200
	mov	r6, #110
	mov	r5, #44
	mov	lr, #32
	mov	ip, #10
	mov	r0, #4
	mov	r1, #40
	ldr	r3, .L30+12
	strb	r2, [r3, #52]
	str	r4, [r3, #20]
	str	r4, [r3, #24]
	str	r7, [r3]
	str	r6, [r3, #4]
	str	r5, [r3, #12]
	str	lr, [r3, #8]
	str	ip, [r3, #36]
	str	r0, [r3, #28]
	str	r1, [r3, #48]
	str	r2, [r3, #40]
	str	r2, [r3, #32]
	str	r2, [r3, #16]
	str	r2, [r3, #44]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	state
	.word	DMANow
	.word	shadowOAM
	.word	luffy
	.size	goToKaido1, .-goToKaido1
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
	ldr	r1, .L33
	ldr	r2, .L33+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L34:
	.align	2
.L33:
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
	ldr	r1, .L36
	ldr	r2, .L36+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L37:
	.align	2
.L36:
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
	ldr	r1, .L39
	ldr	r2, .L39+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L40:
	.align	2
.L39:
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
	push	{r4, r5, r6, r7, lr}
	mov	r1, #2
	mov	r7, #200
	mov	r6, #110
	mov	r5, #44
	mov	r4, #32
	mov	lr, #10
	mov	ip, #4
	mov	r0, #40
	ldr	r3, .L43
	strb	r2, [r3, #52]
	str	r7, [r3]
	str	r6, [r3, #4]
	str	r5, [r3, #12]
	str	r4, [r3, #8]
	str	lr, [r3, #36]
	str	ip, [r3, #28]
	str	r0, [r3, #48]
	str	r1, [r3, #20]
	str	r1, [r3, #24]
	str	r2, [r3, #40]
	str	r2, [r3, #32]
	str	r2, [r3, #16]
	str	r2, [r3, #44]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	luffy
	.size	initLuffy, .-initLuffy
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
	ldr	r2, .L88
	push	{r4, r5, r6, r7, r8, lr}
	ldrh	r6, [r2]
	ldr	r4, .L88+4
	tst	r6, #32
	str	r3, [r4, #16]
	ldr	r2, [r4, #44]
	bne	.L46
	cmp	r2, r3
	bne	.L47
	str	r2, [r4, #40]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	mvn	r2, r2, lsl #17
	mov	r0, #1
	mvn	r2, r2, lsr #17
	ldrb	r5, [r4, #52]	@ zero_extendqisi2
	ldr	r8, .L88+8
	lsl	r5, r5, #3
	strh	r2, [r8, r5]	@ movhi
	mov	r2, r0
	ldr	r1, [r4]
	cmp	r1, r3
	ldrgt	r3, [r4, #20]
	ldr	ip, .L88+12
	subgt	r1, r1, r3
	lsl	r3, r1, #23
	strgt	r1, [r4]
	str	r0, [r4, #16]
	ldrh	r7, [ip]
	lsr	r3, r3, #23
.L49:
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	add	r1, r8, r5
	strh	r3, [r1, #2]	@ movhi
	ldr	r3, [r4, #36]
	orrs	r1, r3, r2
	bne	.L55
.L86:
	mov	r2, #10
	ldr	r0, [r4, #32]
	ldr	r3, .L88+16
	str	r2, [r4, #36]
	ldr	r1, [r4, #28]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	add	r3, r8, r5
	lsl	r2, r1, #2
	str	r1, [r4, #32]
	strh	r2, [r3, #4]	@ movhi
.L56:
	tst	r7, #1
	beq	.L61
	tst	r6, #1
	moveq	r3, #1
	streq	r3, [r4, #44]
	bne	.L84
.L59:
	ldr	r3, [r4]
	ldr	ip, .L88+20
	and	r5, r3, ip
	mvn	r0, r5, lsl #18
	mvn	r0, r0, lsr #18
	mov	r8, #227
	ldrb	r2, [r4, #52]	@ zero_extendqisi2
	ldr	r1, .L88+8
	ldr	r7, [r4, #40]
	ldrh	lr, [r4, #4]
	add	r6, r1, r2, lsl #3
	strh	r0, [r6, #2]	@ movhi
	cmp	r7, #1
	and	r0, lr, #255
	lsl	r7, r2, #3
	strh	r0, [r1, r7]	@ movhi
	strh	r8, [r6, #4]	@ movhi
	ldr	r0, [r4, #48]
	beq	.L85
	cmp	r0, #39
	bgt	.L82
	add	r5, r2, #1
	lsl	r3, r3, #16
	add	lr, lr, #16
	lsl	r6, r5, #3
	lsr	r3, r3, #16
	and	lr, lr, #255
	strh	lr, [r1, r6]	@ movhi
	sub	r7, r3, #8
	ldr	r6, .L88+24
	add	r5, r1, r5, lsl #3
	and	r7, r7, ip
	cmp	r0, #36
	strh	r7, [r5, #2]	@ movhi
	strh	r6, [r5, #4]	@ movhi
	bgt	.L82
	add	r5, r2, #2
	sub	r7, r3, #12
	lsl	r8, r5, #3
	and	r7, r7, ip
	add	r5, r1, r5, lsl #3
	cmp	r0, #33
	strh	lr, [r1, r8]	@ movhi
	strh	r6, [r5, #4]	@ movhi
	strh	r7, [r5, #2]	@ movhi
	bgt	.L82
	add	r5, r2, #3
	sub	r7, r3, #16
	lsl	r8, r5, #3
	and	r7, r7, ip
	add	r5, r1, r5, lsl #3
	cmp	r0, #30
	strh	lr, [r1, r8]	@ movhi
	strh	r6, [r5, #4]	@ movhi
	strh	r7, [r5, #2]	@ movhi
	bgt	.L82
	mov	r5, #288
	sub	r3, r3, #28
	and	ip, ip, r3
	add	r3, r2, #4
	cmp	r0, #0
	orr	r2, ip, #16384
	add	ip, r1, r3, lsl #3
	lsl	r3, r3, #3
	strh	r2, [ip, #2]	@ movhi
	strh	lr, [r1, r3]	@ movhi
	strh	r5, [ip, #4]	@ movhi
	bge	.L82
.L70:
	mov	r2, #0
	mov	r3, #39
	str	r2, [r4, #44]
	b	.L64
.L46:
	ldr	r3, .L88+12
	tst	r6, #16
	ldrh	r7, [r3]
	bne	.L50
	cmp	r2, #0
	bne	.L51
	mov	r2, #1
	str	r2, [r4, #40]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	mvn	r2, r2, lsl #17
	mov	r0, #1
	mvn	r2, r2, lsr #17
	ldrb	r5, [r4, #52]	@ zero_extendqisi2
	ldr	r8, .L88+8
	lsl	r5, r5, #3
	strh	r2, [r8, r5]	@ movhi
	mov	r2, r0
	ldr	r3, [r4, #8]
	ldr	r1, [r4]
	rsb	r3, r3, #240
	cmp	r1, r3
	ldrlt	r3, [r4, #20]
	addlt	r1, r1, r3
	lsl	r3, r1, #23
	strlt	r1, [r4]
	str	r0, [r4, #16]
	lsr	r3, r3, #23
.L53:
	orr	r3, r3, #53248
	add	r1, r8, r5
	strh	r3, [r1, #2]	@ movhi
	ldr	r3, [r4, #36]
	orrs	r1, r3, r2
	beq	.L86
.L55:
	cmp	r3, #0
	beq	.L87
	movlt	r3, #10
	strlt	r3, [r4, #36]
	b	.L56
.L50:
	cmp	r2, #0
	bne	.L51
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	mvn	r1, r1, lsl #17
	mvn	r1, r1, lsr #17
	ldrb	r5, [r4, #52]	@ zero_extendqisi2
	ldr	r3, [r4]
	ldr	r0, [r4, #40]
	ldr	r8, .L88+8
	lsl	r5, r5, #3
	lsl	r3, r3, #23
	cmp	r0, #1
	strh	r1, [r8, r5]	@ movhi
	lsr	r3, r3, #23
	bne	.L49
	b	.L53
.L47:
	ldr	r3, .L88+12
	ldrh	r7, [r3]
.L51:
	tst	r7, #1
	beq	.L59
	tst	r6, #1
	moveq	r3, #1
	streq	r3, [r4, #44]
	beq	.L59
.L84:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L59
.L61:
	ldr	r3, [r4, #36]
	sub	r3, r3, #1
	str	r3, [r4, #36]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L85:
	orr	r5, r5, #53248
	cmp	r0, #39
	strh	r5, [r6, #2]	@ movhi
	bgt	.L82
	ldr	r5, [r4, #8]
	add	r3, r3, r5
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r5, r2, #1
	ldr	r6, .L88+24
	add	lr, lr, #16
	add	r7, r3, #36
	lsl	r8, r5, #3
	and	lr, lr, #255
	add	r5, r1, r5, lsl #3
	and	r7, r7, ip
	cmp	r0, #36
	strh	lr, [r1, r8]	@ movhi
	strh	r7, [r5, #2]	@ movhi
	strh	r6, [r5, #4]	@ movhi
	bgt	.L82
	add	r5, r2, #2
	lsl	r8, r5, #3
	cmp	r0, #33
	add	r5, r1, r5, lsl #3
	strh	lr, [r1, r8]	@ movhi
	strh	r7, [r5, #2]	@ movhi
	strh	r6, [r5, #4]	@ movhi
	bgt	.L82
	add	r5, r2, #3
	add	r7, r3, #40
	lsl	r8, r5, #3
	and	r7, r7, ip
	add	r5, r1, r5, lsl #3
	cmp	r0, #30
	strh	lr, [r1, r8]	@ movhi
	strh	r6, [r5, #4]	@ movhi
	strh	r7, [r5, #2]	@ movhi
	bgt	.L82
	add	r5, r2, #4
	add	r7, r3, #44
	lsl	r8, r5, #3
	and	r7, r7, ip
	add	r5, r1, r5, lsl #3
	cmp	r0, #27
	strh	lr, [r1, r8]	@ movhi
	strh	r6, [r5, #4]	@ movhi
	strh	r7, [r5, #2]	@ movhi
	bgt	.L82
	add	r5, r2, #5
	add	r7, r3, #48
	lsl	r8, r5, #3
	and	r7, r7, ip
	add	r5, r1, r5, lsl #3
	cmp	r0, #24
	strh	lr, [r1, r8]	@ movhi
	strh	r6, [r5, #4]	@ movhi
	strh	r7, [r5, #2]	@ movhi
	bgt	.L82
	mov	r5, #288
	add	r3, r3, #52
	and	ip, ip, r3
	add	r3, r2, #6
	add	r2, r1, r3, lsl #3
	orr	ip, ip, #20480
	lsl	r3, r3, #3
	cmp	r0, #0
	strh	ip, [r2, #2]	@ movhi
	strh	lr, [r1, r3]	@ movhi
	strh	r5, [r2, #4]	@ movhi
	blt	.L70
.L82:
	sub	r3, r0, #1
.L64:
	str	r3, [r4, #48]
	b	.L61
.L87:
	cmp	r2, #1
	bne	.L56
	mov	r0, #10
	ldr	r3, [r4, #32]
	ldr	r2, .L88+28
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	sub	r2, r3, r2
	add	r1, r2, #4
	add	r3, r8, r5
	lsl	r1, r1, #2
	str	r2, [r4, #32]
	strh	r1, [r3, #4]	@ movhi
	str	r0, [r4, #36]
	b	.L56
.L89:
	.align	2
.L88:
	.word	buttons
	.word	luffy
	.word	shadowOAM
	.word	oldButtons
	.word	__aeabi_idivmod
	.word	511
	.word	290
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
	ldr	r3, .L92
	ldr	r4, .L92+4
	mov	lr, pc
	bx	r3
	bl	luffyUpdate
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L92+8
	mov	lr, pc
	bx	r4
	mov	r3, #9600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L92+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L92+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L92+20
	ldr	r1, .L92+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L92+28
	ldr	r1, .L92+32
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L92+36
	ldr	r1, .L92+40
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L93:
	.align	2
.L92:
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
	.comm	shadowOAM,1024,4
	.comm	DIRECTION,1,1
	.comm	STATE,1,1
	.comm	luffy,56,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
