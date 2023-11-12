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
	.global	bigMom1
	.syntax unified
	.arm
	.fpu softvfp
	.type	bigMom1, %function
bigMom1:
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
	.word	hideSprites
	.size	bigMom1, .-bigMom1
	.align	2
	.global	bigMom2
	.syntax unified
	.arm
	.fpu softvfp
	.type	bigMom2, %function
bigMom2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	hideSprites
	.size	bigMom2, .-bigMom2
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
	ldr	r3, .L20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
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
	ldr	r1, .L24
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L24+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L24+8
	ldr	r3, .L24+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
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
	ldr	r3, .L28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L29:
	.align	2
.L28:
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
	ldr	r3, .L31
	strh	r2, [r3]	@ movhi
	bx	lr
.L32:
	.align	2
.L31:
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
	ldr	r3, .L34
	strh	r2, [r3]	@ movhi
	bx	lr
.L35:
	.align	2
.L34:
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToKaido2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToKaido2, %function
goToKaido2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #3
	ldr	r3, .L37
	strh	r2, [r3]	@ movhi
	bx	lr
.L38:
	.align	2
.L37:
	.word	state
	.size	goToKaido2, .-goToKaido2
	.align	2
	.global	goToBigMom1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToBigMom1, %function
goToBigMom1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #4
	ldr	r3, .L40
	strh	r2, [r3]	@ movhi
	bx	lr
.L41:
	.align	2
.L40:
	.word	state
	.size	goToBigMom1, .-goToBigMom1
	.align	2
	.global	goToBigMom2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToBigMom2, %function
goToBigMom2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #5
	ldr	r3, .L43
	strh	r2, [r3]	@ movhi
	bx	lr
.L44:
	.align	2
.L43:
	.word	state
	.size	goToBigMom2, .-goToBigMom2
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
	mov	r0, #6
	mov	r3, #67108864
	ldr	r1, .L46
	ldr	r2, .L46+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L47:
	.align	2
.L46:
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
	mov	r0, #7
	mov	r3, #67108864
	ldr	r1, .L49
	ldr	r2, .L49+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L50:
	.align	2
.L49:
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
	mov	r0, #8
	mov	r3, #67108864
	ldr	r1, .L52
	ldr	r2, .L52+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L53:
	.align	2
