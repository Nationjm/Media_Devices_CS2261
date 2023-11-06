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
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #512
	ldr	r4, .L12
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	shadowOAM
	.size	game, .-game
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
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
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
	ldr	r1, .L20
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L20+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L20+8
	ldr	r3, .L20+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
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
	ldr	r3, .L24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
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
	ldr	r3, .L27
	strh	r2, [r3]	@ movhi
	bx	lr
.L28:
	.align	2
.L27:
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
	ldr	r3, .L30
	strh	r2, [r3]	@ movhi
	bx	lr
.L31:
	.align	2
.L30:
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	ip, #2
	mov	r2, #4352
	mov	r0, #7168
	push	{r4, lr}
	ldr	r3, .L34
	ldr	r4, .L34+4
	strh	ip, [r3]	@ movhi
	strh	r2, [r1]	@ movhi
	mov	r3, #512
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L34+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	state
	.word	DMANow
	.word	shadowOAM
	.size	goToGame, .-goToGame
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
	ldr	r1, .L37
	ldr	r2, .L37+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L38:
	.align	2
.L37:
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
	ldr	r1, .L40
	ldr	r2, .L40+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L41:
	.align	2
.L40:
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
	ldr	r1, .L43
	ldr	r2, .L43+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L44:
	.align	2
.L43:
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
	str	lr, [sp, #-4]!
	mov	r1, #2
	mov	lr, #200
	mov	ip, #130
	mov	r0, #10
	ldr	r3, .L47
	strb	r2, [r3, #44]
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #36]
	str	r1, [r3, #20]
	str	r1, [r3, #24]
	str	r2, [r3, #40]
	str	r2, [r3, #32]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #16]
	str	r2, [r3, #28]
	ldr	lr, [sp], #4
	bx	lr
.L48:
	.align	2
.L47:
	.word	luffy
	.size	initLuffy, .-initLuffy
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
	@ link register save eliminated.
	ldr	r3, .L52
	ldrh	r3, [r3]
	tst	r3, #32
	bne	.L50
	ldr	r3, .L52+4
	ldr	r2, [r3]
	ldr	r1, [r3, #20]
	sub	r2, r2, r1
	str	r2, [r3]
	bx	lr
.L50:
	tst	r3, #16
	ldreq	r3, .L52+4
	ldreq	r2, [r3]
	ldreq	r1, [r3, #20]
	addeq	r2, r2, r1
	streq	r2, [r3]
	bx	lr
.L53:
	.align	2
.L52:
	.word	buttons
	.word	luffy
	.size	luffyUpdate, .-luffyUpdate
	.comm	shadowOAM,1024,4
	.comm	DIRECTION,1,1
	.comm	STATE,1,1
	.comm	luffy,48,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
