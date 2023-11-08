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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r1, #2
	mov	r8, #200
	mov	r7, #110
	mov	r6, #44
	mov	r5, #32
	mov	r4, #10
	mov	lr, #4
	mov	ip, #22
	mov	r0, #30
	ldr	r3, .L56
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
.L57:
	.align	2
.L56:
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
	mov	ip, #2
	mov	r1, #67108864
	mov	r2, #4352
	mov	r0, #7168
	ldr	r3, .L60
	push	{r4, lr}
	strh	ip, [r3]	@ movhi
	ldr	r4, .L60+4
	strh	r2, [r1]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	strh	r0, [r1, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L60+8
	mov	lr, pc
	bx	r4
	bl	initLuffy
	mov	lr, #7
	mov	r2, #0
	mov	r1, #1
	mov	ip, #20
	mov	r0, #10
	ldr	r3, .L60+12
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
	pop	{r4, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	state
	.word	DMANow
	.word	shadowOAM
	.word	kaido
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
	ldr	r1, .L84
	push	{r4, r5, r6, r7, r8, lr}
	ldr	ip, [r1]
	ldr	r5, .L84+4
	and	r6, ip, r5
	mvn	r0, r6, lsl #18
	mvn	r0, r0, lsr #18
	mov	r8, #227
	ldrb	r2, [r1, #60]	@ zero_extendqisi2
	ldr	r3, .L84+8
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
	beq	.L83
	cmp	r0, #19
	bgt	.L81
	add	r4, r2, #1
	lsl	ip, ip, #16
	add	lr, lr, #16
	lsl	r6, r4, #3
	lsr	ip, ip, #16
	and	lr, lr, #255
	strh	lr, [r3, r6]	@ movhi
	sub	r7, ip, #8
	ldr	r6, .L84+12
	add	r4, r3, r4, lsl #3
	and	r7, r7, r5
	cmp	r0, #17
	strh	r7, [r4, #2]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	bgt	.L81
	add	r4, r2, #2
	sub	r7, ip, #12
	lsl	r8, r4, #3
	and	r7, r7, r5
	add	r4, r3, r4, lsl #3
	cmp	r0, #15
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	strh	r7, [r4, #2]	@ movhi
	bgt	.L81
	add	r4, r2, #3
	sub	r7, ip, #16
	lsl	r8, r4, #3
	and	r7, r7, r5
	add	r4, r3, r4, lsl #3
	cmp	r0, #13
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	strh	r7, [r4, #2]	@ movhi
	bgt	.L81
	add	r4, r2, #4
	sub	r7, ip, #20
	lsl	r8, r4, #3
	and	r7, r7, r5
	add	r4, r3, r4, lsl #3
	cmp	r0, #11
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	strh	r7, [r4, #2]	@ movhi
	bgt	.L81
	add	r4, r2, #5
	sub	r7, ip, #24
	lsl	r8, r4, #3
	and	r7, r7, r5
	add	r4, r3, r4, lsl #3
	cmp	r0, #9
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [r4, #4]	@ movhi
	strh	r7, [r4, #2]	@ movhi
	bgt	.L81
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
	bge	.L81
	mov	r2, #0
	mov	r3, #1
	mov	r0, #21
	str	r2, [r1, #44]
	str	r3, [r1, #36]
	str	r0, [r1, #48]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L83:
	orr	r6, r6, #53248
	cmp	r0, #19
	strh	r6, [r4, #2]	@ movhi
	ble	.L64
.L81:
	sub	r0, r0, #1
	str	r0, [r1, #48]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L64:
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
	ldr	r6, .L84+12
	add	ip, r3, ip, lsl #3
	and	r7, r7, r5
	cmp	r0, #17
	strh	r7, [ip, #2]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	bgt	.L81
	add	ip, r2, #2
	add	r7, r4, #36
	lsl	r8, ip, #3
	and	r7, r7, r5
	add	ip, r3, ip, lsl #3
	cmp	r0, #15
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	bgt	.L81
	add	ip, r2, #3
	add	r7, r4, #40
	lsl	r8, ip, #3
	and	r7, r7, r5
	add	ip, r3, ip, lsl #3
	cmp	r0, #13
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	bgt	.L81
	add	ip, r2, #4
	add	r7, r4, #44
	lsl	r8, ip, #3
	and	r7, r7, r5
	add	ip, r3, ip, lsl #3
	cmp	r0, #11
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	bgt	.L81
	add	ip, r2, #5
	add	r7, r4, #48
	lsl	r8, ip, #3
	and	r7, r7, r5
	add	ip, r3, ip, lsl #3
	cmp	r0, #9
	strh	lr, [r3, r8]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	bgt	.L81
	add	r2, r2, #6
	add	ip, r3, r2, lsl #3
	cmp	r0, #0
	lsl	r2, r2, #3
	mov	r6, #288
	strh	lr, [r3, r2]	@ movhi
	movlt	r3, #0
	add	r4, r4, #52
	and	r5, r5, r4
	orr	r5, r5, #20480
	movlt	r0, #21
	strh	r5, [ip, #2]	@ movhi
	strh	r6, [ip, #4]	@ movhi
	strlt	r3, [r1, #44]
	bge	.L81
	str	r0, [r1, #48]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L85:
	.align	2
.L84:
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
	ldr	r3, .L91
	ldr	r2, [r3]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r0, r2, lsl #18
	mvn	r0, r0, lsr #18
	push	{r4, r5, lr}
	ldr	r5, [r3, #40]
	ldr	lr, .L91+4
	ldrb	r1, [r3, #60]	@ zero_extendqisi2
	cmp	r5, #1
	add	ip, lr, r1, lsl #3
	orreq	r2, r2, #53248
	strh	r0, [ip, #2]	@ movhi
	strheq	r2, [ip, #2]	@ movhi
	ldr	r2, [r3, #56]
	ldrb	r0, [r3, #4]	@ zero_extendqisi2
	cmp	r2, #0
	lsl	r1, r1, #3
	mov	r4, #227
	strh	r0, [lr, r1]	@ movhi
	movlt	r2, #29
	movlt	r1, #0
	subge	r2, r2, #1
	strh	r4, [ip, #4]	@ movhi
	strlt	r1, [r3, #52]
	str	r2, [r3, #56]
	pop	{r4, r5, lr}
	bx	lr
.L92:
	.align	2
.L91:
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
	ldr	r7, .L132
	ldrh	r5, [r7]
	ldr	r4, .L132+4
	tst	r5, #32
	str	r3, [r4, #16]
	ldr	r3, [r4, #44]
	bne	.L94
	cmp	r3, #0
	bne	.L95
	ldr	r2, [r4]
	cmp	r2, #0
	str	r3, [r4, #40]
	ldrgt	r3, [r4, #20]
	subgt	r2, r2, r3
	strgt	r2, [r4]
.L97:
	mov	r3, #1
	str	r3, [r4, #16]
.L98:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L103
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
	ldr	r8, .L132+8
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
	beq	.L128
	cmp	r3, #0
	bne	.L104
	cmp	r2, #1
	beq	.L129
.L103:
	ldr	r6, .L132+12
	ldrh	r3, [r6]
	tst	r3, #1
	beq	.L109
.L113:
	tst	r5, #1
	moveq	r3, #1
	streq	r3, [r4, #44]
	bne	.L130
.L107:
	bl	luffyPunching
.L126:
	ldrh	r3, [r6]
.L109:
	tst	r3, #64
	beq	.L110
	ldrh	r3, [r7]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #52]
	bne	.L110
.L111:
	bl	luffyJumping
.L112:
	ldr	r3, [r4, #36]
	sub	r3, r3, #1
	str	r3, [r4, #36]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L94:
	tst	r5, #16
	beq	.L131
	cmp	r3, #0
	beq	.L98
.L95:
	ldr	r6, .L132+12
	ldrh	r3, [r6]
	tst	r3, #1
	beq	.L107
	tst	r5, #1
	moveq	r3, #1
	streq	r3, [r4, #44]
	beq	.L107
	b	.L130
.L131:
	cmp	r3, #0
	bne	.L95
	mov	r1, #1
	ldr	r3, [r4, #8]
	ldr	r2, [r4]
	rsb	r3, r3, #240
	cmp	r2, r3
	str	r1, [r4, #40]
	ldrlt	r3, [r4, #20]
	addlt	r2, r3, r2
	strlt	r2, [r4]
	b	.L97
.L130:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L126
	b	.L107
.L110:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L112
	b	.L111
.L128:
	mov	r2, #10
	ldr	r0, [r4, #32]
	ldr	r3, .L132+16
	str	r2, [r4, #36]
	ldr	r1, [r4, #28]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	add	r3, r8, r6
	ldr	r6, .L132+12
	lsl	r2, r1, #2
	strh	r2, [r3, #4]	@ movhi
	ldrh	r3, [r6]
	tst	r3, #1
	str	r1, [r4, #32]
	beq	.L109
	b	.L113
.L104:
	movlt	r3, #10
	strlt	r3, [r4, #36]
	b	.L103
.L129:
	mov	r0, #10
	ldr	r3, [r4, #32]
	ldr	r2, .L132+20
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
	b	.L103
.L133:
	.align	2
.L132:
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
	ldr	r3, .L136
	ldr	r4, .L136+4
	mov	lr, pc
	bx	r3
	bl	luffyUpdate
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L136+8
	mov	lr, pc
	bx	r4
	mov	r3, #9600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L136+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L136+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L136+20
	ldr	r1, .L136+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L136+28
	ldr	r1, .L136+32
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L136+36
	ldr	r1, .L136+40
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L137:
	.align	2
.L136:
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
	.global	kaido2
	.syntax unified
	.arm
	.fpu softvfp
	.type	kaido2, %function
kaido2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	kaido1
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
	str	lr, [sp, #-4]!
	mov	lr, #7
	mov	r2, #0
	mov	r1, #1
	mov	ip, #20
	mov	r0, #10
	ldr	r3, .L141
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
.L142:
	.align	2
.L141:
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