.L52:
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	ip, #4
	mov	r9, #200
	mov	r8, #110
	mov	r7, #2
	mov	r6, #44
	mov	r5, #32
	mov	r4, #1
	mov	lr, #10
	mov	r0, #22
	mov	r1, #85
	ldr	r3, .L56
	strb	r2, [r3, #60]
	str	r9, [r3]
	str	r8, [r3, #4]
	str	r7, [r3, #20]
	str	r6, [r3, #12]
	str	r5, [r3, #8]
	str	r4, [r3, #24]
	str	lr, [r3, #36]
	str	ip, [r3, #28]
	str	r0, [r3, #48]
	str	r1, [r3, #56]
	str	r2, [r3, #40]
	str	r2, [r3, #32]
	str	r2, [r3, #16]
	str	r2, [r3, #44]
	str	r2, [r3, #52]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	luffy
	.size	initLuffy, .-initLuffy
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
	ldr	r1, .L77
	push	{r4, r5, r6, r7, r8, lr}
	ldr	ip, [r1]
	ldr	r5, .L77+4
	and	r6, ip, r5
	mvn	r0, r6, lsl #18
	mvn	r0, r0, lsr #18
	mov	r8, #227
	ldrb	r2, [r1, #60]	@ zero_extendqisi2
	ldr	r3, .L77+8
	ldr	r7, [r1, #40]
	ldrh	lr, [r1, #4]
	add	r4, r3, r2, lsl #3
	strh	r0, [r4, #2]	@ movhi
	cmp	r7, #1
	and	r0, lr, #255
	lsl	r7, r2, #3
	strh	r0, [r3, r7]	@ movhi
	strh	r8, [r4, #4]	@ movhi
	ldr	r0, [r1, #48]
	beq	.L76
	cmp	r0, #19
	bgt	.L75
	add	r4, r2, #1
	lsl	ip, ip, #16
	add	lr, lr, #16
	lsl	r6, r4, #3
	lsr	ip, ip, #16
	and	lr, lr, #255
	strh	lr, [r3, r6]	@ movhi
	sub	r7, ip, #8
	ldr	r6, .L77+12
	add	r4, r3, r4, lsl #3
	and	r7, r7, r5
	cmp	r0, #17
	strh	r7, [r4, #2]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	bgt	.L75
	add	r4, r2, #2
	sub	r7, ip, #12
	lsl	r8, r4, #3
	and	r7, r7, r5
	add	r4, r3, r4, lsl #3
	cmp	r0, #15
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	strh	r7, [r4, #2]	@ movhi
	bgt	.L75
	add	r4, r2, #3
	sub	r7, ip, #16
	lsl	r8, r4, #3
	and	r7, r7, r5
	add	r4, r3, r4, lsl #3
	cmp	r0, #13
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	strh	r7, [r4, #2]	@ movhi
	bgt	.L75
	add	r4, r2, #4
	sub	r7, ip, #20
	lsl	r8, r4, #3
	and	r7, r7, r5
	add	r4, r3, r4, lsl #3
	cmp	r0, #11
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	strh	r7, [r4, #2]	@ movhi
	bgt	.L75
	add	r4, r2, #5
	sub	r7, ip, #24
	lsl	r8, r4, #3
	and	r7, r7, r5
	add	r4, r3, r4, lsl #3
	cmp	r0, #9
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	strh	r7, [r4, #2]	@ movhi
	bgt	.L75
	mov	r6, #288
	sub	ip, ip, #36
	add	r2, r2, #6
	and	ip, ip, r5
	add	r4, r3, r2, lsl #3
	orr	ip, ip, #16384
	lsl	r2, r2, #3
	cmp	r0, #0
	strh	ip, [r4, #2]	@ movhi
	strh	lr, [r3, r2]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	bge	.L75
.L67:
	mov	r2, #0
	mov	r3, #1
	mov	r0, #21
	str	r2, [r1, #44]
	str	r3, [r1, #36]
	str	r0, [r1, #48]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L76:
	orr	r6, r6, #53248
	cmp	r0, #19
	strh	r6, [r4, #2]	@ movhi
	ble	.L60
.L75:
	sub	r0, r0, #1
	str	r0, [r1, #48]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L60:
	ldr	r4, [r1, #8]
	add	ip, ip, r4
	lsl	r4, ip, #16
	add	lr, lr, #16
	add	ip, r2, #1
	lsl	r6, ip, #3
	lsr	r4, r4, #16
	and	lr, lr, #255
	strh	lr, [r3, r6]	@ movhi
	add	r7, r4, #32
	ldr	r6, .L77+12
	add	ip, r3, ip, lsl #3
	and	r7, r7, r5
	cmp	r0, #17
	strh	r7, [ip, #2]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	bgt	.L75
	add	ip, r2, #2
	add	r7, r4, #36
	lsl	r8, ip, #3
	and	r7, r7, r5
	add	ip, r3, ip, lsl #3
	cmp	r0, #15
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	bgt	.L75
	add	ip, r2, #3
	add	r7, r4, #40
	lsl	r8, ip, #3
	and	r7, r7, r5
	add	ip, r3, ip, lsl #3
	cmp	r0, #13
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	bgt	.L75
	add	ip, r2, #4
	add	r7, r4, #44
	lsl	r8, ip, #3
	and	r7, r7, r5
	add	ip, r3, ip, lsl #3
	cmp	r0, #11
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	bgt	.L75
	add	ip, r2, #5
	add	r7, r4, #48
	lsl	r8, ip, #3
	and	r7, r7, r5
	add	ip, r3, ip, lsl #3
	cmp	r0, #9
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	bgt	.L75
	mov	r6, #288
	add	r4, r4, #52
	add	r2, r2, #6
	and	r5, r5, r4
	add	ip, r3, r2, lsl #3
	orr	r5, r5, #20480
	lsl	r2, r2, #3
	cmp	r0, #0
	strh	r5, [ip, #2]	@ movhi
	strh	lr, [r3, r2]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	blt	.L67
	b	.L75
.L78:
	.align	2
.L77:
	.word	luffy
	.word	511
	.word	shadowOAM
	.word	290
	.size	luffyPunching, .-luffyPunching
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
	ldr	r3, .L92
	push	{r4, r5, r6, r7, lr}
	ldr	r4, [r3, #4]
	and	r5, r4, #255
	mvn	lr, r5, lsl #17
	mvn	lr, lr, lsr #17
	ldr	r0, [r3]
	ldrb	ip, [r3, #60]	@ zero_extendqisi2
	ldr	r6, [r3, #40]
	ldr	r2, .L92+4
	lsl	r0, r0, #23
	cmp	r6, #1
	lsr	r0, r0, #23
	lsl	r1, ip, #3
	strh	lr, [r2, r1]	@ movhi
	add	ip, r2, ip, lsl #3
	orreq	lr, r0, #53248
	orr	r7, r0, #49152
	strh	r7, [ip, #2]	@ movhi
	strheq	lr, [ip, #2]	@ movhi
	ldr	lr, [r3, #56]
	sub	ip, lr, #71
	cmp	ip, #13
	bhi	.L81
	mov	r5, #268
	ldr	r0, [r3, #24]
	add	r2, r2, r1
	sub	r4, r4, r0, lsl #1
	strh	r5, [r2, #4]	@ movhi
	str	r4, [r3, #4]
	sub	ip, lr, #1
.L86:
	str	ip, [r3, #56]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L81:
	sub	ip, lr, #36
	cmp	ip, #33
	bhi	.L83
	cmp	r6, #1
	add	ip, r2, r1
	orreq	r0, r0, #53248
	strheq	r0, [ip, #2]	@ movhi
	mov	r0, #272
	orr	r5, r5, #16384
	strh	r5, [r2, r1]	@ movhi
	add	r2, r2, r1
	ldr	r1, [r3, #24]
	strhne	r7, [ip, #2]	@ movhi
	sub	r4, r4, r1
	sub	ip, lr, #1
	str	r4, [r3, #4]
	strh	r0, [r2, #4]	@ movhi
	str	ip, [r3, #56]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L83:
	sub	ip, lr, #1
	cmp	ip, #33
	bhi	.L87
	ldr	r4, [r3, #4]
	and	lr, r4, #255
	mvn	lr, lr, lsl #17
	mvn	lr, lr, lsr #17
	cmp	r6, #1
	orreq	r0, r0, #53248
	strh	lr, [r2, r1]	@ movhi
	add	lr, r2, r1
	strheq	r0, [lr, #2]	@ movhi
	mov	r0, #280
	strhne	r7, [lr, #2]	@ movhi
	add	r2, r2, r1
	cmp	r4, #109
	strh	r0, [r2, #4]	@ movhi
	bgt	.L86
	ldr	r2, [r3, #24]
	add	r4, r4, r2, lsl #1
	str	r4, [r3, #4]
	str	ip, [r3, #56]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L87:
	cmp	lr, #0
	movlt	r1, #0
	movlt	r2, #1
	movlt	ip, #84
	strlt	r1, [r3, #52]
	strlt	r2, [r3, #36]
	str	ip, [r3, #56]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L93:
	.align	2
.L92:
	.word	luffy
	.word	shadowOAM
	.size	luffyJumping, .-luffyJumping
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
	ldr	r7, .L133
	ldrh	r5, [r7]
	ldr	r4, .L133+4
	tst	r5, #32
	str	r3, [r4, #16]
	ldr	r3, [r4, #44]
	bne	.L95
	cmp	r3, #0
	bne	.L96
	ldr	r2, [r4]
	cmp	r2, #0
	str	r3, [r4, #40]
	ldrgt	r3, [r4, #20]
	subgt	r2, r2, r3
	strgt	r2, [r4]
.L98:
	mov	r3, #1
	str	r3, [r4, #16]
.L99:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L104
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
	ldr	r8, .L133+8
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
	beq	.L129
	cmp	r3, #0
	bne	.L105
	cmp	r2, #1
	beq	.L130
.L104:
	ldr	r6, .L133+12
	ldrh	r3, [r6]
	tst	r3, #1
	beq	.L110
.L114:
	tst	r5, #1
	moveq	r3, #1
	streq	r3, [r4, #44]
	bne	.L131
.L108:
	bl	luffyPunching
.L127:
	ldrh	r3, [r6]
.L110:
	tst	r3, #64
	beq	.L111
	ldrh	r3, [r7]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #52]
	bne	.L111
.L112:
	bl	luffyJumping
.L113:
	ldr	r3, [r4, #36]
	sub	r3, r3, #1
	str	r3, [r4, #36]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L95:
	tst	r5, #16
	beq	.L132
	cmp	r3, #0
	beq	.L99
.L96:
	ldr	r6, .L133+12
	ldrh	r3, [r6]
	tst	r3, #1
	beq	.L108
	tst	r5, #1
	moveq	r3, #1
	streq	r3, [r4, #44]
	beq	.L108
	b	.L131
.L132:
	cmp	r3, #0
	bne	.L96
	mov	r1, #1
	ldr	r3, [r4, #8]
	ldr	r2, [r4]
	rsb	r3, r3, #240
	cmp	r2, r3
	str	r1, [r4, #40]
	ldrlt	r3, [r4, #20]
	addlt	r2, r3, r2
	strlt	r2, [r4]
	b	.L98
.L131:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L127
	b	.L108
.L111:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L113
	b	.L112
.L129:
	mov	r2, #10
	ldr	r0, [r4, #32]
	ldr	r3, .L133+16
	str	r2, [r4, #36]
	ldr	r1, [r4, #28]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	add	r3, r8, r6
	ldr	r6, .L133+12
	lsl	r2, r1, #2
	strh	r2, [r3, #4]	@ movhi
	ldrh	r3, [r6]
	tst	r3, #1
	str	r1, [r4, #32]
	beq	.L110
	b	.L114
.L105:
	movlt	r3, #10
	strlt	r3, [r4, #36]
	b	.L104
.L130:
	mov	r0, #10
	ldr	r3, [r4, #32]
	ldr	r2, .L133+20
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
	b	.L104
.L134:
	.align	2
.L133:
	.word	buttons
	.word	luffy
	.word	shadowOAM
	.word	oldButtons
	.word	__aeabi_idivmod
	.word	1431655766
	.size	luffyUpdate, .-luffyUpdate
	.align	2
	.global	kaido2
	.syntax unified
	.arm
	.fpu softvfp
	.type	kaido2, %function
kaido2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L137
	ldr	r4, .L137+4
	mov	lr, pc
	bx	r3
	bl	luffyUpdate
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L137+8
	mov	lr, pc
	bx	r4
	mov	r3, #9600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L137+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L137+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L137+20
	ldr	r1, .L137+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L137+28
	ldr	r1, .L137+32
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L137+36
	ldr	r1, .L137+40
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L138:
	.align	2
.L137:
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
	.size	kaido2, .-kaido2
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #20
	mov	r1, #1
	ldr	r3, .L141
	str	r6, [r3, #44]
	ldr	r6, .L141+4
	str	r1, [r3, #36]
	str	r1, [r6, #16]
	str	r1, [r3, #20]
	mov	r1, #8
	mov	r7, #7
	mov	r2, #0
	mvn	fp, #24
	mov	r10, #100
	mov	r9, #25
	mov	r8, #58
	mov	r5, #66
	mov	r4, #125
	mov	lr, #32
	mov	r0, #10
	strb	r1, [r6, #32]
	mov	ip, #16
	mov	r1, #2
	strb	r7, [r3, #48]
	stmib	r6, {r4, lr}
	str	fp, [r3]
	str	r10, [r3, #4]
	str	r9, [r3, #12]
	str	r8, [r3, #8]
	str	r5, [r6]
	str	ip, [r6, #12]
	str	r1, [r6, #24]
	str	r2, [r6, #28]
	str	r0, [r6, #20]
	str	r2, [r3, #28]
	str	r2, [r3, #16]
	str	r2, [r3, #24]
	str	r2, [r3, #40]
	str	r0, [r3, #32]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L142:
	.align	2
.L141:
	.word	kaido
	.word	fireball
	.size	initKaido, .-initKaido
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
	mov	ip, #2
	mov	r1, #67108864
	mov	r2, #4352
	mov	r0, #7168
	push	{r4, lr}
	ldr	r3, .L145
	ldr	r4, .L145+4
	strh	ip, [r3]	@ movhi
	strh	r2, [r1]	@ movhi
	mov	r3, #512
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L145+8
	mov	lr, pc
	bx	r4
	bl	initLuffy
	pop	{r4, lr}
	b	initKaido
.L146:
	.align	2
.L145:
	.word	state
	.word	DMANow
	.word	shadowOAM
	.size	goToKaido1, .-goToKaido1
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
	ldr	r2, .L149
	ldr	r3, [r2]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mov	r0, #128
	mvn	r3, r3, lsr #18
	ldr	r1, .L149+4
	str	lr, [sp, #-4]!
	ldr	r1, [r1]
	strh	r0, [r1, #30]	@ movhi
	strh	r0, [r1, #6]	@ movhi
	ldr	ip, .L149+8
	ldrb	r1, [r2, #4]	@ zero_extendqisi2
	ldrb	r2, [r2, #48]	@ zero_extendqisi2
	ldr	lr, .L149+12
	add	r0, ip, r2, lsl #3
	orr	r1, r1, #768
	lsl	r2, r2, #3
	strh	lr, [r0, #4]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [ip, r2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L150:
	.align	2
.L149:
	.word	kaido
	.word	.LANCHOR0
	.word	shadowOAM
	.word	4576
	.size	kaidoUpdate, .-kaidoUpdate
	.align	2
	.global	fireballCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireballCollision, %function
fireballCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L153
	add	r1, r3, #8
	ldm	r1, {r1, ip}
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	sub	sp, sp, #16
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r0, .L153+4
	ldr	r4, .L153+8
	ldm	r0, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L154:
	.align	2
.L153:
	.word	luffy
	.word	fireball
	.word	collision
	.size	fireballCollision, .-fireballCollision
	.align	2
	.global	fireballUpdate
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireballUpdate, %function
fireballUpdate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L166
	ldr	r1, [r4]
	lsl	r2, r1, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r0, [r4, #28]
	ldr	lr, [r4, #8]
	ldrb	ip, [r4, #32]	@ zero_extendqisi2
	ldr	r5, .L166+4
	lsl	r3, r0, #6
	add	lr, lr, #240
	add	r3, r3, #28
	cmp	r1, lr
	and	r3, r3, #1020
	add	lr, r5, ip, lsl #3
	orr	r3, r3, #4096
	strh	r2, [lr, #2]	@ movhi
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	strh	r3, [lr, #4]	@ movhi
	ldrgt	r3, .L166+8
	ldrle	r3, [r4, #16]
	orr	r2, r2, #16384
	lsl	ip, ip, #3
	ldrgt	r1, [r3]
	strh	r2, [r5, ip]	@ movhi
	ldrgt	r2, [r3, #8]
	addle	r1, r1, r3
	ldr	r3, [r4, #20]
	addgt	r1, r1, r2, lsl #1
	subgt	r1, r1, #25
	cmp	r3, #0
	str	r1, [r4]
	bne	.L158
	ldr	r3, .L166+12
	ldr	r1, [r4, #24]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #9
	str	r1, [r4, #28]
.L159:
	str	r3, [r4, #20]
	bl	fireballCollision
	cmp	r0, #0
	beq	.L155
	mov	r0, #8
	mov	r3, #67108864
	ldr	r1, .L166+16
	ldr	r2, .L166+20
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
.L155:
	pop	{r4, r5, r6, lr}
	bx	lr
.L158:
	movlt	r3, #9
	subge	r3, r3, #1
	b	.L159
.L167:
	.align	2
.L166:
	.word	fireball
	.word	shadowOAM
	.word	kaido
	.word	__aeabi_idivmod
	.word	state
	.word	1044
	.size	fireballUpdate, .-fireballUpdate
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L170
	mov	lr, pc
	bx	r3
	bl	luffyUpdate
	ldr	r2, .L170+4
	ldr	r3, [r2]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mov	r0, #128
	mvn	r3, r3, lsr #18
	ldr	r1, .L170+8
	ldr	r1, [r1]
	strh	r0, [r1, #30]	@ movhi
	strh	r0, [r1, #6]	@ movhi
	ldr	r5, .L170+12
	ldrb	r1, [r2, #4]	@ zero_extendqisi2
	ldrb	r2, [r2, #48]	@ zero_extendqisi2
	ldr	ip, .L170+16
	add	r0, r5, r2, lsl #3
	strh	ip, [r0, #4]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	orr	r1, r1, #768
	lsl	r2, r2, #3
	ldr	r4, .L170+20
	strh	r1, [r5, r2]	@ movhi
	bl	fireballUpdate
	mov	r1, r5
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #9600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L170+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L170+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L170+32
	ldr	r1, .L170+36
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L170+40
	ldr	r1, .L170+44
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L170+48
	ldr	r1, .L170+52
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L171:
	.align	2
.L170:
	.word	hideSprites
	.word	kaido
	.word	.LANCHOR0
	.word	shadowOAM
	.word	4576
	.word	DMANow
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
	.global	punchCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	punchCollision, %function
punchCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r1, .L174
	ldr	r0, .L174+4
	ldr	ip, [r1, #12]
	sub	sp, sp, #16
	add	r2, r0, #8
	ldm	r2, {r2, r3}
	ldr	lr, [r1, #8]
	str	ip, [sp, #12]
	ldm	r1, {r1, ip}
	stm	sp, {r1, ip, lr}
	ldr	r4, .L174+8
	ldm	r0, {r0, r1}
	lsl	r3, r3, #1
	lsl	r2, r2, #1
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L175:
	.align	2
.L174:
	.word	luffyFist
	.word	kaido
	.word	collision
	.size	punchCollision, .-punchCollision
	.global	SHADOW_OAM_AFF
	.comm	shadowOAM,1024,4
	.comm	DIRECTION,1,1
	.comm	STATE,1,1
	.comm	soundEffect,24,4
	.comm	song,24,4
	.comm	fireball,36,4
	.comm	kaido,52,4
	.comm	luffyFist,20,4
	.comm	luffy,64,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	SHADOW_OAM_AFF, %object
	.size	SHADOW_OAM_AFF, 4
SHADOW_OAM_AFF:
	.word	shadowOAM
	.ident	"GCC: (devkitARM release 53) 9.1.0"
